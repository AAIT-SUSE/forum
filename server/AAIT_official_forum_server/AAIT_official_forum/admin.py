from django.contrib import admin
from .models import User,Administrator,Article,ArticleBoard,ArticleComment,Goods
# Register your models here.

admin.site.register(User)
admin.site.register(Article)