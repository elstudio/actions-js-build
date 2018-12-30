# GitHub Actions for JavaScript build tools

This Action for [npm](https://www.npmjs.com/) installs any required npm packages, then installs and runs any installed JavaScript build tools -- currently either Gulp or Grunt.

## Usage

An example workflow to build, test, then commit and push any changes back to the GitHub origin repository:

```hcl
workflow "Grunt compile" {
  on = "push"
  resolves = ["Commit and Push"]
}

action "Build" {
  uses = "elstudio/actions-js-build/build@master"
  env = {
    WD_PATH = "./web/themes/nw8"
  }
  args = "default"
}

action "Commit and Push" {
  uses = "elstudio/actions-js-build/commit@master"
  needs = ["Build"]
  secrets = ["GITHUB_TOKEN"]
}
```

### Secrets

* `GITHUB_TOKEN` - **Required**. The token to use for authentication with GitHub to commit and push changes back to the origin repository. ([more info](https://developer.github.com/actions/creating-github-actions/accessing-the-runtime-environment/#environment-variables))

### Environment variables

* `WD_PATH` - **Optional**. To specify a directory other than the repository root where NPM's Package.json and either gulpfile.js or Gruntfile.js may be found.


## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
