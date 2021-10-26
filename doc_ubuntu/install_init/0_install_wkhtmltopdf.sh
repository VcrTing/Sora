echo '======================>'
echo ''
echo ''
sudo apt update -y
sudo apt-get install -y git
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb
sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb
sudo apt -f install -y
wkhtmltopdf --version
# sudo apt-get install -y xvfb
# sudo apt-get install -y wkhtmltopdf
echo ''
echo '<======================'