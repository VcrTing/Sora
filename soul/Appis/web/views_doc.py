from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.db.models import Q
from django.forms.models import model_to_dict
from django.http import HttpResponsePermanentRedirect, HttpResponse, JsonResponse

from datetime import datetime
import os, json, uuid, time, random
from urllib import request as urllib2

class DocView(View):
    def get(self, request):
        
        return render(request, 'Doc/index_doc.html', {
            'background': request.GET.get('background', '')
        })

    def post(self, request):
        pass