echo 'START INSTALL'
echo '======================>'
echo ''
echo ''
## mysql_package='mysql80-community-release-el7-3.noarch.rpm'
## MYSQL
echo '准备安装 Mysql'
sudo apt-get update -y
sudo apt upgrade -y

### 开始下载，然后安装
echo '安装 Mysql'
sudo apt-get install mysql-server

### 查看状态，准备登录
echo '安装 完成。'
systemctl enable mysqld.service
systemctl list-unit-files | grep mysqld
echo ''
echo '<======================'
## 结束
