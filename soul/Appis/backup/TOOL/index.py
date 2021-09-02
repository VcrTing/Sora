
from datetime import datetime

from .working import working

from forpdf.settings import BACK_WORK_HOUR

def index():
    # 备份
    print('定时任务准备执行。。。')
    
    i = datetime.now()
    
    if int(i.hour) in BACK_WORK_HOUR:
        working()