<h1 align=center>AAIT Official Forum </h1>
<p align=center>
<img src="https://img.shields.io/badge/version-0.0.1-red.svg"> <img src="https://img.shields.io/badge/founder-%E8%94%A1%E4%BB%B2%E6%99%A8-orange.svg"> <img src="https://img.shields.io/badge/%E5%9B%9B%E5%B7%9D%E8%BD%BB%E5%8C%96%E5%B7%A5-AAIT-brightgreen.svg"> <img src="https://img.shields.io/badge/status-Unfinished-lightgrey.svg">
</p>

<p align=center><b>注意, 这仍是一个未完成版本。</b></p>

> AAIT Official Forum is a UGC based website and mobile hybrid APP for members of AAIT to exchange ideas and share inspirations.

**By reading through this documentation you will:**
- Get a copy of this project;
- Running the development version of the project on your machine;
- Get to know how the project works, and write your first line of code;
- Contribute to the project.

## 1 Client Side Enviroment

> 这一部分文档将会指引你搭建客户端的本地开发环境，并初步了解如何使用 Vuetify 框架进行前端开发.

AAIT Forum 项目，*以下简称AF*，在客户端使用基于Vue.js，且遵循谷歌material design 标准的 **vuetify** 框架. 

In order to run this project in development environment, you'll need **a virtual server, vue.js framework, and vuetify framework** installed on your machine. But in this part, I will only guide you through client side enviroment building.

一个最快捷的部署前端开发环境的方式就是通过`npm`安装所需的包。

### 1.1 Install NPM

One way to quickly get all things prepared is to install them via `npm`. If you have `npm` installed on your machine, skip this section.

If you haven't installed `npm` yet, following the link below to download and install `node.js` with `npm` : [https://www.npmjs.com/get-npm](https://www.npmjs.com/get-npm).

Follow the instruction you will easily get things done. But be advised, `npm` is **not** your only option. You can use other pakage management tools such as `yarn`. Vue.js and vuetify ***DO*** provide other ways of installation, you can easily find solutons online or at [vuetify official website](https://vuetifyjs.com/zh-Hans/getting-started/quick-start).
### 1.2 Install vue.js and vuetify

When you have `npm` installed on your machine, you need to install `vue.js` and `vuetify`. Launch your CLI (Command Line Interface, 命令行交互界面), and type:

```
> npm install @vue/cli -g
```

This command will download and install vue.js CLI. After that, install vuetify with another similar command

```
> npm install vuetify --save
```

当上述步骤完成后，你就可以准备创建一个新的应用了. 但要注意的是，这只是前端开发环境. 由于项目的服务器端采用了python语言，你必须在本地搭建一个用于python开发的环境和虚拟服务器，才能正常运行项目工程. 请参见`section 1.3`.

**If you have any problmes, refer to this link for help: [https://vuetifyjs.com/zh-Hans/getting-started/quick-start](https://vuetifyjs.com/zh-Hans/getting-started/quick-start)**

### 1.3 Creating new application

Once you have done all the prepare work, you should create a new application. In you CLI, type: 

```
> cd xxx					#切换到你的项目路径
> vue create xxx			#xxx为项目名称

# 选择几个选项，并等待创建结束

> vue add vuetify		   #添加vuetify到项目目录
```

Then, `cd` to your project folder, and excute

```
npm run serve
```

to run the developement server. Open your browser, type:

```
localhost:8080
```

to preview your application. You can also preview mobile version on your mobile phone browser. Make sure that your mobile device is connected to the same LAN, and launch browser, type the following address:

```
your.dev.machine.ip:8080    #e.g. 192.168.1.100:8080
```

### 1.4 Install Dependencis

AF stands on gaints' shoulders. In order to run this project in development enviroment, you will also need to install some packages. The following is a list on what dependencis you should install and the official website of them.

 - Vue Router. **路由不用我介绍了吧。如果你不知道路由是什么，那...**


### 1.5 Merge project

You can get familiar with the application you have just created, do some modification for testing purpose, and try to make something new with the help of [vuetify official guide](https://vuetifyjs.com/zh-Hans/getting-started/quick-start).

当你熟悉了基本的操作流程和**vuetify**之后，你就可以参与开发了。在本地创建一个新项目后，在本Github仓库中下载`.zip`压缩包，解压后得到的文件复制到项目目录中即可。

## 2 Server Side Enviroment

> 这一部分文档将会指引你搭建服务端的本地开发环境，并初步了解如何使用 Django 框架进行前端开发.

AAIT Forum 项目，*以下简称AF*，在服务端使用基于Django，且遵循MVC 标准的 **django** 框架,但在本项目中后端开发人员只需要考虑视图层中api设计，不需要考虑界面设计。 

后端使用的数据库是mysql，此数据库拥有简单，易用，高性能特点等特点。

In order to run this project in development environment, you'll need ** mysql,python 3.x, and django framework installed on your machine. But in this part, I will only guide you through server side enviroment building.

一个最快捷的部署后端开发环境的方式就是通过`pip`安装所需的包。

### 2.1 Install python Setuptools and pip

获取Python [https://www.python.org/]

选择Windows版本下载，直接运行文件开始自动安装。

一般Windows版本的Python安装包里面自带有pip，所以安装好Python之后直接可以在cmd或者pycharm的终端中使用pip。

If you haven't installed `pip` yet, following the link below to download and install `ez_setup.py` : [https://bootstrap.pypa.io/ez_setup.py),

>python ez_setup.py #安装ez_setup.py

>easy_install pip #安装 pip

在Python项目中使用pip可以极高效率的获取需要的包。关于pip的快速入门教程[ https://www.jianshu.com/p/134daa4b254a]

### 2.2 Install django

>pip install Django # 安装django

你也可以直接使用源码安装，就是稍微麻烦一点,获取源码[https://www.djangoproject.com/download/].

直接用解压软件解压，然后到命令行（win10点击开始旁边的那个输入框中输入 cmd, Win8在开始那里点右键，选择命令行).

比如在 D:\django-1.11.8\  这个文件夹下.

>cd D:

>cd django-1.11.8

>python setup.py install

### 2.3 Creating new application

> cd xxx					#切换到你的项目路径

> django-admin startproject xxxx	 #xxxx为项目名称

Then, `cd` to your project folder, and excute

>cd xxxx #进入项目目录

>django-admin startapp sus #创建项目中的应用

创建成功后会看到项目目录结构,然后我们可以找到应用目录中的 views.py，写我们的第一次代码.

```
def index(request):
	return HttpResponse("hello world!")

```

写完之后将我们的应用添加到setting文件中.

```

INSTALLED_APPS=[
.....,
.....,
.....,
'sus'
]

```

再配置url(urls.py).

```
urlpatterns=[
	..........,
	url(r'^index/',sus.views.urls)
]

```

配置完url之后你的第一个应用就完成了！运行下列命令试试吧！

>python manage.py runserver

可以用浏览器打开控制台提示中的地址看到效果.

### 2.4 Install mysql

获取mysql,[https://dev.mysql.com/downloads/installer/]

下载之后，直接点击安装文件，即可开始自动安装。


安装成功之后,将mysql添加到系统环境变量中,（此电脑->属性->高级系统设置->环境变量->系统环境变量->path->新建->你的mysql的安装路径\MySQL Server 8.0\bin)


输入下列命令测试数据库是否安装成功

>mysql –h localhost –u root -p #登录数据库
>enter password:你设置的mysql的root账户的密码
>show databases

如果以上命令正常输入，并且返回正常结果没有报错就说明你已经安装成功了！

### 2.5 About database

此项目开发中需要你对数据有较为熟练的认识，如果没有学习过数据库的话，你可以通过学习快速入门教程学习 [http://www.runoob.com/mysql/mysql-tutorial.html].


