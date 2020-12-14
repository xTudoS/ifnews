from django.contrib import admin
from core.models import Announcement, EmailNewsletter, Newsletter, Notice, Keyword

admin.site.register(Announcement)
admin.site.register(Notice)
admin.site.register(Keyword)
admin.site.register(EmailNewsletter)
admin.site.register(Newsletter)
