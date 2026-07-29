#!/bin/bash

dnf update -y
dnf install docker -y
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

# Install SSM Agent
dnf install -y amazon-ssm-agent
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent