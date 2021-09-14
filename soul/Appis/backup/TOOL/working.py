import os 
from forpdf.settings import BASE_DIR

from .func.osed import path
from .func.trash import trash_old
from .func.model import get_back_conf, save_path, dir_name, save_back_result

from forpdf.settings import BACK_ROOT

from .func.scp import scp_file, create_scp_cmd
from .func.scp_paramiko import transport, scp_paramiko

def _running_cp(c, sv_path):

    pwd = c.card
    user = c.user
    addr = c.addr
    port = c.port
    tg_path = c.file_path
    
    print('此次备份路径 =', sv_path)

    # 拷贝
    _cmd = create_scp_cmd(user, addr, port, pwd)
    status = scp_file(_cmd, tg_path, sv_path)
    # trans = transport(addr, port, user, pwd)
    # status = scp_paramiko(trans, tg_path, sv_path)

    return status

def working():

    print('开始执行备份，路径 =', BACK_ROOT)
    # 总文件夹是否存在
    if path(BACK_ROOT) is not True:
        os.mkdir(BACK_ROOT)

    # 拉取备份数据
    confs = get_back_conf()

    # 准备 SCP 
    if confs:
        for c in confs:
            # 拉取 信息
            if c.work_status:
                
                named = c.named

                # 删除
                trash_old(named)

                # 路径
                dir = dir_name(named)
                sv_path = save_path(named, dir)

                # 执行
                status = _running_cp(c, sv_path)

                # 保存
                save_back_result(status, sv_path, c)