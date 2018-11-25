from django.shortcuts import render
from django.http import JsonResponse
from rest_framework import permissions,viewsets,renderers,generics,status,exceptions
#from rest_framework.filters import DjangoObjectPermissionsFilter
from rest_framework.decorators import api_view
from django.views.generic import View
from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.hashers import hashlib
from rest_framework.authentication import BasicAuthentication
from .models import Administrator,Feed,Article,ArticleBoard,ArticleComment,Goods,PoromodoClock,Post,PostBoard,PostComment,PostCommentReply,PostTheme,Group,GroupTaskJoin,GroupTask,GroupMembers,GroupBulletin,GroupActivity,JoinGroupActivity,User,UserAccount,UserToken
from .serializers import AdministratorSerializer,FeedSerializer,ArticleSerializer,ArticleBoardSerializer,ArticleCommentSerializer,GoodsSerializer,PoromodoClockSerializer,PostThemeSerializer,PostCommentReplySerializer,PostSerializer,PostBoardSerializer,PostCommentSerializer,GroupActivitySerializer,GroupBulletinSerializer,GroupMembersSerializer,GroupSerializer,GroupTaskJoinSerializer,GroupTaskSerializer,JoinGroupActivitySerializer,UserRegisterSerializer,UserLoginSerializer,UserSerializer,ChangePasswordSerializer,ForgetPasswordSerializer,ResetPasswordSerializer
from .Send_email import SendEmail

# Create your views here.

class AdministratorViewSet(viewsets.ModelViewSet,generics.RetrieveUpdateAPIView,generics.RetrieveDestroyAPIView):
    queryset = Administrator.objects.all()
    serializer_class = AdministratorSerializer


class FeedViewSet(viewsets.ModelViewSet,generics.RetrieveUpdateDestroyAPIView):
    queryset= Feed.objects.all()
    serializer_class = FeedSerializer

class ArticleViewSet(viewsets.ModelViewSet,generics.RetrieveUpdateAPIView,generics.RetrieveDestroyAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer


class ArticleBoardViewSet(viewsets.ModelViewSet):
    queryset = ArticleBoard.objects.all()
    serializer_class = ArticleBoardSerializer

class ArticleCommentViewSet(viewsets.ModelViewSet):
    queryset = ArticleComment.objects.all()
    serializer_class = ArticleCommentSerializer

#################
class GoodsViewSet(viewsets.ModelViewSet):
    queryset = Goods.objects.all()
    serializer_class = GoodsSerializer

class PoromodoClockViewSet(viewsets.ModelViewSet):
    queryset = PoromodoClock.objects.all()
    serializer_class = PoromodoClockSerializer
#################


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

class UserRegisterAPIView(APIView):
    queryset = User.objects.all()
    serializer_class = UserRegisterSerializer
    permission_classes = (permissions.AllowAny,)
    def get(self,request,format=None):
        serializer = UserRegisterSerializer()
        return Response(serializer.data)

    def post(self,request,format=None):
        ret = {'data':None,'result':None,'id':None}
        data = request.data
        password = data.get('password')
        confirm_password = data.get('confirm_password')
        e_mail = data.get('e_mail')
        if User.objects.filter(e_mail=e_mail):
            return Response('该邮箱已被注册',status=status.HTTP_400_BAD_REQUEST)
        elif password != confirm_password:
            return Response('两次输入密码不一致',status=status.HTTP_400_BAD_REQUEST)  
        serializer = UserRegisterSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            user = User.objects.get(e_mail=e_mail)
            ret['id'] = user.user_id
            ret['data'] = e_mail
            ret['result'] = 'Successed'
            return JsonResponse(ret)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)

class UserLoginAPIView(APIView):
    '''
    用户登录验证，如果通过，则设置、保存并返回token
    '''
    queryset = User.objects.all()
    serializer_class = UserLoginSerializer
    permission_classes = (permissions.AllowAny,)

    def get(self,request,format=None):
        serializer = UserLoginSerializer()
        return Response(serializer.data)

    def post(self,request,format=None):
        ret = {'msg':None,'token':None,'id':None}
        data = request.data
        e_mail = data.get('e_mail')
        password = data.get('password')
        try:
            user = User.objects.get(e_mail=e_mail)
            password_1 = hashlib.md5(password.encode('utf-8')).hexdigest()
            password = hashlib.md5(password_1.encode('utf-8')+user.salt.encode('utf-8')).hexdigest()
            if e_mail == user.e_mail and password == user.password:
                token = hashlib.md5(e_mail.encode('utf-8')).hexdigest()
                ret['msg'] = 'Successed'
                ret['token'] = token
                ret['id'] = user.user_id
                return JsonResponse(ret)
                UserToken.objects.update_or_create(user=user,defaults={'token':token})
                #serializer = UserSerializer(user)
                #return Response(serializer.data,status=status.HTTP_200_OK)
            return Response('用户名或密码错误',status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response('用户不存在',status=status.HTTP_400_BAD_REQUEST)

class ChangePasswordAPIView(APIView): 
    """ 
    An endpoint for changing password. 
    """ 
    queryset = User.objects.all()
    serializer_class = ChangePasswordSerializer
   # permission_classes = (permissions.IsAuthenticated,) 

    def get_object(self, queryset=None): 
        return self.request.user 

    def get(self,request,format=None):
        serializer = ChangePasswordSerializer()
        return Response(serializer.data)

    def post(self, request, *args, **kwargs): 
        self.object = self.get_object() 
        serializer = ChangePasswordSerializer(data=request.data) 

        if serializer.is_valid(): 
        # Check old password 
            old_password = serializer.data.get("old_password") 
            if not self.object.check_password(old_password): 
                return Response({"old_password": ["Wrong password."]},status=status.HTTP_400_BAD_REQUEST) 
                # set_password also hashes the password that the user will get 
            self.object.set_password(serializer.data.get("new_password")) 
            self.object.save() 
            return Response('修改密码成功',status=status.HTTP_204_NO_CONTENT) 

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ForgetPasswordAPIView(APIView):
    queryset = User.objects.all()
    serializer_class = ForgetPasswordSerializer

    def get(self,request,format=None):
        serializer = ForgetPasswordSerializer()
        return Response(serializer.data)

    def post(self,request,format=None):
        data = request.data
        e_mail = data.get('e_mail')
        try:
            user = User.objects.get(e_mail=e_mail)
            if e_mail == user.e_mail:
                sendemail = SendEmail()
                sendemail.send(str(e_mail))
                return Response('resetpassword',status=status.HTTP_200_OK)
            else:
                return Response('用户不存在',status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response('用户不存在',status=status.HTTP_400_BAD_REQUEST)

class ResetPasswordAPIView(APIView):
    queryset = User.objects.all()
    serializer_class = ResetPasswordSerializer

    def get(self,request,format=None):
        serializer = ResetPasswordSerializer()
        return Response(serializer.data)

    def post(self,request,*args, **kwarge):
        data = request.data
        e_mail = data.get('e_mail')
        password = data.get('password')
        confirm_password = data.get('confirm_password')
        try:
            self.object = User.objects.get(e_mail=e_mail)
            if password != confirm_password:
                return Response('两次输入密码不一致')
            else:
                serializer = ResetPasswordSerializer(data=data)
                if serializer.is_valid():
                    self.object.password = password
                    self.object.confirm_password = confirm_password
                    self.object.save()
                    return Response('重置密码成功',status=status.HTTP_200_OK)
                return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response('用户不存在',status=status.HTTP_400_BAD_REQUEST)

class Authentication(APIView):
    '''
    用户登录与否认证
    '''
    def authenticate(self,request):
        token = request.data.get('token')
        token_obj = UserToken.objects.filter(token=token)
        if not token_obj:
            raise exceptions.AuthenticationFailed('用户认证失败')
        return(token_obj,token_obj.user)

    def authenticate_header(self,request):
        pass

class GetArticleInfoUser(APIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer
    def get(self,request,format=None):
        ret={'id':None,'result':None}
        user_id = request.data.get('user_id')
        try:
            article = Article.objects.get(user_id=user_id)
            serializer = ArticleSerializer(article,many=True)
            return Response(serializer.data,status=status.HTTP_200_OK)
        except:
            ret['id'] = user_id
            ret['msg'] = 'The user has no articles!'
            return JsonResponse(ret)     

class GetFeedInfoUser(APIView):
    queryset = Feed.objects.all()
    serializer_class = FeedSerializer
    def get(self,request,format=None):
        ret = {'id':None,'msg':None}
        user_id = request.data.get('user_id')
        try:
            feed = Feed.objects.get(user_id=user_id)
            serializer = FeedSerializer(feed,many=True)
            return Response(serializer.data,status=status.HTTP_200_OK)
        except:
            ret['id'] = user_id
            ret['msg'] = 'The user has no feed'
            return JsonResponse(ret)
class UserProfileViewSet(viewsets.ModelViewSet):
    '''
    用户登录认证通过后可查看
    '''
    queryset = User.objects.all()
    
    serializer_class = UserSerializer
    #permission_classes = (permissions.IsAuthenticated,)


def index(request):
    if(request.method=='GET'):
        context = {"msg": "GET请求成功！", "code": 0}
        return render(request, 'index.html', {'context':context})

def test (request):
    return render(request,'test.html',{'book':'Hello Django'})
