# GitHub Action for Git commit

This Action for git commits any changed files and pushes those changes back to the origin repository.

## Usage

An example workflow to commit and push any changes back to the GitHub origin repository:


```yaml
name: Grunt build and commit updated stylesheets

on: [push]

jobs:
  grunt-build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1

    - name: Compile with Grunt
      uses: elstudio/actions-js-build/build@v2
      with:
        wdPath: './web/themes/nw8'

    - name: Commit changes
      uses: elstudio/actions-js-build/commit@v2
      with:
        pushBranch: staging
        commitMessage: Regenerate css 
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### Secrets

* `GITHUB_TOKEN` - **Required**. The token to use for authentication with GitHub to commit and push changes back to the origin repository. ([more info](https://developer.github.com/actions/creating-github-actions/accessing-the-runtime-environment/#environment-variables))

### Inputs 

* `commitMessage` - **Optional**. Git Commit Message. Defaults to *Regenerate build artifacts.`
* `wdPath` - **Optional**. To specify a directory other than the repository root to check for changed files.
* `pushBranch` - **Optional**. The branch that changes will be pushed to. Default is the currently checked out branch.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
