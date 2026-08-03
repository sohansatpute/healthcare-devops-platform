#!/bin/bash

set -euxo pipefail

###########################################
# Jenkins Server Bootstrap Script
###########################################

# Log all output
exec > >(tee /var/log/jenkins-bootstrap.log | logger -t jenkins-bootstrap -s 2>/dev/console) 2>&1

echo "=========================================="
echo "Jenkins Installation Started"
echo "Time: $(date)"
echo "=========================================="

###########################################
# Update System
###########################################

echo "Updating system packages..."

retry dnf update -y

###########################################
# Install Required Packages
###########################################

echo "Installing Java, Git, Docker and Curl..."

retry dnf install -y \
java-21-amazon-corretto \
git \
docker \

###########################################
# Verify Installations
###########################################

java -version
git --version
docker --version
aws --version
curl --version

###########################################
# Add Jenkins Repository
###########################################

echo "Adding Jenkins Repository..."

retry curl -fsSL -L \
https://pkg.jenkins.io/redhat-stable/jenkins.repo \
-o /etc/yum.repos.d/jenkins.repo

###########################################
# Import Jenkins GPG Key
###########################################

rpm --import https://pkg.jenkins.io/rpm-stable/repodata/repomd.xml.key

###########################################
# Refresh Repository Cache
###########################################

dnf clean all
retry dnf makecache -y

###########################################
# Install Jenkins
###########################################

echo "Installing Jenkins..."

retry dnf install -y jenkins

###########################################
# Enable Docker
###########################################

systemctl enable docker
retry systemctl start docker

###########################################
# Add Jenkins User to Docker Group
###########################################

usermod -aG docker jenkins

###########################################
# Enable Jenkins
###########################################

systemctl daemon-reload

systemctl enable jenkins
retry systemctl start jenkins

###########################################
# Verify Jenkins
###########################################

systemctl status jenkins --no-pager

echo "=========================================="
echo "Jenkins Installation Completed"
echo "Time: $(date)"
echo "=========================================="