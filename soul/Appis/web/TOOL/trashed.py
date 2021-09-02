

from .func._osed import _time, _files, _trash

import os, json, uuid, time, random
from forpdf.settings import MEDIA_DIR, BASE_DIR, TIME_INTERVAL, PDF_DIR, DEFAULT_HTML, NAMESPACE_FLAG

# 删除 的 规则
def _need_trash_by_time(rec, _now):
    rec = rec.split('_')
    rec = int(rec[1])
    _now = int(_now)
    
    if (_now - rec) > TIME_INTERVAL:
        return True
    return False

# 删除 工作
def pdf_trash():
    _now = _time()
    fs = _files()

    for f in fs:
        _need = _need_trash_by_time(f, _now)
        if _need:
            # 删除
            _trash(f)
            