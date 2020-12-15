import requests
from bs4 import BeautifulSoup as bs
from core.constants import Constants
from django.utils import timezone
from core.models import Announcement, Notice, Keyword
import pytz

import json

class PortalIFPB:

    @staticmethod
    def update_notices():
        print("update in %s" %timezone.now())
        for campus in Constants.CAMPI:
            PortalIFPB.get_lasted_announcement(campus)
            
            notices = PortalIFPB.get_notices(campus)
            for notice in notices:
                keywords = notice.pop("tags")
                try:
                    notice_model = Notice.objects.get(link=notice["link"])
                except Notice.DoesNotExist:
                    notice_model = Notice()
                
                n = PortalIFPB.update_model(notice_model, notice, campus)
                n.save()

                for keyword in keywords:
                    key, created = Keyword.objects.get_or_create(**keyword)
                    if created:
                        key = key.save()
                    try:
                        n.keywords.get(name=key.name)
                    except (Keyword.DoesNotExist, AttributeError) as e:
                        n.keywords.add(key)
                        n.save()

    @staticmethod
    def update_model(model, data, campus):
        model.datetime = data["datetime"]
        model.thumb = data["thumb"]
        model.link = data["link"]
        model.title = data["title"]
        model.description = data["description"]
        model.image = data["image"]
        model.campus = campus.title()
        return model

    @staticmethod
    def get_lasted_announcement(campus):
        urls = {
            "Editais de Ensino": "https://www.ifpb.edu.br/%s/editais/direcao-geral/2020" %campus,
            "Editais da Direção Geral": "https://www.ifpb.edu.br/%s/editais/pesquisa/2020" %campus,
        }

        for url in urls:
            data = PortalIFPB.get_notices(url=urls[url])
            for announcement in data:
                keywords = announcement.pop("tags")
                try:
                    announcement_model = Announcement.objects.get(link=announcement["link"])
                except Announcement.DoesNotExist:
                    announcement_model = Announcement()
                
                n = PortalIFPB.update_model_announcement(announcement_model, announcement, campus, url)
                n.save()

                for keyword in keywords:
                    key, created = Keyword.objects.get_or_create(**keyword)
                    if created:
                        key = key.save()
                    try:
                        n.keywords.get(name=key.name)
                    except (Keyword.DoesNotExist, AttributeError) as e:
                        n.keywords.add(key)
                        n.save()
    
    @staticmethod
    def update_model_announcement(model, data, campus, category):
        model.datetime = data["datetime"]
        model.thumb = data["thumb"]
        model.link = data["link"]
        model.title = data["title"]
        model.description = data["description"]
        model.image = data["image"]
        model.campus = campus.title()
        model.category = category
        return model


    @staticmethod
    def get_notices(campus=None, url=None):
        if url == None:
            url = Constants.BASE_URL + campus + "/noticias"
        headers = {
            "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0",
        }
        r = requests.get(url, headers=headers)
        data = []
        if r.status_code == 200:
            soup = bs(r.content, "html.parser")
            notices = soup.find_all("div", class_="tileItem")
            for notice in notices:
                time = None
                date = None
                thumb = None
                link = None
                title = None
                description = None
                tags = []

                documentByLine = notice.find_all("span", class_="summary-view-icon")
                for summary in documentByLine:
                    if "hour" in summary.prettify():
                        time = summary.text.strip()
                    elif "day" in summary.prettify():
                        date = summary.text.strip()

                titleContent = notice.find("div", class_="tileContent")
                linkNotice = notice.find("a").get("href")
                try:
                    thumb = titleContent.find("img", class_="tileImage").get("src")
                except AttributeError:
                    pass

                title = notice.find("h2", class_="tileHeadline").text.strip()

                try:
                    description = notice.find("span", class_="description").text.strip()
                except AttributeError:
                    pass
                
                keywords = notice.find("div", class_="keywords")
                spanKeywords = keywords.find_all("span")
                for span in spanKeywords:
                     k = span.find("a")

                     name = k.text.strip()
                     link = k.get("href")
                     keyword = {
                         "name": name,
                         "link": link,
                     }

                     tags.append(keyword)

                now = timezone.now()
                date = list(map(int, date.split("/")))
                time = list(map(int, time.split("h")))

                datetimenotice = now.replace(
                    day=date[0],
                    month=date[1],
                    year=date[2],
                    hour=time[0],
                    minute=time[1],
                    second=0,
                    microsecond=0,
                )

                d = {
                    "datetime": datetimenotice,
                    "thumb": thumb if thumb and thumb != "" else None,
                    "link": linkNotice,
                    "title": title,
                    "description": description,
                    "tags": tags,
                    "image": thumb.split("/@@images")[0] if thumb and thumb != "" else None
                }

                data.append(d)
        return data

        