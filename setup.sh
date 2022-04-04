sudo apt install default-jre
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
apt-get -y install jq
curl -fsSL https://raw.githubusercontent.com/ZupIT/horusec/main/deployments/scripts/install.sh | bash -s latest
sudo usermod -aG root jenkins
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
git clone https://github.com/ZupIT/horusec-platform.git
cd horusec-platform/
make install
