# GitHub Action for Git commit

This Action for git commits any changed files and pushes those changes back to the origin repository.

**V3 or later of this action (elstudio/actions-js-build/commit@v3) requires actions/checkout@v2 or later.**

## Usage

An example workflow to commit and push any changes back to the GitHub origin repository:


```yaml
name: Grunt build and commit updated stylesheets

on: [push]

jobs:
  grunt-build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2

    - name: Compile with Grunt
      uses: elstudio/actions-js-build/build@v2
      with:
        wdPath: './web/themes/nw8'

    - name: Commit changes
      uses: elstudio/actions-js-build/commit@v4-beta
      with:
        commitMessage: Regenerate css 
```

### Inputs 

* `commitMessage` - **Optional**. Git Commit Message. Defaults to "Regenerate build artifacts."
* `wdPath` - **Optional**. To specify a directory other than the repository root to check for changed files.

