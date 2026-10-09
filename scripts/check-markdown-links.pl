#!/usr/bin/env perl

use strict;
use warnings;

use Cwd qw(getcwd abs_path);
use File::Basename qw(dirname);
use File::Find;
use File::Spec;

my $root = abs_path(getcwd());
my %ignored_directories = map { $_ => 1 } qw(.git .idea node_modules);
my @markdown_files;

find(
    {
        no_chdir => 1,
        wanted   => sub {
            my $path = $File::Find::name;

            return if -l $path;
            if (-d $path) {
                $File::Find::prune = 1 if $ignored_directories{$_};
                return;
            }

            push @markdown_files, $path if -f $path && /\.md\z/;
        },
    },
    $root,
);

my @failures;
for my $file (@markdown_files) {
    open my $handle, '<', $file or die "Unable to read $file: $!\n";
    local $/;
    my $source = <$handle>;
    close $handle;

    while ($source =~ /\[[^\]]*\]\(([^)]+)\)/g) {
        my $original_target = $1;
        my $target = $original_target;
        $target =~ s/^\s+|\s+$//g;
        $target =~ s/^<(.*)>$/$1/s if $target =~ /^<.*>$/s;

        next if !$target
            || $target =~ /^#/
            || $target =~ /[{}]/
            || $target =~ /^(?:https?:|mailto:)/;

        $target =~ s/#.*\z//s;
        my $resolved = File::Spec->rel2abs($target, dirname($file));
        next if !$target || -e $resolved;

        push @failures, File::Spec->abs2rel($file, $root) . " -> $original_target";
    }
}

if (@failures) {
    print STDERR "Broken local Markdown links:\n";
    print STDERR "- $_\n" for @failures;
    exit 1;
}

print 'Checked ' . scalar(@markdown_files) . " Markdown files: local links are valid.\n";
