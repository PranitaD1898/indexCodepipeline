#!/bin/bash
set -e

echo "Updating system packages..."
sudo yum update -y

echo "Installing required packages..."
sudo yum install -y ruby wget

echo "Downloading CodeDeploy agent installer..."
cd /home/ec2-user
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install

echo "Making installer executable..."
chmod +x ./install

echo "Running CodeDeploy agent installer..."
sudo ./install auto

echo "Starting CodeDeploy agent..."
sudo systemctl start codedeploy-agent
sudo systemctl enable codedeploy-agent

echo "CodeDeploy agent status:"
sudo systemctl status codedeploy-agent || echo "Failed to start CodeDeploy agent"

echo "dep.sh completed."
