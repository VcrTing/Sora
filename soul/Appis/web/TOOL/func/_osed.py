
import os, json, uuid, time, random
from forpdf.settings import MEDIA_DIR, BASE_DIR, TIME_INTERVAL, PDF_DIR, DEFAULT_HTML, NAMESPACE_FLAG

# 自动生成时间
def _time():
    return int(time.strftime("%Y%m%d%H%M%S", time.localtime(time.time())))

# 生成名字
def _name(request):
    tim = str(
        _time()
    )
    rd_num = random.choice(range(0, 1000))
    prefix = request.GET.get(NAMESPACE_FLAG, 'default')

    suffix = str(time.time())[2: 6]
    return prefix + '_' + tim + '_' + str(rd_num) + '_' + suffix

# 写入文件
def _file(named, html):
    f = open(named + '.html', 'w')
    f.write(html)
    f.close()

# 下载 文件
def _download(rec):
    return os.path.join( '', 'file',
        rec + '.pdf'
    )

# 列举 文件
def _files():
    ph = os.path.join( BASE_DIR, PDF_DIR )
    return os.listdir(ph)

# 删除 文件
def _trash(f):
    f = os.path.join( BASE_DIR, PDF_DIR, f )
    os.remove(f)