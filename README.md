# Every Day Stash

Sample ExpressionEngine portoflio website to demonstrate Stash concepts.

Created by [Paulo Elias](https://twitter.com/pauloelias)

---

## Table of Contents

1. [Project Overview](#overview)
2. [Project Setup](#project-setup)
    1. [Frontend](#frontend)
    2. [ExpressionEngine](#backend)
4. [Configuration](#configuration)
	1. [ExpressionEngine](#expressionengine)
	2. [Naming Conventions](#naming-conventions)
	3. [Global Variables](#global-variables)
	4. [Channels](#channels)
	5. [Custom Fields](#custom-fields)
	6. [Statuses](#statuses)
	7. [Categories](#categories)
	8. [Member Groups](#member-groups)
5. [Notes](#notes)
6. [To Do](#todo)
7. [Credits](#credits)

---

## <a name="overview"></a> Project Overview

This is a sample ExpressionEngine Website to demonstrate common [Stash](https://github.com/croxton/Stash) concepts. This is by no means an exhaustive reference. It is meant to be used as a teaching tool to introduce Stash to beginners and built upon to incorporate more advanced techniques.

This project comes bundled with a modified version of [QuickBoot](https://github.com/QuickPixel/quickboot). QuickBoot is a frontend bootstrap used to build assets, watch files for changes, and provide a local development server with livereload for frontend assets.

While [QuickBoot](https://github.com/QuickPixel/quickboot) comes with a lightweight development server, the included server is meant to be used during static template development. Use your local version of Apache, PHP, and MySQL to serve your EECMS site as you normally would. When you use ```gulp watch``` with live reload you will still see changes you make to your EECMS templates and Stash files.

---

## <a name="project-setup"></a> Project Setup

### <a name="frontend"></a> Frontend (OPTIONAL)

* Change the **project name** (currently every-day-stash) in ```.ruby-gemset```. Close and reopen the terminal window.
* Change the **project name** and **project details** in ```package.json```
* Install Node
    * [Node.js Installer](http://nodejs.org/)
* Install Gulp globally
    * ```npm install -g gulp```
    * You might need to ```sudo``` to install gulp globally E.G. ```sudo npm install -g gulp```
* Clone and cd into the repo
    * ```git clone https://github.com/QuickPixel/quickboot.git && cd quickboot```
* Install [Bundler](http://bundler.io/)
	*  ```gem install bundler```
* Install ruby gems and  deepndencies
    * ```bundle install```
* Install node modules and bower dependencies
    * ```npm install````
* Build your project ```gulp```
* Watch project assets with Gulp and start local development server
	* ```gulp watch```
	* Then visit your local site in your web browser
* Additional gulp tasks
  * Create project skeleton: ```gulp skeleton```
  * Clean project distribution directory (./public): ```gulp clean```
  * Build for Production to minify and optimize assets: ```NODE_ENV=production gulp```

### <a name="backend"></a> ExpressionEngine (Sort of important ;)

1.  Follow the [*Frontend Configuration*](#frontend) (OPTIONAL)
2. Setup your local environtment:
	1. Download [ExpressionEngine 2.8.1](http://ellislab.com/expressionengine) (this site should work with [EE Core](https://store.ellislab.com/#ee-core))
	2. Clone this project: 	```git clonehttps://github.com/pauloelias/every-day-stash.git && cd every-day-stash```
	3. Configure a virtual host for ```everydaystash.dev```
	4. Setup a MySQL database and import data: ```./data/every-day-stash.sql```
	5. Copy the EECMS source files to:
		1. ```themes``` => ```./public/themes```
		2. ```system``` => ```./public/assets/ee/system``` (delete the installer files)
	6. Update the provided [Focus Lab, LLC's EE Master Config](https://github.com/focuslabllc/ee-master-config) files:
		1. Rename: ```./public/assets/ee/config/config.local.php.sample``` => ```./public/assets/ee/config/config.local.php```
		2. Enter your database settings into ```./public/assets/ee/config/config.local.php```
		3. Edit EECMS's config.php and databse.php files to reference the EE Master Config:
			1. **config.php**" ```./public/assets/ee/system/expressionengine/config/config.php```
				1. Add to the bottom of the file, below "End of file config.php": ```require $_SERVER['DOCUMENT_ROOT'] . '/assets/ee/config/config.master.php';```
			2. **database.php**" ```./public/assets/ee/system/expressionengine/config/database.php```
				1. Add to the bottom of the file, below "End of file config.php": ```require $_SERVER['DOCUMENT_ROOT'] . '/assets/ee/config/config.master.php';```
	7. Review and modify settings in as needed:
		1.  ```./public/assets/ee/config/config.master.php```
		2.  ```./public/assets/ee/config/config.master.extended.php```
		3.  ```./public/assets/ee/config/config.master.third.php```
	8. Review and adjust permission as needed [per the User Guide](http://ellislab.com/expressionengine/user-guide/installation/installation.html#set-file-permissions)
	9. Visit the site and log into the control panel:
		1. http://everydaystash.dev/
		2. http://everydaystash.dev/cp/
			1. USER: stash
			2. PASS: 21wqsaxZ

---

## <a name="configuration"></a> Configuration

### <a name="expressionengine"></a> ExpressionEngine Configuration

#### File locations

* EE Master Config files: ```./public/assets/ee/config```
* EECMS system: ```./public/assets/ee/system```
* EECMS system cache: ```./public/assets/ee/system/expressionengine/cache```
* EECMS images: ```./public/assets/ee/images```
* Cache (add-ons's etc.): ```./public/cache```
* Uploads: ```./public/assets/uploads```
* Control panel: ```./public/cp/index.php``` (instead of leaving ```admin.php``` at the public web root)
* Third-party add-ons: ```./public/assets/ee/add-ons```
* Third-party add-ons: ```./public/themes/third_party```

#### URLs

* Frontend: http://everydaystash.dev/
* Control Panel: http://everydaystash.dev/cp/
	* USER: stash
	* PASS: 21wqsaxZ

### <a name="naming-conventions"></a> Naming Conventions

This project uses the following naming conventions:

### Site Architecture

#### <a name="global-variables"></a> Global Variables

TBD.

#### <a name="channels"></a> Channels

TBD.

#### <a name="custom-fields"></a> Custom Fields

TBD.

#### <a name="statuses"></a> Statuses

TBD.

#### <a name="categories"></a> Categories

TBD.

#### <a name="member-groups"></a> Member Groups

TBD.

---

## <a name="notes"></a> Notes

TBD.

---

## <a name="credits"></a> Credits

* [Mark Croxton's Stash](https://github.com/croxton/Stash/)
* [Adrienne Travis](https://twitter.com/adrienneleigh) and her [EE Insider "Template Partials using Stash" article](http://eeinsider.com/articles/template-partials-using-stash)