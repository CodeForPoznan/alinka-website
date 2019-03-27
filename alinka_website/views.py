import os

from django.views.generic.base import TemplateView
from django.shortcuts import render

class HomePageView(TemplateView):
    def get(self, request, *args, **kwargs):
        context = {
            "asset_buckect": os.getenv("S3_BUCKET"),
        }
        return render(request, "index.html", context)