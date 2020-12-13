from django.db import models
from django.utils.translation import gettext_lazy as _


class Keyword(models.Model):
    id = models.AutoField(_("id"), primary_key=True)
    name = models.CharField(_("Tag Name"), max_length=255)
    link = models.URLField(_("Link"))


class Notice(models.Model):
    id = models.AutoField(_("id"), primary_key=True)
    title = models.CharField(_("Title"), max_length=255)
    description = models.TextField(_("Description"))
    link = models.URLField(_("Link"))
    thumb = models.URLField(_("Thumb"))
    datetime = models.DateTimeField(_("Date Time"))
    keywords = models.ManyToManyField(Keyword)
    content = models.TextField(blank=True, null=True)
    campus = models.CharField(max_length=50, blank=True)
    image = models.FilePathField(blank=True)



