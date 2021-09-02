import os
from Appis.backup.models import BackUpConf, BackUpWork

from .osed import path, time_name

from forpdf.settings import BACK_ROOT

def dir_name(named):
    return named + '_' + str(time_name())


def save_path(named, dir):
    sv_path = os.path.join(
        BACK_ROOT,
        named
    )

    sv_path = os.path.join(
        sv_path,
        dir
    )

    if path(sv_path):
        os.makedirs(sv_path)

    return sv_path

def get_back_conf():
    conf = BackUpConf()
    res = conf.objects.filter(work_status = True)
    if len(res) > 0:
        return res 
    return None

def save_back_result(success, saveing_path, conf):
    w = BackUpWork()
    w.conf = conf
    w.success = success
    w.work_time = time_name()
    w.saveing_path = saveing_path
    print('保存记录，路径 =', saveing_path)
    w.save()

