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
	8. [Uploads](#uploads)
	9. [Templates](#templates)
	10. [Member Groups](#member-groups)
	11. [Add-ons](#add-ons)
5. [Notes](#notes)
6. [Credits](#credits)

---

## <a name="overview"></a> Project Overview

This is a sample ExpressionEngine Website to demonstrate common [Stash](https://github.com/croxton/Stash) concepts. This is by no means an exhaustive reference. It is meant to be used as a teaching tool to introduce Stash to beginners and built upon to incorporate more advanced techniques.

This project comes bundled with a modified version of [QuickBoot](https://github.com/QuickPixel/quickboot). QuickBoot is a frontend bootstrap used to build assets, watch files for changes, and provide a local development server with livereload for frontend assets.

While [QuickBoot](https://github.com/QuickPixel/quickboot) comes with a lightweight development server, the included server is meant to be used during static template development. Use your local version of Apache, PHP, and MySQL to serve your EECMS site as you normally would. When you use ```gulp watch``` with live reload you will still see changes you make to your EECMS templates and Stash files.

---

## <a name="project-setup"></a> Project Setup

### <a name="frontend"></a> Frontend (OPTIONAL)

* Clone and cd into the repo
    * ```git clone https://github.com/pauloelias/every-day-stash.git && cd every-day-stash``` 
* Change the **project name** (currently every-day-stash) in ```.ruby-gemset```. Change directory back out and cd back in (or close and reopen the terminal window).
* Change the **project name** and **project details** in ```package.json```
* Install Node
    * [Node.js Installer](http://nodejs.org/)
* Install Gulp globally
    * ```npm install -g gulp```
    * You might need to ```sudo``` to install gulp globally E.G. ```sudo npm install -g gulp```
* Install [Bundler](http://bundler.io/)
	*  ```gem install bundler```
* Install ruby gems and  deepndencies
    * ```bundle install```
* Install node modules and bower dependencies
    * ```npm install```
* Build your project ```gulp```
* Watch project assets with Gulp and start local development server
	* ```gulp watch```
	* Then visit your local site in your web browser
* Additional gulp tasks
  * Create project skeleton: ```gulp skeleton```
  * Clean project distribution directory (./public): ```gulp clean``` **Be careful, this blows away ./public**
  * Build for Production to minify and optimize assets: ```NODE_ENV=production gulp```

### <a name="backend"></a> ExpressionEngine (Sort of important ;)

1.  Follow the [*Frontend Configuration*](#frontend) (OPTIONAL)
2. Setup your local environtment:
	1. Download [ExpressionEngine 2.8.1](http://ellislab.com/expressionengine) (this site should work with [EE Core](https://store.ellislab.com/#ee-core))
	2. Clone this project (if you haven't already): 	```git clonehttps://github.com/pauloelias/every-day-stash.git && cd every-day-stash```
	3. Configure a virtual host for ```everydaystash.dev```
	4. Setup a MySQL database and import data: ```./data/every-day-stash.sql```
	5. Copy the EECMS source files to:
		1. ```themes``` => ```./public/themes```
		2. ```system``` => ```./public/assets/ee/system``` (delete the installer files)
	6. Update the provided [Focus Lab, LLC's EE Master Config](https://github.com/focuslabllc/ee-master-config) files:
		1. Rename: ```./public/assets/ee/config/config.local.php.sample``` => ```./public/assets/ee/config/config.local.php```
		2. Enter your database settings into ```./public/assets/ee/config/config.local.php```
		3. Edit EECMS's config.php and databse.php files to reference the EE Master Config:
			1. **config.php** ```./public/assets/ee/system/expressionengine/config/config.php```
				1. Add to the bottom of the file, below "End of file config.php": ```require $_SERVER['DOCUMENT_ROOT'] . '/assets/ee/config/config.master.php';```
			2. **database.php** ```./public/assets/ee/system/expressionengine/config/database.php```
				1. Add to the bottom of the file, below "End of file config.php": ```require $_SERVER['DOCUMENT_ROOT'] . '/assets/ee/config/config.master.php';```
	7. Review and modify settings as needed in:
		1.  ```./public/assets/ee/config/config.master.php```
		2.  ```./public/assets/ee/config/config.master.extended.php```
		3.  ```./public/assets/ee/config/config.master.third.php```
	8. Review and adjust permissions as needed [per the User Guide (make note of the new locations!)](http://ellislab.com/expressionengine/user-guide/installation/installation.html#set-file-permissions)
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
* Stash: ```./public/assets/ee/views/stash```
* Templates: ````./public/assets/ee/views/templates```
* Control panel: ```./public/cp/index.php``` (instead of leaving ```admin.php``` at the public web root)
* Third-party add-ons: ```./public/assets/ee/add-ons```
* Third-party themes: ```./public/themes/third_party```

#### URLs

* Frontend: http://everydaystash.dev/
* Control Panel: http://everydaystash.dev/cp/
	* USER: stash
	* PASS: 21wqsaxZ

### <a name="naming-conventions"></a> Naming Conventions

#### Variables, Channels, Snippets

| Variable Prefix | Type | Sample |
| -------------------- | ------- | ---------- |
| cat_cf_ | Category Custom Field | cat_cf_field_name |
| cf_ | Custom Field | cf_field_name |
| ch_ | Channel | ch_channel_name |
| gv_ | Global Variable | gv_global_var |
| pr_ | Preload Replace | pr_preload_replace |
| sn_ | Snippet | sn_snippet_name |

#### Stash Files

| File Prefix | Type | Sample |
| -------------- | ------- | ---------- |
| ( _ ) Underscore | Stash Partial | ( _ ) stash_partial.html |
| md_ | Stash Model | md_stash_model.html |
| sn_ | Stash Partial | _stash_partial.html |

### Site Architecture

#### <a name="global-variables"></a> Global Variables

| Variable | Description | Location |
| ----------- | ----------------- | ------------ |
| {gv_env} | Shorthand enironmental variable  | ```./public/assets/ee/config/config.master.php``` |
| {gv_env_full} | Full enironmental variable  | ```./public/assets/ee/config/config.master.php``` |
| {gv_param_disable_default} | Disables categories, pagination, member_data |  ```./public/assets/ee/config/config.master.php``` |
| {gv_param_disable_all}  | Disables categories, custom_fields, member_data, pagination |  ```./public/assets/ee/config/config.master.php``` |
| {gv_param_keep_cats} | Disables pagination, member_data |  ```./public/assets/ee/config/config.master.php``` |
| {gv_param_cache_param} | cache="yes" refresh="10" |  ```./public/assets/ee/config/config.master.php``` |
| {gv_param_cache_param} | -cache="yes" refresh="10" |  ```./public/assets/ee/config/config.master.php``` |
| {gv_date_time} | %g:%i %a |  ```./public/assets/ee/config/config.master.php``` |
| {gv_date_short} | %F %d, %Y |  ```./public/assets/ee/config/config.master.php``` |
| {gv_date_full} | %F %d %Y, %g:%i %a |  ```./public/assets/ee/config/config.master.php``` |
| {gv_theme_url} | $base_url . 'themes/site_themes/default' |  ```./public/assets/ee/config/config.master.php``` |

#### <a name="channels"></a> Channels

| Channel Name | Channel Short Name | Categories | Statuses | Fields |
| ---------------------- | ----------------------------- | ---------------  | ----------- | --------- |
| Blog | ch_blog | Blog Categories | Statuses | Shared Fields |
| Pages | ch_pages |  | Statuses | Shared Fields |
| Portfolio | ch_portfolio |  | Statuses | Portfolio Fields |
| Services | ch_services |  | Statuses | Services Fields |
| Team | ch_team |  | Statuses | Team Fields |

#### <a name="custom-fields"></a> Custom Fields

##### Porfolio Fields

| Field Name | Field Short Name | Field Type | Required | Searchable | Default | Notes |
| ----------------  | ------------------------ | --------------- | ------------- | ---------------- | ---------- | --------- |
| Description  | {cf_port_description} | Textarea | N | Y | Y | Rows: 9, Formatting: XHTML |
| Gallery  | {cf_port_gallery} | Grid | N | N | Y | Min: 1, Max: 7, 1) Data Type: File, Label: Image, Field Name: image, Allowed type: image, Directory: Portfolio Images, Show Existing: Yes 2) Data Type: Text Input, Label: Caption, Field Name: caption, Formatting: None, Content: All, Limit: 256 |
| Services  | {cf_port_services} | Relationships | N | N | Y | Channels: Services, Category: Any, Authors: Any, Status: Open, Multiple: Y |

##### Services Fields

| Field Name | Field Short Name | Field Type | Required | Searchable | Default | Notes |
| ----------------  | ------------------------ | --------------- | ------------- | ---------------- | ---------- | --------- |
| Icon  | {cf_service_icon} | Tile | N | N | Y | Allowed: Image, Directory: Service Images, Show Existing: Y |
| Description  | {cf_service_description} | Textarea | N | Y | Y | Rows: 9, Formatting: XHTML |

##### Shared Fields

| Field Name | Field Short Name | Field Type | Required | Searchable | Default | Notes |
| ----------------  | ------------------------ | --------------- | ------------- | ---------------- | ---------- | --------- |
| Teaser  | {cf_shared_teaser} | Textarea | N | N | Y | Rows: 3, Formatting: None |
| Body  | {cf_shared_body} | Textarea | N | Y | Y | Rows: 9, Formatting: XHTML |
| Image  | {cf_shared_image} | File | N | N | Y | Allowed: Image, Directory: Site Uploads, Show Existing: Y |
| Featured Work  | {cf_shared_featured_work} | Relationships | N | N | Y | Channels: Portfolio, Category: Any, Authors: Any, Status: Open, Multiple: Y |

##### Team Fields

| Field Name | Field Short Name | Field Type | Required | Searchable | Default | Notes |
| ----------------  | ------------------------ | --------------- | ------------- | ---------------- | ---------- | --------- |
| Postion  | {cf_team_position} | Text Input | N | Y | Y | Length: 128, Formatting, None, Content: All |
| Photo  | {cf_team_photo} | File | N | N | Y | Allowed: Image, Directory: Team Images, Show Existing: Y |

#### <a name="statuses"></a> Statuses

| Status Group | Status Name | Status |
| ------------------ | ------------------- | -------- | 
| Statuses | Open | open |
|  | Closed | closed |

#### <a name="categories"></a> Categories

| Category Group | Order | Category Name | Category URL Title | 
| ----------------  | --------------- | ----------------------- | -------------------------- |
| Blog Categories | Alpha | Article | article |
| | | Case Study | case-study |
| | | News | news |

#### <a name="uploads"></a> Upload Directories

| ID | Name | Path | URL | File Types | Category Groups | Manipulations | Access | Notes |
| --- | --------  | ------ | ------ | ------------- | ------------------------------- | ------------------------------ | ---------- |
| 1 | Site Uploads | ```./public/assets/uploads/site/``` | ```/assets/uploads/site/``` | All |  |  | Superadmins, Members |  |
| 2 | Team Images | ```./public/assets/uploads/team/``` | ```/assets/uploads/team/``` | Images |  |  | Superadmins, Members |  |
| 3 | Services Images | ```./public/assets/uploads/services/``` | ```/assets/uploads/services/``` | Images |  |  | Superadmins, Members |  |
| 4 | Portfolio Images | ```./public/assets/uploads/portfolio/``` | ```/assets/uploads/portfolio/``` | Images |  |  | Superadmins, Members |  |

#### <a name="templates"></a> Templates

**FINISH THIS**

## <a name="add-ons"></a> Add-ons

**FINISH THIS**

#### <a name="member-groups"></a> Member Groups

Superadmin, yo.

---

## <a name="notes"></a> Notes

TBD.

---

## <a name="credits"></a> Credits

* [Mark Croxton's Stash](https://github.com/croxton/Stash/)
* [Adrienne Travis](https://twitter.com/adrienneleigh) and her [EE Insider "Template Partials using Stash" article](http://eeinsider.com/articles/template-partials-using-stash)