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
​    'default': {
​        'ENGINE': 'django.db.backends.mysql',
​        'NAME': 'aait_forum', #数据库名
​        'USER': 'root',	#用户名
​        'PASSWORD': 'root',#用户密码
​        'HOST': '127.0.0.1',#数据库地址
​        'PORT': '3306', #数据库端口
​    }
}

>设置好了之后先导入数据库文件 aait_forum.sql 到数据库
>  test

## 3 API List

### 用户入口Restful API

#### 用户注册

> GET /register/            		
>
> POST /register/
>
> > ```
> > 参数（所有参数必填）
> > {
> >     'username':dwy  "用户名"
> >     'e_mail': 485176679@qq.com  "邮箱“
> >     'password': 12345  "用户密码"
> >     'confirm_password': 12345  "确认密码"
> > }
> > ```
>
> > 成功返回：
> >
> > ```
> > 'dwy'  (用户名)
> > ```
> >
> >
>
> > 失败返回：
> >
> > ```
> > '用户名已存在' （该用户名已被注册）
> > '该邮箱已被注册' （一个邮箱只能被一个用户注册）
> > '两次输入的密码不一致' （确保两次输入密码一致）
> > ```
> >
> >
>
>

####  用户登录

> GET /login/
>
> POST /login/
>
> > ```
> > 参数（所有参数必填）
> > {
> >     'username':dwy  "已注册的用户名"
> >     'password':12345 "用户密码"
> > }
> > ```
> >
> > 成功返回：
> >
> > ```
> > 'msg':'Successed'
> > 'token': 该用户token信息  （登录时为用户设置token并返回）
> > ```
> >
> > 失败返回：
> >
> > ```
> > '用户名或密码错误'
> > ```
> >
> >

#### 修改密码

> GET /changepassword/
>
> PUT /changepassword/
>
> > ```
> > 参数(所有参数必填)
> > {
> >     'old_password' : 12345  (用户旧密码)
> >     'new_password' : 123  (新密码)
> > }
> > ```
> >
> > 成功返回：
> >
> > ```
> > '修改密码成功'
> > ```
> >
> > 失败返回：
> >
> > ```
> > "old_password": ["Wrong password."]  (旧密码错误)
> > "detail": "Authentication credentials were not provided."  （没有权限执行此操作）
> > ```
> >
> >

#### 忘记密码

> GET /firgetpassword/
>
> POST /forgetpassword/
>
> > ```
> > 参数（所有参数必填）
> > {
> >     'username' : dwy  （需要找回密码的用户名称，必须是已注册用户）
> >     'e_mail' : 485176679@qq.con  (注册时使用的邮箱，用于接收重置密码连接)
> > }
> > ```
> >
> > 成功返回：
> >
> > ```
> > 'resetpassword' (用于用户重置密码的链接)
> > ```
> >
> > 失败返回：
> >
> > ```
> > '用户名与邮箱不匹配'  (用户注册时使用的邮箱与此输入邮箱不一致)
> > '用户名或邮箱错误'  （该用户未注册）
> > ```
> >
> >

#### 重置密码

> GET /resetpassword/
>
>  PUT /resetpassword/
>
> > ```
> > 参数（所有参数必填）
> > {
> >     'username' : dwy  (需要重置密码的用户名)
> >     'password' : 123  (重置后的密码)
> >     'confirm_password' : 123  (确认密码)
> > }
> > ```
> >
> > 成功返回：
> >
> > ```
> > '重置密码成功'
> > ```
> >
> > 失败返回：
> >
> > ```
> > '两次输入密码不一致'
> > ```
> >
> >

#### 查看用户账户

> GET /user_profile/<id>/
>
> 成功返回：
>
> ```
> {
>     "user_id": 2,
>     "username": "dwy_520",
>     "e_mail": "dengwenyi88@outlook.com",
>     "user_logo": null,
>     "user_description": null,
>     "last_post_id": null,
>     "last_article_id": null,
>     "account": []
> }
> ```
>
> 失败返回：
>
> ```
> "detail": "Not found."
> ```
>
>

#### 修改用户账户

> PUT /user_profile/<id>/
>
> ```
> 参数
> {
>     "username": "dwy_520"  （必填）
>     "e_mail": "dengwenyi88@outlook.com"  （必填）
>     "user_logo": null,
>     "user_description": null,
>     "last_post_id": null,
>     "last_article_id": null,
> }
> ```
>
> 成功返回：
>
> ```
> (修改后的数据)
>     "user_id": 2,
>     "username": "dwy_520",
>     "e_mail": "dengwenyi88@outlook.com",
>     "user_logo": null,
>     "user_description": null,
>     "last_post_id": null,
>     "last_article_id": null,
>     "account": []
> ```
>
> 失败返回：
>
> ```
>     "username": [
>         "This field may not be blank."
>     ],
>     "e_mail": [
>         "This field may not be blank."
>     ]
> ```
>
>

#### 删除用户

> DELETE /user_profile/<id>/
>
> 失败返回：
>
> ```
>  "detail": "Authentication credentials were not provided."
> ```
>
>

### 论坛

##### 获取文章列表

>GET /api/ArticleViewSet/

#### 增加文章

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
#### 删除文章

>DELETE /api/ArticleViewSet/<id>/

#### 修改文章
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

#### 获取帖子列表
>GET /api/PostViewSet/

#### 增加帖子
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

#### 删除帖子

>DELETE /api/PostViewSet/<id>/

#### 修改帖子

>PUT /api/PostViewSet/<id>/





#### 获取群组列表
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

#### 添加群组
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

#### 删除群组

>DELETE /api/GroupViewSet/<id>/

#### 修改群组

>PUT /api/GroupViewSet/<id>/

#### 获取论坛板块列表

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
#### 添加论坛板块
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

#### 删除论坛板块

>DELETE /api/PostBoardViewSet/<id>/

#### 修改论坛板块

>PUT /api/PostBoardViewSet/<id>/

----------


### 物品REST api

#### 获取物品列表

```
调用地址：http://127.0.0.1:8000/api/GoodsViewSet/

请求方式：GET

返回类型：JSON

```
成功返回：
```
[{"goods_id":1,"price":null,"stock":null,"goods_image":null,"goods_info":null,"is_online":null},{"goods_id":2,"price":1,"stock":2,"goods_image":"test","goods_info":"测试","is_online":0},{"goods_id":21,"price":null,"stock":null,"goods_image":null,"goods_info":null,"is_online":null}]
```
失败返回：
```
{
    "detail": "Not found."
}
```
#### 增加物品

```
调用地址：http://127.0.0.1:8000/api/GoodsViewSet/

请求方式：POST

返回类型：JSON
```

| 请求参数 | 类型 | 是否必须 | 描述 |
|:----------:|:----------:|:----------:|:----------:|
|   goods_id         |   str   |      必须      |    --        |
|      price      |      str      |     选填      |      --      |
|       stock     |   str         |      选填      |    --        |
|       goods_image     |   str         |      选填      |    --        |
|       goods_info     |   str         |      选填      |    --        |
|       is_online     |   str         |      选填      |    --        |


#### 删除物品

```
调用地址：http://127.0.0.1:8000/api/GoodsViewSet/{id}/

请求方式：DELETE

返回类型：JSON
```

#### 修改物品

```
调用地址：http://127.0.0.1:8000/api/GoodsViewSet/{id}/

请求方式：PUT

返回类型：JSON
```

| 请求参数 | 类型 | 是否必须 | 描述 |
|:----------:|:----------:|:----------:|:----------:|
|   goods_id         |   str   |      必须      |    --        |
|      price      |      str      |     选填      |      --      |
|       stock     |   str         |      选填      |    --        |
|       goods_image     |   str         |      选填      |    --        |
|       goods_info     |   str         |      选填      |    --        |
|       is_online     |   str         |      选填      |    --        |

----------

### 番茄 API

#### 获取番茄列表

```
调用地址：http://127.0.0.1:8000/api/PoromodoClockViewSet/

请求方式：GET

返回类型：JSON

```
成功返回：
```
[
    {
        "poromodo_clock_id": 1,
        "user_id": 1,
        "clock_count": 1,
        "invalid_poromodo_clock": 1
    },
    {
        "poromodo_clock_id": 2,
        "user_id": 2,
        "clock_count": 2,
        "invalid_poromodo_clock": 2
    }
]

```
失败返回：
```
{
    "detail": "Not found."
}
```
#### 增加番茄

```
调用地址：http://127.0.0.1:8000/api/PoromodoClockViewSet/

请求方式：POST

返回类型：JSON
```

| 请求参数 | 类型 | 是否必须 | 描述 |
|:----------:|:----------:|:----------:|:----------:|
|   poromodo_clock_id         |   str   |      必须      |    --        |
|      user_id      |      str      |     选填      |      --      |
|       clock_count     |   str         |      选填      |    --        |
|       invalid_poromodo_clock     |   str         |      选填      |    --        |


#### 删除番茄

```
调用地址：http://127.0.0.1:8000/api/PoromodoClockViewSet/{id}/

请求方式：DELETE

返回类型：JSON
```

#### 修改番茄

```
调用地址：http://127.0.0.1:8000/api/PoromodoClockViewSet/{id}/

请求方式：PUT

返回类型：JSON
```

| 请求参数 | 类型 | 是否必须 | 描述 |
|:----------:|:----------:|:----------:|:----------:|
|   poromodo_clock_id         |   str   |      必须      |    --        |
|      user_id      |      str      |     选填      |      --      |
|       clock_count     |   str         |      选填      |    --        |
|       invalid_poromodo_clock     |   str         |      选填      |    --        |

----------









