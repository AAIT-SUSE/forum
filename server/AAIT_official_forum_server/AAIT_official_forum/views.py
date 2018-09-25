from django.shortcuts import render
from rest_framework import permissions,viewsets,renderers,generics
#from rest_framework.filters import DjangoObjectPermissionsFilter
from rest_framework.decorators import api_view
from django.views.generic import View


from AAIT_official_forum.models import Administrator,Article,ArticleBoard,ArticleComment,Goods,Post,PostBoard,PostComment,PostCommentReply,PostTheme,Group,GroupTaskJoin,GroupTask,GroupMembers,GroupBulletin,GroupActivity,JoinGroupActivity
from AAIT_official_forum.serializers import AdministratorSerializer,ArticleSerializer,ArticleBoardSerializer,ArticleCommentSerializer,GoodsSerializer,PostThemeSerializer,PostCommentReplySerializer,PostSerializer,PostBoardSerializer,PostCommentSerializer,GroupActivitySerializer,GroupBulletinSerializer,GroupMembersSerializer,GroupSerializer,GroupTaskJoinSerializer,GroupTaskSerializer,JoinGroupActivitySerializer

# Create your views here.

class AdministratorViewSet(viewsets.ModelViewSet,generics.RetrieveUpdateAPIView,generics.RetrieveDestroyAPIView):
    queryset = Administrator.objects.all()
    serializer_class = AdministratorSerializer



class ArticleViewSet(viewsets.ModelViewSet,generics.RetrieveUpdateAPIView,generics.RetrieveDestroyAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer


class ArticleBoardViewSet(viewsets.ModelViewSet):
    queryset = ArticleBoard.objects.all()
    serializer_class = ArticleBoardSerializer

class ArticleCommentViewSet(viewsets.ModelViewSet):
    queryset = ArticleComment.objects.all()
    serializer_class = ArticleCommentSerializer

class GoodsViewSet(viewsets.ModelViewSet):
    queryset = Goods.objects.all()
    serializer_class = GoodsSerializer



class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer

class PostBoardViewSet(viewsets.ModelViewSet):
    queryset = PostBoard.objects.all()
    serializer_class = PostBoardSerializer

class PostCommentViewSet(viewsets.ModelViewSet):
    queryset = PostComment.objects.all()
    serializer_class = PostCommentSerializer

class PostCommentReplyViewSet(viewsets.ModelViewSet):
    queryset = PostCommentReply.objects.all()
    serializer_class = PostCommentReplySerializer

class PostThemeViewSet(viewsets.ModelViewSet):
    queryset = PostTheme.objects.all()
    serializer_class = PostThemeSerializer

class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

class GroupTaskJoinViewSet(viewsets.ModelViewSet):
    queryset = GroupTaskJoin.objects.all()
    serializer_class = GroupTaskJoinSerializer

class GroupTaskViewSet(viewsets.ModelViewSet):
    queryset = GroupTask.objects.all()
    serializer_class = GroupTaskSerializer

class GroupMembersViewSet(viewsets.ModelViewSet):

    queryset = GroupMembers.objects.all()
    serializer_class = GroupMembersSerializer

class GroupBulletinViewSet(viewsets.ModelViewSet):
    queryset = GroupBulletin.objects.all()
    serializer_class = GroupBulletinSerializer

class GroupActivityViewSet(viewsets.ModelViewSet):
    queryset = GroupActivity.objects.all()
    serializer_class = GroupActivitySerializer

class JoinGroupActivityViewSet(viewsets.ModelViewSet):
    queryset = JoinGroupActivity.objects.all()
    serializer_class = JoinGroupActivitySerializer





def index(request):
    if(request.method=='GET'):
        context = {"msg": "GET请求成功！", "code": 0}
        return render(request, 'index.html', {'context':context})