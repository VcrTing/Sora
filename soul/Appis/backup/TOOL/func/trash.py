
import os, shutil

from .osed import trash, time_name
from forpdf.settings import BACK_ROOT, BACK_INTERVAL

def need_trash(f):
    ns = f.split('_')
    ns = ns[1]
    now = time_name()
    if ns:
        if (now - int(ns)) > BACK_INTERVAL:
            return True 
    print('无需删除，n - o =', (now - int(ns)))
    return False

def trash_old(named):
    try:
        rec = os.path.join(
            BACK_ROOT,
            named
        )
        print('执行的删除路径 =', rec)

        shutil.rmtree(rec)
    except Exception as e:
        pass
    
    """
    rec = os.listdir(rec)
    for f in rec:
        need = need_trash(f)

        if need:
            print('删除文件 =', f)
            trash(f)

    """