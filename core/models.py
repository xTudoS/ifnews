from django.db import models
from django.utils.translation import gettext_lazy as _


class Keyword(models.Model):
    id = models.AutoField(_("id"), primary_key=True)
    name = models.CharField(_("Tag Name"), max_length=255)
    link = models.URLField(_("Link"))
    def __str__(self):
        return self.name


class Notice(models.Model):
    id = models.AutoField(_("id"), primary_key=True)
    title = models.CharField(_("Title"), max_length=255)
    description = models.TextField(_("Description"), null=True, blank=True)
    link = models.URLField(_("Link"))
    thumb = models.URLField(_("Thumb"), blank=True, null=True)
    datetime = models.DateTimeField(_("Date Time"))
    keywords = models.ManyToManyField(Keyword)
    # content = models.TextField(null=True)
    campus = models.CharField(max_length=50, blank=True)
    image = models.URLField(null=True)

    def __str__(self):
        return self.title


class Announcement(Notice):
    category = models.CharField(max_length=50)
    def __str__(self):
        return self.title