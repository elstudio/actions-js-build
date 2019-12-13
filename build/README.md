# GitHub Actions for JavaScript build tools (Gulp, Grunt or NPM)

Run JS build tasks with Gulp, Grunt or NPM.

Perfect for Grunt tasks that do CSS (or SASS/LESS) compilation or JavaScript transpilation.  

- **build** (elstudio/actions-js-build/build@master): Looks for a gulpfile.js or Gruntfile.js in the working directory, then installs any required npm packages and runs the build tool. If it finds neither gulp or grunt, the script runs npm. Set the workflow `args` arguments to run the tasks of your choice.

This Action for [npm](https://www.npmjs.com/) installs any required npm packages, then installs and runs any installed JavaScript build tools -- currently either Gulp or Grunt.

## Usage

An example workflow to run the `grunt default` task to build, test. The second action commits and pushes any changes back to the GitHub origin repository:


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
      uses: elstudio/actions-js-build/commit@v3
      with:
        commitMessage: Regenerate css 
```


### Inputs

* `wdPath` - **Optional**. To specify a directory other than the repository root where NPM's Package.json and either gulpfile.js or Gruntfile.js may be found.


## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
