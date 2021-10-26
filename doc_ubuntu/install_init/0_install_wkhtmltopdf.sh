sudo apt update -y
sudo apt-get install -y git
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb
sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb
sudo apt -f install -y
wkhtmltopdf --version
cp ../../air/simsun.ttf /usr/share/fonts/simsun.ttf
mkdir /usr/share/fonts/chinese
cp ../../air/simsun.ttf /usr/share/fonts/chinese/simsun.ttf
mkdir /usr/share/fonts/fonts
cp ../../air/simsun.ttf /usr/share/fonts/fonts/simsun.ttf
cp ../../air/simsun.ttf /usr/share/fonts/truetype/simsun.ttf
# sudo apt-get install -y xvfb
# sudo apt-get install -y wkhtmltopdf