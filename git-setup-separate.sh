#!/bin/bash
# Separate Repositories Setup - Enhanced Job Detector

echo "Setting up separate repositories..."

# 1. Backend Repository
cd c:\fakeee\backend
git init
git add .
git commit -m "Initial backend commit - Spring Boot API"
git remote add origin https://github.com/YOUR_USERNAME/enhanced-job-detector-backend.git
git push -u origin master

echo "Backend repository: https://github.com/YOUR_USERNAME/enhanced-job-detector-backend"

# 2. Frontend Repository
cd c:\fakeee\frontend-new
git init
git add .
git commit -m "Initial frontend commit - React application"
git remote add origin https://github.com/YOUR_USERNAME/enhanced-job-detector-frontend.git
git push -u origin master

echo "Frontend repository: https://github.com/YOUR_USERNAME/enhanced-job-detector-frontend"
echo "Separate repositories setup complete!"
