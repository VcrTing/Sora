from django.contrib import admin

from . import models
# Register your models here.

admin.site.site_title = '天空'
admin.site.site_header = '天空轨道管理系统'

@admin.register(models.BackUpConf)
class BackUpConfAdmin(admin.ModelAdmin):
    list_display = ['named', 'addr', 'port', 'salt', 'card', 'is_dir', 'file_path', 'work_status', 'status', 'add_time']
    readonly_fields = ['add_time']
    exclude = ['id']
    fieldsets = (
        ("资料", {
            "fields": (
                'named', 'user', 'addr', 'port'
            ),
        }),
        ("通行", {
            "fields": (
                'salt', 'card', 
                'work_status'
            ),
        }),
        ("工作", {
            "fields": (
                'file_path', 'is_dir'
            ),
        }),

        ("其他", {
            "fields": (
                'status', 'add_time'
            ),
        }),
    )
    list_per_page = 50
    empty_value_display = '--'

    def get_ordering(self, request):
        return ['-add_time', ]

@admin.register(models.BackUpWork)
class BackUpWorkAdmin(admin.ModelAdmin):
    list_display = ['conf', 'success', 'work_time', 'saveing_path', 'status', 'add_time']
    readonly_fields = ['add_time']
    exclude = ['id']
    fieldsets = (
        ("资料", {
            "fields": (
                'conf',
            ),
        }),
        ("工作", {
            "fields": (
                'success', 'work_time', 
                'saveing_path'
            ),
        }),

        ("其他", {
            "fields": (
                'status', 'add_time'
            ),
        }),
    )
    list_per_page = 50
    empty_value_display = '--'

    def get_ordering(self, request):
        return ['-add_time', ]