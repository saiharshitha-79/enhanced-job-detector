#!/bin/bash
# Single Repository Setup - Enhanced Job Detector

echo "Setting up single repository..."

# 1. Add frontend to existing git
cd c:\fakeee
git add frontend-new/
git commit -m "Add React frontend application"

# 2. Set remote (replace YOUR_USERNAME)
git remote set-url origin https://github.com/YOUR_USERNAME/enhanced-job-detector.git

# 3. Push to GitHub
git push -u origin master

echo "Single repository setup complete!"
echo "Repository: https://github.com/YOUR_USERNAME/enhanced-job-detector"
