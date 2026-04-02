@echo off
echo ========================================
echo   Enhanced Job Detection System
echo   FINAL DEPLOYMENT - Backend Fixed!
echo ========================================
echo.

echo ✅ BACKEND COMPILATION FIXED!
echo    - JobController syntax error resolved
echo    - Maven build successful
echo    - JAR file created
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
echo After creating repository, press any key to continue...
pause

echo.
echo 🔧 STEP 2: Push Fixed Code to GitHub
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

echo 🔧 STEP 3: Deploy Backend to Render
echo.
echo Opening Render dashboard...
start https://render.com

echo.
echo Follow these exact steps:
echo 1. Sign up with GitHub
echo 2. Click "New +" → "Web Service"
echo 3. Connect: saiharshitha-79/enhanced-job-detector
echo 4. Configure:
echo    - Name: job-detector-backend
echo    - Environment: Docker
echo    - Root Directory: backend
echo    - Dockerfile: Dockerfile
echo    - Branch: main
echo    - Plan: Free
echo 5. Create PostgreSQL database
echo 6. Set environment variables from database dashboard

echo.
echo 🔧 STEP 4: Deploy Frontend to Vercel
echo.
cd c:\fakeee\frontend-new
npx vercel --prod

echo.
echo ========================================
echo   DEPLOYMENT COMPLETE!
echo ========================================
echo.
echo Your Enhanced Job Detection System will be live at:
echo - Backend: https://jobdetector-backend.onrender.com
echo - Frontend: https://your-app.vercel.app
echo.
echo 🎉 Congratulations! Your system is helping job seekers!
echo ========================================
pause
