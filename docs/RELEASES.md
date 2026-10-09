# Releases and Versioning

FDP uses semantic versioning for published releases.

- **Patch:** clarifications, examples, and fixes that do not change the workflow contract.
- **Minor:** backwards-compatible new guidance, templates, or optional workflow capabilities.
- **Major:** a changed approval, artifact, branch, or commit requirement that requires consumers to alter their process.

Publish a signed annotated Git tag as `vMAJOR.MINOR.PATCH` after the README links, examples, and Markdown checks pass. Create a GitHub release from that tag with a concise list of workflow-contract changes and any migration note. Consumers pinned through a subtree choose when to pull a release; they should review release notes before updating.

The repository has not yet declared its first public release tag. The first tag should be created only after the public repository and its linked evidence are available to readers.
