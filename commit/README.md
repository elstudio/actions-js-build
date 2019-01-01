# GitHub Action for Git commit

This Action for git commits any changed files and pushes those changes back to the origin repository.

## Usage

An example workflow to commit and push any changes back to the GitHub origin repository:

```hcl
workflow "Commit and Push" {
  on = "push"
  resolves = ["Commit and Push"]
}

action "Commit and Push" {
  uses = "elstudio/actions-js-build/commit@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    WD_PATH = "./web/themes/nw8"
    PUSH_BRANCH = "staging"
  }
}
```

### Secrets

* `GITHUB_TOKEN` - **Required**. The token to use for authentication with GitHub to commit and push changes back to the origin repository. ([more info](https://developer.github.com/actions/creating-github-actions/accessing-the-runtime-environment/#environment-variables))

### Environment variables

* `WD_PATH` - **Optional**. To specify a directory other than the repository root to check for changed files.
* `PUSH_BRANCH` - **Optional**. The branch that changes will be pushed to. Default is the currently checked out branch.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
