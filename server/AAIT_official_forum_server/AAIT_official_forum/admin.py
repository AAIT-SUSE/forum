from django.contrib import admin
from .models import User,Administrator,Article,ArticleBoard,ArticleComment,Goods,PoromodoClock
# Register your models here.

admin.site.register(User)
admin.site.register(PoromodoClock)
admin.site.register(Goods)
admin.site.register(Article)