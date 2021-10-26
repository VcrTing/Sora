import os

def _cmd(_method, named, link = None):
    res = 'wkhtmltopdf '
    if _method == 'LINK':
        res = res + link + ' ' + named + '.pdf'
    else:
        res = res + named + '.html ' + named + '.pdf'
    os.system(res)