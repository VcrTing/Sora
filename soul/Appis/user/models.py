from django.db import models
from django.utils import timezone

# Create your models here.

class User(models.Model):

    BG = (
        (0, 'normal'),
        (1, 'r16'),
        (2, 'r18'),
        (3, 'r20'),
        (5, 'game'),
    )

    named = models.CharField(max_length=60, default='VcrTing', verbose_name='用户名称')
    pwd = models.CharField(max_length=90, default='123456', verbose_name='用户密码')

    bg = models.SmallIntegerField(choices=BG, default=1, verbose_name='消息类型', null=True)

    salt = models.CharField(max_length=60, default='qiong', verbose_name='盐')
    bad_account = models.BooleanField(verbose_name='取消资格？', default = True)

    status = models.BooleanField(verbose_name='数据状态', default = True)
    add_time = models.DateTimeField(verbose_name='創建時間', default=timezone.now)

    class Meta:
        verbose_name = "蓝用户"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '蓝用户' + str(self.named)