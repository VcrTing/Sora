from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.db.models import Q
from django.forms.models import model_to_dict
from django.http import HttpResponsePermanentRedirect, HttpResponse, JsonResponse

from datetime import datetime
import os, json, uuid, time, random
from PIL import Image

from .models import User

#
class VueView(View):
    def get(self, request):
        
        return render(request, 'index.html', {
            
        })
        

class LoginView(View):
    def get(self, request):
        
        return render(request, 'Auth/Login.html', {
            
        })