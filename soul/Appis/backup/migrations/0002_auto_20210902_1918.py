# Generated by Django 2.2.5 on 2021-09-02 11:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backup', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='backupconf',
            options={'verbose_name': '私服器 配置', 'verbose_name_plural': '私服器 配置'},
        ),
        migrations.AddField(
            model_name='backupconf',
            name='port',
            field=models.IntegerField(default=22, verbose_name='端口'),
        ),
        migrations.AlterField(
            model_name='backupconf',
            name='is_dir',
            field=models.BooleanField(default=True, verbose_name='文件夹？'),
        ),
    ]
