
import os, json, uuid, time, random
from forpdf.settings import MEDIA_DIR, BASE_DIR, TIME_INTERVAL, PDF_DIR, DEFAULT_HTML, NAMESPACE_FLAG

# 自动生成时间
def _time():
    return int(time.strftime("%Y%m%d%H%M%S", time.localtime(time.time())))

# 生成名字
def _name(request):
    rd_num = random.choice(range(0, 100))
    flag = request.GET.get(NAMESPACE_FLAG, 'default')
    tim = str(
        _time()
    )
    return flag + '_' + tim + '_' + str(rd_num)

# 获取文件
def _html(request):
    html = DEFAULT_HTML
    return html

def _html_link(request, link):
    return link

# 写入文件
def _file(named, html):
    f = open(named + '.html', 'w')
    f.write(html)
    f.close()

# 下载 文件
def _download(rec):
    return os.path.join( BASE_DIR, PDF_DIR,
        rec + '.pdf'
    )
    

# 删除
def _need_trash_by_time(rec, _now):
    rec = rec.split('_')
    rec = int(rec[1])
    _now = int(_now)
    
    if (_now - rec) > TIME_INTERVAL:
        return True
    return False

# 列举 文件
def _files():
    ph = os.path.join( BASE_DIR, PDF_DIR )
    return os.listdir(ph)
