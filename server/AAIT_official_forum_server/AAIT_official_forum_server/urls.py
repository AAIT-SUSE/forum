# 配置路由之后即为RESTful API

from django.contrib import admin
from django.urls import path,include

from AAIT_official_forum import views

from . import urls
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

router.register(r'GoodsViewSet',views.GoodsViewSet)
router.register(r'PoromodoClockViewSet',views.PoromodoClockViewSet)





urlpatterns = [
    url('^api/',include(router.urls)),
    path('admin/', admin.site.urls),
    path('index/',views.index),
    path('register/',views.UserRegisterAPIView.as_view()),
    path('login/',views.UserLoginAPIView.as_view()),
    url(r'^user_profile/(?P<pk>[0-9]+)/$',views.UserProfileAPIView.as_view()),
    url(r'changepassword/',views.ChangePasswordAPIView.as_view()),
]
