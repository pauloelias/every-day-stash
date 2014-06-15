# Frontend Documentation

---

## Table of Contents

1. [Configuration](#configuration)
2. [Frontend Workflow](#workflow)

---

## <a name="workflow"></a> Frontend Workflow

This project does not use any frontend build systems to compile and optimize frontend assets.

---

## <a name="configuration"></a> Configuration

The configuration files can be found at:

```
bower.json
GemFile
gulpfile.js
package.json
```

### <a name="nvm"></a> [Node Version Manager (NVM)](https://github.com/creationix/nvm) OPTIONAL

NVM is used to manage multiple active node.js versions, similar to RVM (Ruby Version Manager), to help us sandbox our projects (as needed).

* [Learn more about and install NVM](https://github.com/creationix/nvm)

### <a name="node-modules"></a> Node Modules

Node Modules.

### <a name="rvm"></a> [Ruby Version Manager (RVM)](https://rvm.io/) OPTIONAL

RVM is a command-line tool that allows you to install, manage, and work with multiple ruby environments and gemsets to help us sandbox our projects (as needed).

* [Learn more and install RVM](https://rvm.io/)

### <a name="gems"></a> Ruby Gems

Ruby gems.

### <a name="bower"></a> Bower Components

Bower config.

### <a name="skeleton"></a> Static Skeleton Files

Skeleton files.

### Prerequisites

Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Vestibulum id ligula porta felis euismod semper. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Donec sed odio dui.

### To use

Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Vestibulum id ligula porta felis euismod semper. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Donec sed odio dui.

### Tips

Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Vestibulum id ligula porta felis euismod semper. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Donec sed odio dui.

---

## <a name="tasks"></a> Gulp Tasks

The ```./gulpfile.js``` contains the following tasks:

| Command | Dependencies | Description | Source Location | Distribution Location |
| ------- | ------------ | ----------- | --------------- | ---------------------
| ```gulp``` | clean | Cleans the distribution directory, creates the skeleton, and runs compilation tasks | | |
| ```gulp clean``` | | Cleans the distribution directory | | |
| ```gulp skeleton``` |  | Creates distribution directory and moves static skeleton files into it | ```./compile/skeleton/**``` | ```./public/*``` |
| ```gulp sass``` |  | Compiles SASS files to css then concatenates and minifies them  | ```./compile/scss/**/*.scss``` | ````./public/assets/css/**/*.css``` |
| ```gulp js``` |  | Concatenates and minifies javascript | ```./compile/js/app/main.js``` | ```./public/assets/js/main.js``` |
| ```gulp polyfills``` | | Concatenates and minifies polyfills | ```./compile/js/polyfills/polyfills.js``` | ```./public/assets/js/polyfills.js``` |
| ```gulp jade``` |  | Compiles jade files to html | ```./compile/jade/**/*.jade``` | ```./public/**/*.html``` |
| ```gulp images``` |  | Optimizes and moves images into the distribution directory | ```./compile/img/**/*.{png,gif,jpg,jpeg,ico}``` | ```./public/assets/img/**/*``` |
| ```gulp svgmin``` |  | Optimizes and moves SVGs into the distribution directory | ```./compile/img/**/*.svg``` | ```./public/assets/img/**/*``` |
| ```gulp server``` | | Starts the local server with Live Reload enabled | | |
| ```gulp watch``` | server | Watches changes to files and triggers LiveReload | | |