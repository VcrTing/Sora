

from .osed import _name, _file, _html, _download, _time, _files, _need_trash_by_time

import os, json, uuid, time, random
from forpdf.settings import MEDIA_DIR, BASE_DIR, TIME_INTERVAL, PDF_DIR, DEFAULT_HTML, NAMESPACE_FLAG

def _trash(f):
    f = os.path.join(
        BASE_DIR,
        PDF_DIR, 
        f   
    )
    os.remove(f)

def pdf_trash():
    _now = _time()
    fs = _files()
    # print('文件 =', fs)

    for f in fs:
        _need = _need_trash_by_time(f, _now)
        if _need:
            # 删除
            _trash(f)
            