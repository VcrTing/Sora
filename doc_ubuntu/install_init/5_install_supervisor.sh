echo '======================>'
echo ''
echo ''
echo '安装 Supervisor'
sudo apt-get remove supervisor -y
sudo apt-get install supervisor -y

echo '安装完成'
rm -rf /etc/supervisor/conf.d/*
echo '文件 配置完成'
sudo apt-get install sshpass unzip zip -y
echo ''
echo '<======================'