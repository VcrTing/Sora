echo '======================>'
echo ''
echo ''
echo '安装 依赖'
sudo apt-get install -y epel-release
sudo apt-get install -y snapd
sudo snap install core
sudo snap refresh core
echo '依赖 安装完成'
sudo apt-get remove -y certbot
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
echo '开始配置'
sudo certbot --nginx
certbot install --cert-name pdf01.svr.up5d.com
echo '配置 完成'
echo ''
echo '<======================'