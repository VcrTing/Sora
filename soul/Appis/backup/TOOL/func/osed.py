import os, json, time

# 时间名称
def time_name():
    return int(time.strftime("%Y%m%d%H", time.localtime(time.time())))

# 路径是否存在
def path(rec):
    return os.path.exists(rec)

def _size(rec):
    size = 0
    for root, dirs, files in os.walk(rec):
        size += sum(
            [
                os.path.getsize(
                    os.path.join(root, name)
                ) for name in files
            ]
        )
    return size

# 文件夹大小
def size(rec):
    res = _size(rec)
    return int(res / 1024 / 1024)

# 磁盘大小
def size_full():
    info = os.statvfs('/')
    
    free = info.f_bsize * info.f_bavail / 1024 / 1024
    return int(free)

# 列举文件
def files(rec):
    f = []
    for root, dirs, files in os.walk(rec):  
        f.append(files)
    return f

# 删除
def trash(rec):
    if os.path.exists(rec):
        os.remove(rec)

# 加载 JSON
def load(rec):
    try:
        _path = rec
        
        with open(_path, 'r') as j:
            res = json.loads(j.read())
        return res
    except:
        return None

# 保存 JSON
def save(rec, data):
    try:
        _path = rec
        
        with open(_path, 'w') as j:
            j.write(json.dumps(data)) 
        return True
    except:
        return None