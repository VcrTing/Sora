import os 
from forpdf.settings import BASE_DIR

from .func.osed import path
from .func.trash import trash_old
from .func.scp import scp_file
from .func.model import get_back_conf, save_path, dir_name, save_back_result

from forpdf.settings import BACK_ROOT


def working():
    # 总文件夹是否存在
    if path(BACK_ROOT):
        os.mkdir(BACK_ROOT)

    print('开始执行备份，路径 =', BACK_ROOT)
    # 拉取备份数据
    confs = get_back_conf()

    # 准备 SCP 
    if confs:
        for c in confs:
            # 拉取 信息
            if c.work_status:
                
                named = c.named
                user = c.user
                addr = c.addr
                tg_path = c.file_path
                is_dir = c.is_dir

                dir = dir_name(named)
                sv_path = save_path(named, dir)

                print('此次备份路径 =', sv_path)
                # 拷贝
                status = scp_file(user, addr, tg_path, sv_path, is_dir)

                # 删除
                print('拷贝完成，准备删除 =====>')
                trash_old(named)

                # 保存下载信息
                save_back_result(status, sv_path, c)