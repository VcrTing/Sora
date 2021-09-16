
import os, json, uuid, time, random, requests
from posixpath import pardir
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

    suffix = str(time.time())[2: 6] + '_PDF'
    return prefix + '_' + tim + '_' + str(rd_num) + '_' + suffix

# 写入文件
def _file(named, html):
    print('要写入的文件为 =', (named + '.html'))
    f = open(named + '.html', 'w')
    f.write(html)
    f.close()

# 下载文件
def req_html_form_link(link):
    res = { 'text': '' }
    try:
        res = requests.get(link)
        print('Link 请求成功。。')
    except Exception as e:
        pass
    finally:
        return res.text

# 提供 文件 下载
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