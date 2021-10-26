echo '======================>'
echo ''
echo ''
### Nginx
echo '准备安装 NGINX'
sudo apt-get install nginx -y
sudo systemctl status nginx
sudo ufw allow 'Nginx Full'

echo '安装 完成'
echo '正在更改 配置文件'
mv /etc/nginx/nginx.conf
mv /etc/nginx/sites-available/default
cp ./SAVE/nginx.conf /etc/nginx/nginx.conf

echo '覆盖文件'
cp ./SAVE/default_enabled /etc/nginx/sites-enabled/default
cp ./SAVE/default_available /etc/nginx/sites-available/default

echo '完成文件 配置'
echo ''
echo '<======================'