
from .osed import _name, _file, _html, _html_link, _download

import os, json, uuid, time, random
from forpdf.settings import MEDIA_DIR, BASE_DIR, TIME_INTERVAL, PDF_DIR, DEFAULT_HTML, NAMESPACE_FLAG

def pdf_print(request):
    name_res = _name(request)
    named =  os.path.join(
        '.',
        PDF_DIR, 
        name_res   
    )
    _file(named, _html(request))
    cm = 'wkhtmltopdf ' + named + '.html' + ' ' + named + '.pdf'
    os.system(cm)

    return _download(name_res)

def pdf_print_by_link(request, link):
    name_res = _name(request)
    named =  os.path.join(
        '.',
        PDF_DIR, 
        name_res   
    )
    _file(named, _html_link(request, link))
    cm = 'wkhtmltopdf' + link + ' ' + named + '.pdf'
    os.system(cm)

    return _download(name_res)