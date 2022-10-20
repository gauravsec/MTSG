# Installing JRE
sudo apt-get update
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

# Check Java version
javac -version

# Installing Jenkins
sudo apt install -y curl
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins
sudo systemctl start jenkins.service

# Get the password of Jenkins Admin User
#sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Installing Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install -y     ca-certificates     curl     gnupg     lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker ${USER}
sudo usermod -aG docker jenkins

# Check Docker is installed or not
sudo docker info

# Installing Maven
sudo apt update
sudo apt install -y maven
sudo mvn -version

# Run Sonarqube as container
sudo docker run --name sonarqube -d -p 9000:9000 sonarqube

#Genrating ssh keys
ssh-keygen
touch .ssh/authorized_keys
cat .ssh/id_rsa.pub > .ssh/authorized_keys

#echo Below is Jenkins first time Admin password
#sudo cat /var/lib/jenkins/secrets/initialAdminPassword
