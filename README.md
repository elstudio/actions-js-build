# GitHub Actions for JavaScript build tools (Gulp, Grunt, NPM -- and git)

Run JS build tasks with Gulp, Grunt or NPM, then commit any changed files and push them back to your original repository.

Perfect for Grunt or Gulp tasks that do CSS (or SASS/LESS) compilation or JS transpilation.  If your build task changes files, these actions are for you.

This repository contains two actions that may be used independently -- typically one after another:

- **build** (elstudio/actions-js-build/build@v4): Looks for a gulpfile.js or Gruntfile.js in the working directory, then installs any required npm packages and runs the appropriate build tool. If it finds neither gulp or grunt, the script runs npm. Set the workflow `args` arguments to run the tasks of your choice.
- **commit** (elstudio/actions-js-build/commit@v4): Commits any file changes, and pushes them back to the current branch of the origin repository on GitHub.


## Usage

An example workflow to run `grunt default` task to build, test, then commit and push any changes back to the GitHub origin repository:

```yaml
name: Grunt build and commit updated stylesheets

on: [push]

jobs:
  grunt-build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - uses: actions/setup-node@v2
      with:
        node-version: 12

    - name: Compile with Grunt
      uses: elstudio/actions-js-build/build@v4
      with:
        wdPath: './web/themes/nw8'

    - name: Commit changes
      uses: elstudio/actions-js-build/commit@v4
      with:
        commitMessage: Regenerate css 
```



### Inputs

* `wdPath` - **Optional**. To specify a directory other than the repository root where NPM's Package.json and either gulpfile.js or Gruntfile.js may be found.
