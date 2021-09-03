## GITHUB  
测试连接: ssh -T git@github.com  
上传: git push  

## 地址
git clone https://github.com/VcrTing/Sora.git

## SUPERVISOR
停止:  
sudo supervisorctl stop all  

## 自然启动
python3 ~/Sora/soul/manage.py runserver 0.0.0.0:8001


## SCP 完整路径
sshpass -p 'password' scp -P 34567 -r root@domain.com:/root/Backup/* ./

sshpass -p '!d7' scp -P 34567 -r root@crm03.svr.up5d.com:/root/Backup/* /root/BACK_FILES_IMPORTANT/Eye/Eye_2021090311