@echo off
echo ========================================
echo   Enhanced Job Detection System
echo   Repository Creation Guide
echo ========================================
echo.

echo 🔧 STEP 1: Create GitHub Repository
echo.
echo Opening GitHub repository creation page...
start https://github.com/new

echo.
echo Please fill in:
echo Repository name: enhanced-job-detector
echo Description: Enhanced Rule-Based Fake Job Detection System
echo Make it: PUBLIC
echo Click: Create repository

echo.
echo After creating the repository, press any key to continue...
pause

echo.
echo 🔧 STEP 2: Push Code to GitHub
echo.
cd c:\fakeee
git remote set-url origin https://github.com/saiharshitha-79/enhanced-job-detector.git
git push -u origin main

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Push failed. Make sure you created the repository first.
    pause
    exit /b 1
)

echo ✅ Code pushed successfully!
echo.

echo 🔧 STEP 3: Deploy Frontend to Vercel
echo.
cd frontend-new
npx vercel --prod

echo.
echo 🔧 STEP 4: Deploy Backend to Render
echo.
echo Opening Render...
start https://render.com

echo.
echo Follow these steps in Render:
echo 1. Sign up with GitHub
echo 2. Click "New +" → "Web Service"
echo 3. Connect: saiharshitha-79/enhanced-job-detector
echo 4. Configure:
echo    - Name: job-detector-backend
echo    - Environment: Docker
echo    - Root Directory: backend
echo    - Plan: Free
echo 5. Create PostgreSQL database
echo 6. Set environment variables
echo.

echo Opening your GitHub repository...
start https://github.com/saiharshitha-79/enhanced-job-detector

echo.
echo 🎉 Your Enhanced Job Detection System deployment is ready!
echo ========================================
pause
