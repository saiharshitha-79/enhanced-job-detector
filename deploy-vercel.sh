#!/bin/bash
echo "Deploying frontend to Vercel..."

# 1. Install Vercel CLI
npm install -g vercel

# 2. Login to Vercel
vercel login

# 3. Update backend URL in vercel.json
echo "Updating vercel.json with your backend URL..."
# You need to replace: https://your-backend-domain.com
# With your actual Railway backend URL

# 4. Deploy to Vercel
cd c:\fakeee\frontend-new
vercel --prod

echo "Frontend deployed to Vercel!"
echo "Don't forget to update the backend URL in vercel.json"
