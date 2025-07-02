#!/bin/bash
set -e

echo "Updating packages..."
yum update -y

echo "Installing dependencies..."
yum install -y ruby wget

echo "Downloading CodeDeploy agent installer..."
cd /home/ec2-user
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install -O install

echo "Making installer executable..."
chmod +x install

echo "Running installer..."
./install auto

echo "Starting agent..."
systemctl start codedeploy-agent
systemctl enable codedeploy-agent

echo "Deployment done."
