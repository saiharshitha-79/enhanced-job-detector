#!/bin/bash
echo "Deploying backend to Railway..."

# 1. Install Railway CLI
npm install -g @railway/cli

# 2. Login to Railway
railway login

# 3. Deploy backend
cd c:\fakeee\backend
railway up

echo "Backend deployed to Railway!"
echo "Get your Railway URL from: https://railway.app/project"
