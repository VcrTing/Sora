## GITHUB  
测试连接: ssh -T git@github.com  
上传: git push  

## 地址
git clone https://github.com/VcrTing/Sora.git

## SUPERVISOR
停止:  
sudo supervisorctl stop all  

## 自然启动
python3 manage.py runserver 0.0.0.0:8001
/
python3 ~/Sora/soul/manage.py runserver 0.0.0.0:8001


## SCP 完整路径
sshpass -p 'password' scp -P 34567 -r root@domain.com:/root/Backup/* ./

sshpass -p '!d7' scp -P 34567 -r root@crm03.svr.up5d.com:/root/Backup/* /root/BACK_FILES_IMPORTANT/Eye/Eye_2021090311

## 安装 wkhtmltopdf
### https://wkhtmltopdf.org/downloads.html  
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.1.4-2/wkhtmltox-0.12.1.4-2.centos7.x86_64.rpm

rpm -ivh wkhtmltox-0.12.1.4-2.centos7.x86_64.rpm
或者 sudo rpm -ivh --prefix=/opt wkhtmltox-0.12.1.4-2.centos7.x86_64.rpm

yum install -y libXext libjpeg xorg-x11-fonts-75dpi xorg-x11-fonts-Type1

wkhtmltopdf https://www.baidu.com baidu.pdf


## 安装 Pandoc
sudo yum -y install stack
sudo yum install zlib-devel
git clone https://github.com/jgm/pandoc
cd pandoc


## 安装中文字体
fc-list  :lang=zh

cd /usr/share/fonts
mkdir chinese

wget http://xz.w10a.com/small/simsun.zip