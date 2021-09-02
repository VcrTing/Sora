import os
from .osed import path

def scp_file(user, addr, tg_path, sv_path):
    _scp = 'scp ' + user + '@' + addr + ':' + tg_path + ' ' + sv_path

    print('执行拷贝，命令 =', _scp)
    os.system(_scp)
    return True