import os
from .osed import path

def _sshpass_cmd(card):
    return "sshpass -p '" + card + "'"

def create_scp_cmd(user, addr, port, card):
    _cmd = _sshpass_cmd(card)

    _cmd = _cmd + " scp -P " + str(port)

    _cmd = _cmd  + " -r " + user + "@" + addr + ":"

    return _cmd


def scp_file(_scp, tg_path, sv_path):
    _scp = _scp + tg_path + " " + sv_path

    print('执行拷贝，命令 =', _scp)
    os.system(_scp)
    return True