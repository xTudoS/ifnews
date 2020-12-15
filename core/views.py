from django.shortcuts import render
from django.http import HttpResponse, response
from django.views import View
from django.contrib.auth import get_user_model
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from .models import Announcement, Notice, Keyword
import json
from random import shuffle

def get_random_keywords():
    keywords = []
    for k in Keyword.objects.all():
        keywords.append(k)

    shuffle(keywords)
    return sorted(keywords[0:3], key=lambda k: len(k.name))


class IndexView(View):

    def get(self, request):
        notice_list = Notice.objects.order_by("datetime")
        paginator = Paginator(notice_list, 5)

        try:
            page = int(request.GET.get('page', '1'))
        except ValueError:
            page = 1

        try:
            notices = paginator.page(page)
        except (EmptyPage, InvalidPage):
            notices = paginator.page(paginator.num_pages)     

        notice_list2 = []
        for n in notices:
            notice_list2.append(n)
        
        context = {
            "keywords": get_random_keywords(),
            "notices": notices,
            "notice_list": notice_list2,
        }

        return render(request, template_name="index.html", context=context)


class AnnouncementView(View):
    
    def get(self, request, *args, **kw):
        notice_list = Announcement.objects.order_by("datetime")
        paginator = Paginator(notice_list, 5)

        try:
            page = int(request.GET.get('page', '1'))
        except ValueError:
            page = 1

        try:
            notices = paginator.page(page)
        except (EmptyPage, InvalidPage):
            notices = paginator.page(paginator.num_pages)

        notice_list2 = []
        for n in notices:
            notice_list2.append(n)

        context = {
            "keywords": get_random_keywords(),
            "notices": notices,
            "notice_list": notice_list2,
        }

        return render(request, template_name="index.html", context=context)