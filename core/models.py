from django.db import models
from django.utils.translation import gettext_lazy as _
from django.utils import timezone


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
    campus = models.CharField(max_length=50, blank=True)
    image = models.URLField(null=True)

    def __str__(self):
        return self.title


class Announcement(models.Model):
    id = models.AutoField(_("id"), primary_key=True)
    category = models.CharField(max_length=50)
    title = models.CharField(_("Title"), max_length=255)
    description = models.TextField(_("Description"), null=True, blank=True)
    link = models.URLField(_("Link"))
    thumb = models.URLField(_("Thumb"), blank=True, null=True)
    datetime = models.DateTimeField(_("Date Time"))
    keywords = models.ManyToManyField(Keyword)
    campus = models.CharField(max_length=50, blank=True)
    image = models.URLField(null=True)
    def __str__(self):
        return self.title


class EmailNewsletter(models.Model):
    id = models.AutoField(_("id"), primary_key=True)
    email = models.EmailField()
    name = models.CharField(max_length=50)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return "%s - %s" %(self.id, self.name)


class Newsletter(models.Model):
    id = models.AutoField(_("id"), primary_key=True)
    sended_to = models.ManyToManyField(EmailNewsletter)
    sended_date = models.DateTimeField(default=timezone.now)
    content = models.TextField()

    def __str__(self):
        return str(self.id) + " - " + str(self.sended_date)
