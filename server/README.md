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

## 1 About API

> 这一部分文档将对本项目服务端API规范进行说明

本项目服务端采用的是遵守 RESTful API规范的djangorestframework 框架开发API，RESTful API 的英文全称  REpresentational State Transfer ，用HTTP动词（GET,POST,PUT,DELETE)描述操作。

### 2 项目配置

>服务端采用的数据库为mysql数据库
初次使用需要在setting.py 中设置一下信息:

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'aait_forum', #数据库名
        'USER': 'root',	#用户名
        'PASSWORD': 'root',#用户密码
        'HOST': '127.0.0.1',#数据库地址
        'PORT': '3306', #数据库端口
    }
}

>设置好了之后先导入数据库文件 aait_forum.sql 到数据库
>  test

## 3 API List

###论坛

####获取文章列表

>GET /api/ArticleViewSet/

####增加文章

>POST /api/ArticleViewSet/
```
参数（userid必填）

{
            "user_id": 8,
            "article_time": "2020-02-02T13:00:00Z",
            "title": "sfsdfsdf",
            "is_valid": 1,
            "content": "sdfsdf",
            "article_board_id": 1
}
```
####删除文章

>DELETE /api/ArticleViewSet/<id>/

####修改文章
>PUT /api/ArticleViewSet/<id>/
```
{
            "user_id": 8,
            "article_time": "2020-02-02T13:00:00Z",
            "title": "sfsdfsdf",
            "is_valid": 1,
            "content": "sdfsdf",
            "article_board_id": 1
}
```

####获取帖子列表
>GET /api/PostViewSet/

####增加帖子
>POST /api/PostViewSet/

```
参数
{
	"user_id": 1,
        "post_time": "2018-01-01T01:00:00Z",
        "post_content": "hellowolrd",
        "title": "helloworld",
        "post_board_id": "1",
        "is_vaild": 1
}
```

####删除帖子

>DELETE /api/PostViewSet/<id>/

####修改帖子

>PUT /api/PostViewSet/<id>/





####获取群组列表
>GET /api/GroupViewSet/

```
{
    "count": 2,
    "next": null,
    "previous": null,
    "results": [
        {
            "group_id": 1,
            "user_id": 1,
            "create_time": "2018-01-01T01:00:00Z",
            "is_close": 0,
            "description": "第一个群组",
            "group_name": "第一个",
            "group_type": "开放"
        },
        {
            "group_id": 2,
            "user_id": 2,
            "create_time": null,
            "is_close": 0,
            "description": "第二个群组",
            "group_name": "第二个群组",
            "group_type": "开放"
        }
    ]
}
```

####添加群组
>post /api/GroupViewSet/
```
参数
{
	    "user_id": 1,
            "create_time": "2018-01-01T01:00:00Z",
            "is_close": 0,
            "description": "第一个群组",
            "group_name": "第一个",
            "group_type": "开放"
}
```

####删除群组

>DELETE /api/GroupViewSet/<id>/

####修改群组

>PUT /api/GroupViewSet/<id>/

####获取论坛板块列表

>GET /api/PostBoardViewSet/

```
{
    "count": 2,
    "next": null,
    "previous": null,
    "results": [
        {
            "post_board_id": 1,
            "board_description": "第一个板块",
            "post_theme_id": 1,
            "last_post_id": 2,
            "board_name": "第一个板块"
        },
        {
            "post_board_id": 2,
            "board_description": "第二个板块",
            "post_theme_id": 1,
            "last_post_id": 3,
            "board_name": "第二个板块"
        }
    ]
}
```
####添加论坛板块
>post /api/PostBoardViewSet/

```
参数
{
	   "board_description": "第一个板块",
            "post_theme_id": 1,
            "last_post_id": 2,
            "board_name": "第一个板块"
}
```

####删除论坛板块

>DELETE /api/PostBoardViewSet/<id>/

####修改论坛板块

>PUT /api/PostBoardViewSet/<id>/






