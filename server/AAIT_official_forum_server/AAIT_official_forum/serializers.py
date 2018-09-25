from rest_framework import serializers
from AAIT_official_forum.models import Administrator,Article,ArticleBoard,ArticleComment,Goods,Post,PostBoard,PostComment,PostCommentReply,PostTheme,Group,GroupActivity,GroupBulletin,GroupMembers,GroupTask,GroupTaskJoin,JoinGroupActivity


class AdministratorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Administrator
        fields=("administrator_id","user_id")


class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields=("article_id","user_id","article_time","title","is_valid","content","article_board_id")


class ArticleBoardSerializer(serializers.ModelSerializer):
    class Meta:
        model = ArticleBoard
        fields=("article_board_id","board_name","board_description","last_article_id")

class ArticleCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = ArticleComment
        fields=("article_comment_id","user_id","article_id","content","time")

class GoodsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Goods
        fields=("goods_id","price","stock","goods_image","goods_info","is_online")

#########################
class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model=Post
        fields = ("post_id", "user_id", "post_time", "post_content", "title", "post_board_id","is_vaild")


class PostBoardSerializer(serializers.ModelSerializer):
    class Meta:
        model=PostBoard
        fields = ("post_board_id", "board_description", "post_theme_id", "last_post_id", "board_name")


class PostCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = PostComment
        fields = ("post_comment_id", "user_id", "post_comment_content", "post_comment_time", "post_id", "is_have_comment")


class PostCommentReplySerializer(serializers.ModelSerializer):
    class Meta:
        model=PostCommentReply
        fields = ("post_comment_reply_id", "post_comment_id", "user_id", "reply_content", "reply_time")


class PostThemeSerializer(serializers.ModelSerializer):
    class Meta:
        model=PostTheme
        fields = ("post_theme_id", "theme_name")


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model=Group
        fields = ("group_id", "user_id", "create_time", "is_close", "description", "group_name","group_type")


class GroupActivitySerializer(serializers.ModelSerializer):
    class Meta:
        model=GroupActivity
        fields = ("group_activity_id", "group_id", "user_id", "start_time", "description", "is_close","end_time","group_activity_name","remind_time","appendix","group_activity_cover")

class GroupBulletinSerializer(serializers.ModelSerializer):
    class Meta:
        model=GroupBulletin
        fields = ("group_bulletin_id", "group_id", "time", "content", "user_id")

class GroupMembersSerializer(serializers.ModelSerializer):
    class Meta:
        model=GroupMembers
        fields = ("group_members_id", "user_id", "is_administrator", "group_id")

class GroupTaskSerializer(serializers.ModelSerializer):
    class Meta:
        model=GroupTask
        fields = ("group_task_id", "group_id", "create_time", "description", "is_close", "user_id","appendix","group_task_cover")

class GroupTaskJoinSerializer(serializers.ModelSerializer):
    class Meta:
        model=GroupTaskJoin
        fields = ("group_task_join_id", "group_task_id", "user_id", "is_finish", "group_id", "finish_time","join_time")

class JoinGroupActivitySerializer(serializers.ModelSerializer):
    class Meta:
        model=JoinGroupActivity
        fields = ("join_group_activity_id", "group_id", "user_id", "group_activity_id", "join_time", "is_join_finish","is_expire")

