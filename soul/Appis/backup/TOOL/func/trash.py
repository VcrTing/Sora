
import os, shutil

from .osed import trash, time_name
from forpdf.settings import BACK_ROOT, BACK_INTERVAL

def need_trash(f):
    ns = f.split('_')
    ns = ns[1]
    now = time_name()
    print('删除判断，n - o =', (now - int(ns)))
    if ns:
        if (now - int(ns)) > BACK_INTERVAL:
            return True 
    return False

def trash_old(named):
    rec = os.path.join(
        BACK_ROOT,
        named
    )
    
    try:
        rec = os.listdir(rec)
        for f in rec:
            need = need_trash(f)

            if need:
                print('删除文件 =', f)
                trash(f)

    except Exception as e:
        print('出错执行 通用删除')
        shutil.rmtree(rec)