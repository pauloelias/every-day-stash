# Every Day Stash

Sample ExpressionEngine Website to demonstrate Stash concepts.

Created by [Paulo Elias](https://twitter.com/pauloelias)

---

## Table of Contents

1. [Project Overview](#overview)
2. [Detailed Documentation](documentation)
3. [Project Setup](#project-setup)
    1. [Frontend](#frontend)
    2. [Application/Backend](#backend)
4. [Configuration](#configuration)
5. [Notes](#notes)
6. [To Do](#todo)
7. [Credits](#credits)

---

## <a name="overview"></a> Project Overview

Sample ExpressionEngine Website to demonstrate Stash concepts.

---

## <a name="documentation"></a> Detailed Documentation

Detailed documentation can be found at:

* [Frontend Documentation](./docs/frontend.md)
* [Developer Documentation](./docs/developer.md)
* [Upgrade Log](./docs/upgrade_log.md)
* [Change Log](./docs/change_log.md)

---

## <a name="project-setup"></a> Project Setup

### <a name="frontend"></a> Frontend

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
	* Then visit [http://localhost:8080/](http://localhost:8080/) in your web browser
* Additional gulp tasks
  * Create project skeleton: ```gulp skeleton```
  * Clean project distribution directory (./public): ```gulp clean```
  * Build for Production to minify and optimize assets: ```NODE_ENV=production gulp```

More details, including a full task list, can be found in the [Frontend Documentation](./docs/frontend.md)

### <a name="backend"></a> Application/Backend

This is just a placeholder for now. Helpful for maintenance when you handoff or need to maintain a CMS/web app.

Full developer documentation can be found in the [Developer Documentation](./docs/developer.md)

---

## <a name="configuration"></a> Configuration

### Frontend Configuration

Detailed frontend configuration documentation can be found in [Frontend Documentation](./docs/frontend.md#configuration)

### Backend Configuration

Detailed backend configuration documentation can be found in [Developer Documentation](./docs/developer#configuration)

## <a name="notes"></a> Notes

---

## <a name="todo"></a> To Do

* **Documentation** Finish this damn documentation!

---

## <a name="credits"></a> Credits

* [Mark Croxton's Stash](https://github.com/croxton/Stash/)
* [Adrienne Travis](https://twitter.com/adrienneleigh) and her [EE Insider "Template Partials using Stash" article](http://eeinsider.com/articles/template-partials-using-stash)