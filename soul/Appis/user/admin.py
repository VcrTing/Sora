from django.contrib import admin

from . import models
# Register your models here.

admin.site.site_title = '天空'
admin.site.site_header = '天空轨道管理系统'

@admin.register(models.User)
class UserAdmin(admin.ModelAdmin):
    list_display = ['named', 'pwd', 'bg', 'salt', 'bad_account', 'status', 'add_time']
    readonly_fields = ['add_time']
    exclude = ['id']
    fieldsets = (
        ("资料", {
            "fields": (
                'named', 'pwd', 'bg'
            ),
        }),
        ("通行", {
            "fields": (
                'salt', 'bad_account'
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