from django.utils import timezone
from django.db import models

# Create your models here.

class BackUpConf(models.Model):
    named = models.CharField(max_length=60, default='crm', verbose_name='私服名称')
    user = models.CharField(max_length=20, default='root', verbose_name='用户')
    addr = models.CharField(max_length=60, default='127.0.0.0:8000', verbose_name='私服地址')
    port = models.IntegerField(default=22, verbose_name='端口')

    salt = models.CharField(max_length=60, default='vcrting', verbose_name='盐')
    card = models.CharField(max_length=120, default='vcrting', verbose_name='通行证')

    file_path = models.CharField(max_length=120, default='/root/SMSTask', verbose_name='SCP 目标路径')
    is_dir = models.BooleanField(verbose_name='文件夹？', default = True)

    work_status = models.BooleanField(verbose_name='启用状态？', default = True)

    status = models.BooleanField(verbose_name='数据状态', default = True)
    add_time = models.DateTimeField(verbose_name='創建時間', default=timezone.now)
    
    class Meta:
        verbose_name = "私服器 配置"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '配置' + str(self.id)

class BackUpWork(models.Model):
    work_time = models.DateTimeField(verbose_name='工作時間', default=timezone.now)
    success = models.BooleanField(verbose_name='备份成功？', default = True)
    saveing_path = models.CharField(max_length=120, default='/root/SMSTask', verbose_name='文件的储存路径')

    add_time = models.DateTimeField(verbose_name='創建時間', default=timezone.now)
    status = models.BooleanField(verbose_name='数据状态', default = True)
    
    conf = models.ForeignKey(BackUpConf, verbose_name='所属服务器', on_delete=models.CASCADE, null=True)

    class Meta:
        verbose_name = "工作记录"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '配置' + str(self.id)