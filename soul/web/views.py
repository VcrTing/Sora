from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.db.models import Q
from django.forms.models import model_to_dict
from django.http import HttpResponsePermanentRedirect, HttpResponse, JsonResponse

from datetime import datetime
import os, json, uuid, time, random
from PIL import Image

from .TOOL.printed import pdf_print, pdf_print_by_link
from .TOOL.trashed import pdf_trash


class WebView(View):
    def get(self, request):
        
        print('---- START GET ----')
        
        res = pdf_print(request)
        pdf_trash()
        return JsonResponse({ 'status': True, 'file': res }, safe = False)

    def post(self, request):


        # cm = 'wkhtmltopdf ../save.html save.pdf'
        # os.system(cm)
        
        
        print('---- START POST ----')
        html = request.POST.get('html', None)
        print('HTML =', html)


        cm = 'wkhtmltopdf '

        return JsonResponse({ 'status': True }, safe = False)

class PdfLinkView(View):
    def get(self, request):
        
        print('---- PDF LINK GET ----')
        
        link = request.POST.get('link', None)
        res = pdf_print_by_link(request, link)
        pdf_trash()
        return JsonResponse({ 'status': True, 'file': res }, safe = False)

    def post(self, request):

        print('---- PDF LINK ----')

        return JsonResponse({ 'status': True }, safe = False)