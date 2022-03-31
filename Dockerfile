FROM jenkins/jenkins:lts

USER root

RUN apt-get -y update && \
    apt-get -y install jq && \
    apt-get -y install \
#docker
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get -y update && \
    apt-get -y install docker-ce docker-ce-cli containerd.io && \
    usermod -aG docker jenkins && \
    usermod -aG root jenkins && \
    echo -n > /var/run/docker.sock && \
    chmod 666 /var/run/docker.sock && \
#Horusec
    curl -fsSL https://raw.githubusercontent.com/ZupIT/horusec/main/deployments/scripts/install.sh | sed s/"sudo"// | bash -s latest

USER jenkins