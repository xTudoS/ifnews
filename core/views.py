from django.shortcuts import render
from django.http import HttpResponse, response
from django.views import View
from django.contrib.auth import get_user_model
# from .scrap.portal_ifpb.portal_ifpb_scrap import PortalIFPB
from .models import Notice, Keyword
import json

class MyView(View):

    def get(self, request):
        notices = []

        for x in Notice.objects.all():
            d = {
                    "datetime": str(x.datetime),
                    "thumb": x.thumb,
                    "link": x.link,
                    "title": x.title,
                    "description": x.description,
                    "campus": x.campus,
                    "image": x.image,
                    "keywords": [{"name": y.name, "link": y.link} for y in Keyword.objects.all()],
                }
            notices.append(d)
        
        # response = HttpResponse(json.dumps(notices))
        # response["Content-Type"] = "application/json charset=utf-8"
        return render(request, template_name="index.html")