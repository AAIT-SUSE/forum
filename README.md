<h1 align=center>Envision 英文文档</h1>
<p align=center>
<img src="https://img.shields.io/badge/version-1.0.0-red.svg"> <img src="https://img.shields.io/badge/founder-%E8%94%A1%E4%BB%B2%E6%99%A8-orange.svg"> <img src="https://img.shields.io/badge/%E5%9B%9B%E5%B7%9D%E8%BD%BB%E5%8C%96%E5%B7%A5-AAIT-brightgreen.svg"> <img src="https://img.shields.io/badge/status-PreRelease-blue.svg">
</p>
   
<p align=center><b>一份中文的文档可以在 [这里](https://github.com/AAIT-SUSE/forum/blob/master/README.en.md) 找到.</b></p>

<p align=center>Want to help with the translation? Read the [Contribution Guide here](https://github.com/AAIT-SUSE/forum/blob/master/CONTRIBUTION.en.md).</p>

<br>

> Envision is an official APP of AAIT(Association for Artificial Intelligence Technology) of SUSE. Envision provides a platform where users are encouraged to share inspirations and exchange ideas.

**By reading through this documentation you will:**
- Get a copy of this project;
- Running the development version of the project on your machine;
- Get to know how the project works, and write your first line of code;
- Contribute to the project.

## 1 Client Side Enviroment

> This sction covers everything you need to setup the client side developement. If you are a server-side programmer, please skip this section.

Envision is built with **Vue.js**, a responsive, lightweight and progressive javascript framework. Vue.js is created by Chinese developer [Evan You](https://github.com/yyx990803) and is now even popular than react.js (by Facebook) and Angular (by Google). If you need more information on Vue.js, please follow [this link](https://vuejs.org/index.html).

Also, a lot of other kits or frameworks are involved during the development of Envision. We use **Vuetify** as its UI component library, and many other open source third party addons/plugins. You can see a full list of dependencies in *section 1.4*.

In order to run the project in your local enviroment, you must have all the frameworks and dependencies installed on your machine. A easiest way of doing so is to install them via `npm`.

### 1.1 Install `npm`

`npm` is a popular package management tool. If you already have `npm` installed on your machine, skip this section.

If you haven't installed `npm` yet, click the link below to download and install `node.js` with `npm` : [https://www.npmjs.com/get-npm](https://www.npmjs.com/get-npm).

Follow the instruction you will easily get things done. But be advised, `npm` is **not** your only option. You can use other pakage management tools such as `yarn`. Vue.js and vuetify ***DO*** provide other ways of installation, you can easily find solutons online or at [vuetify official website](https://vuetifyjs.com/zh-Hans/getting-started/quick-start).
### 1.2 Install vue.js and vuetify

When you have `npm` installed on your machine, you need to install `vue.js` and `vuetify`, two primary frameworks of Envision. To do this, launch your CLI (Command Line Interface), and excute the following command:

```bash
> npm install @vue/cli -g
```

This command will download and install vue.js CLI. After that, install vuetify with another similar command:

```bash
> npm install vuetify --save
```

Once the installation finished, you are ready to create project directory. If you encounter any problmes, **refer to this link for help: [https://vuetifyjs.com/zh-Hans/getting-started/quick-start](https://vuetifyjs.com/zh-Hans/getting-started/quick-start)**

### 1.3 Create vue applications

Once you have done all the preperations, you should create a new vue application.  Excute the following commands in you CLI:

```bash
# cd to a folder where project is going to be setup and init
> cd xxx

# create a vue application
> vue create your-app-name

# you need to make multiple choices during this process,
# but it's okay to leave them as default

# add vuetify to your vue application
> vue add vuetify
```

Then, `cd` to your project folder, and excute

```bash
> npm run serve
```

to run the developement server. If everything is done correctly, your CLI will display a prompt of IP addresses your app is now running at. For the local machine, visit

```bash
http://localhost:8080
```

to preview your application. You can also preview mobile version on your mobile browser. Make sure that your mobile device is connected to the same LAN, and launch browser, type the following address:

```bash
your.dev.machine.ip:8080    #e.g. 192.168.1.100:8080
```

### 1.4 Install dependencis

**Be advised, the content of this part is possible to change**

Envision stands on gaints' shoulders. In order to run this project in development enviroment, you will also need to install some third party packages based on **vue.js** and **vuetify**. The following is a list about what dependencis you should install and the installation commands of them. 

 - vue router. `npm install vue-router`
 - axios. `npm install axios`
 - quill editor for vue. `npm install vue-quill-editor`
 - vuelidate. `npm install vuelidate`
 - vuex. `npm install vuex`

You can install those dependencis simply by using CLI with commands listed above. **BUT It is highly recommended that you search and visit their website and documentations before install them. **

 
### 1.5 Clone the current version of Envision

Now it's the final step. Here is a checklist, make sure you have done all the work listed below:

1. install npm and node.js
1. install vue
2. install vuetify
3. install all the dependencies

Next, you need to pull the source code of Envision from our github repository. Manually download or use `git clone` command to get a copy of the project, and place all the files into your project root directory.

After that, your project directory structure may look like this:

```bash
	myProjectFolder/
    	- server/ # contains server side source code
    	- public/ # contains static resources and entry files
    	- src/ # contains all client side source code
    		- assets/ #contains all the assets (mostly images)
    		- components/ # contains all vue components
    		- plugins/ # contains config files of installed dependencies
    			- router/router.js # configs of router paths and components
    		- views/ # views that need to be mounted via router link
    	- App.vue # main vue component
    	- main.js # main javascript file and all js entry
```

For the most of your part, you will work under directory `src/`.

Now you can have a try with your ready-to-go project. If you want to contribute to the project, please read the [Contribution Guide](https://github.com/AAIT-SUSE/forum/blob/master/CONTRIBUTION.en.md).

## 2 Server Side Environment

> This section will lead you through server side environment setup. If you are a client side programmer, please read the 1st section.

Envision uses **Python** as server side language, with the powerful partener **Django framework**. To begin with, you need to install them on your developement machine.

We use **MySQL** database, so you also need to install MySQL, and a visual database management tool if interested.

A easiest way to get things prepared is to install them via `pip`.

### 2.1 Install python 3.x and `pip`

**Get Python** from [python official site](https://www.python.org/).

Normally, python for Windows contains the package manager `pip`. So if you have `pip` installed with python, skip to next section.

If you haven't installed `pip` yet, following the link below to download and install [ez_setup.py](https://bootstrap.pypa.io/ez_setup.py).

```bash
> python ez_setup.py

> easy_install pip
```

It is super easy to use `pip` to install and manage the packages involved in your python project. A quick start of using `pip` can be found [here](https://pip.pypa.io/en/stable/quickstart/).

### 2.2 Install Django

Once you have `pip` setup, use it to install Django.

```bash
> pip install Django
```

Lanuch your CLI, create a project with Django:

```bash
# the project path can be anywhere, 
# the following path is just an example.

> cd D:

> cd django

# setup and init Django in the currrent folder
> python setup.py install
```

### 2.3 Create Django application

```bash
# cd to your project folder
> cd xxx

# start a project
> django-admin startproject xxxx
```

Then excute the following command to create an app of the current project:

```bash
> django-admin startapp sus
```

If this process exit with success, you will be able to see the project structure. Find a python file named `view.py`, then write your first line of code in django:

```python
def index(request):
	return HttpResponse("hello world!")

```

Then add your app into settings by editing the `settings.py` file:

```python
INSTALLED_APPS=[
.....,
.....,
.....,
'sus' # add your app here
]

```

And also, due to the `MVC` design of Django, you need to set the route of your app view in `urls.py`

```python
urlpatterns=[
	..........,
	url(r'^index/',sus.views.urls) # add your pattern here
]

```

Finally everything is done, you can run the following command to see if the project is running well:

```bash
> python manage.py runserver
```


### 2.4 Install mysql

Download MySQL [here](https://dev.mysql.com/downloads/installer/).

Install MySQL and config you own database password.
