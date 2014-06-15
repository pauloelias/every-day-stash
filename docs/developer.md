# Developer Documentation for Every Day Stash
---

## Table of Contents

1. [Introduction](#introduction)
2. [Site Overview](#site-overview)
    1. [Naming Conventions](#naming-conventions)
    2. [Version Control](#version-control)
    3. [Configuration](#configuration)
    4. [Deployments](#deployments)
3. [Site Architecture](#site-architecture)
    1. [Global Variables](#global-variables)
    2. [Sections/Channels](#channels)
    3. [Categories](#categories)
    4. [Tags](#tags)
    5. [Member Groups](#member-groups)
    6. [Templates](#templates)
4. [Plugins/Add-ons](#plugins)

---

## <a name="introduction"></a> Introduction

These notes are intended for the developer(s) maintaining the Every Day Stash.

---

## <a name="site-overview"></a> Site Overview

This documentation describes how Every Day Stash was developed.

Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Vestibulum id ligula porta felis euismod semper. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Donec sed odio dui.

---

### <a name="naming-conventions"></a> Naming Conventions

Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Vestibulum id ligula porta felis euismod semper. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Donec sed odio dui.

### <a name="version-control"></a> Version Control

Files for this site are kept in a Git repository. All files are versioned back to original static site preview with the client. Developers check in to BitBucket and we deploy to all non-local environments (development, staging, and production). Ignored files include .htaccess, caches & upload directories. See the ```./.gitignore``` file for the full ignore list.

### <a name="configuration"></a> Configuration

#### Cross-environment configuration

Maecenas faucibus mollis interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Donec ullamcorper nulla non metus auctor fringilla. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Nulla vitae elit libero, a pharetra augue.

#### Server Environments

Every Day Stash is running in two environments. Local copies are on each independent developer's computer. There is a private Development and a public Production environment.

##### Environments

###### Local

* Specific to each developer.
* Developers are encouraged to run the latest stable versions of PHP and MySQL

###### Development

* Located at [cli.qp-dev.com](http://cli.qp-dev.com)
* PHP version 5.3.10
* MySQL version 5.5.35
* Apache 2.2.22

###### Staging

* Located at [cli.qp-staging.com](http://cli.qp-staging.com)
* PHP version 5.3.10
* MySQL version 5.5.35
* Apache 2.2.22

###### Production

* Located at [domain.com](http://domain.com)
* PHP version 5.3.10
* MySQL version 5.5.35
* Apache 2.2.22

### <a name="deployments"></a> Deployments

Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Vestibulum id ligula porta felis euismod semper. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Donec sed odio dui.

In addition to the core files in version control, script (or manually migrate) these directories/files across environments. Typically user generated content (UGC), file uploads, and other files that are not kept in version control.

* ```./public/assets/uploads```

---

## <a name="plugins"></a> 3rd Party Plugins

---