"""AAIT_official_forum_server URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# 配置路由之后即为RESTful API

from django.contrib import admin
from django.urls import path,include
from AAIT_official_forum import views
from AAIT_official_forum_server import urls
from rest_framework.routers import DefaultRouter,url
from django.views.generic import TemplateView



router=DefaultRouter()
router.register(r'AdministratorViewSet',views.AdministratorViewSet)
router.register(r'ArticleViewSet',views.ArticleViewSet)

router.register(r'PostViewSet',views.PostViewSet)
router.register(r'PostBoardViewSet',views.PostBoardViewSet)

router.register(r'PostCommentViewSet',views.PostCommentViewSet)
router.register(r'PostCommentReplyViewSet',views.PostCommentReplyViewSet)

router.register(r'PostThemeViewSet',views.PostThemeViewSet)
router.register(r'GroupViewSet',views.GroupViewSet)

router.register(r'GroupTaskJoinViewSet',views.GroupTaskJoinViewSet)
router.register(r'GroupTaskViewSet',views.GroupTaskViewSet)

router.register(r'GroupMembersViewSet',views.GroupMembersViewSet)
router.register(r'GroupBulletinViewSet',views.GroupBulletinViewSet)

router.register(r'GroupActivityViewSet',views.GroupActivityViewSet)
router.register(r'JoinGroupActivityViewSet',views.JoinGroupActivityViewSet)


urlpatterns = [
    url('^api/',include(router.urls)),
    path('admin/', admin.site.urls),
    path('index/',views.index),

]
