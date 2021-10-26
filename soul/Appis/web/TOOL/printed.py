


import os, json, uuid, time, random
from forpdf.settings import MEDIA_DIR, BASE_DIR, TIME_INTERVAL, PDF_DIR, DEFAULT_HTML, NAMESPACE_FLAG

from .func._print import _cmd
from .func._serial import _html_content, _html_link

from .func._osed import _name, _file, _download, req_html_form_link


def pdf_print_by_link(request, link, static):
    n = _name(request)
    named = os.path.join( '.', PDF_DIR, n)

    link = _html_link(request, link)

    if static:
        html = req_html_form_link(link)
        _file(named, html)
        _cmd('HTML', named)
    else:
        _cmd('LINK', named, link)
    return _download(n)

def pdf_print_by_html(request, html):
    n = _name(request)
    named = os.path.join( '.', PDF_DIR, n)
    html = _html_content(request, html)

    _file(named, html)
    return named, _download(n)

def do_print(named):
    _cmd('HTML', named)