from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.db.models import Q
from django.forms.models import model_to_dict
from django.http import HttpResponsePermanentRedirect, HttpResponse, JsonResponse

from datetime import datetime
import os, json, uuid, time, random
from urllib import request as urllib2
from PIL import Image

from django.template.loader import render_to_string
from xhtml2pdf import pisa

from .TOOL.printed import pdf_print_by_link, pdf_print_by_html, do_print
from .TOOL.trashed import pdf_trash

from forpdf.settings import MEDIA_DIR, BASE_DIR, TIME_INTERVAL, PDF_DIR, DEFAULT_HTML, NAMESPACE_FLAG


class WebView(View):
    def get(self, request):
        print(request.META['HTTP_HOST'])
        html = request.GET.get('html', DEFAULT_HTML)
        res = pdf_print_by_html(request, html)

        pdf_trash()
        return JsonResponse({ 'status': True, 'pdf': res }, safe = False)

    def post(self, request):
        html = request.POST.get('html', None)
        return JsonResponse({ 'status': True }, safe = False)

# 根据 LINK 转为 PDF
class PdfLinkView(View):
    def get(self, request):
        return JsonResponse({ 'status': True, 'file': 'pls use the post method.' }, safe = False)

    def get_domain(self, request):
        host = request.META['HTTP_HOST']
        head = request.META['wsgi.url_scheme']
        if head:
            head = str(head)
        else:
            head = 'http'
        return head + '://' + host

    def post(self, request):

        link = request.POST.get('link', None)
        is_static = request.POST.get('is_static', False)

        res = pdf_print_by_link(request, link, is_static)

        domain = self.get_domain(request)
        res = domain + '/' + res
        html = res[0: -3] + 'html'
        
        pdf_trash()
        return JsonResponse({ 'status': True, 'pdf': res, 'html': html }, safe = False)

from django.template import Context, Template

def extract_request_variables(request):

    page_size = request.POST.get('page_size', 'letter')
    page_orientation = request.POST.get('page_orientation', 'portrait')

    pagesize = "%s %s" % (
        page_size, page_orientation
    )

    template = Template(request.POST.get('data', ''))
    data = template.render(Context({}))
    return {
        'pagesize': pagesize,
        'data': data,
        'page_orientation': page_orientation,
        'page_size': page_size,
        'example_number': request.POST.get("example_number", '1'),
        'border': request.POST.get('border', '')
    }

# 根据 HTML 转为 PDF
class PdfHtmlView(View):
    def get(self, request):
        return JsonResponse({ 'status': True, 'msg': 'pls use the post method.' }, safe = False)

    def get_domain(self, request):
        host = request.META['HTTP_HOST']
        head = request.META['wsgi.url_scheme']
        if head:
            head = str(head)
        else:
            head = 'http'
        return head + '://' + host

    def post(self, request):
        
        option = request.GET.get('option', 'cmd')
        
        res = None
        html = request.POST.get('html', DEFAULT_HTML)

        if option == 'simple':
            # named, res = pdf_print_by_html(request, html)

            response = HttpResponse(content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="report.pdf"'
            
            pisa.CreatePDF(html, dest = response)
            return response
        else:

            domain = self.get_domain(request)
            named, res = pdf_print_by_html(request, html)

            do_print(named)
            res = domain + '/' + res
            html = res[0: -3] + 'html'
            
            pdf_trash()
            return JsonResponse({ 'status': True, 'pdf': res, 'html': html }, safe = False)




        
# 定时任务
import time, logging
import apscheduler

from Appis.backup.TOOL.index import index

from Appis.backup.sch.aps import init_scheduler_options

from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.events import EVENT_JOB_ERROR, EVENT_JOB_MISSED, EVENT_JOB_EXECUTED

logger = logging.getLogger('job')

def fun():
    index() # 运行任务

def job_listener(Event):
    job = sch.get_job(Event.job_id)

    if not Event.exception:
        logger.info("jobname=%s|jobtrigger=%s|jobtime=%s|retval=%s", job.name, job.trigger,
                    Event.scheduled_run_time, Event.retval)
    else:
        logger.error("jobname=%s|jobtrigger=%s|errcode=%s|exception=[%s]|traceback=[%s]|scheduled_time=%s", job.name,
                     job.trigger, Event.code,
                     Event.exception, Event.traceback, Event.scheduled_run_time)

sch = BackgroundScheduler(**init_scheduler_options)

sch.add_listener(
    job_listener, 
    EVENT_JOB_ERROR | \
    EVENT_JOB_MISSED | \
    EVENT_JOB_EXECUTED
)

sch.add_job(fun, 'interval', seconds = (60*5), id = 'sora')
sch.start()
print('定时任务加载完毕_____')