@echo off
echo ========================================
echo   Enhanced Job Detection System
echo   Complete Deployment Script
echo ========================================
echo.

echo 🔧 STEP 1: GitHub Repository Setup
echo.
echo Please provide your GitHub username:
set /p username="Enter your GitHub username: "

echo.
echo Setting up Git repository...
cd c:\fakeee
git remote set-url origin https://github.com/%username%/enhanced-job-detector.git
git push -u origin main

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Git push failed. Please check your GitHub username and repository.
    pause
    exit /b 1
)

echo ✅ Code pushed to GitHub successfully!
echo.

echo 🔧 STEP 2: Frontend Deployment to Vercel
echo.
cd frontend-new
echo Deploying frontend to Vercel...
npx vercel --prod

echo.
echo 🔧 STEP 3: Backend Deployment Instructions
echo.
echo ========================================
echo   MANUAL STEPS FOR RENDER DEPLOYMENT
echo ========================================
echo.
echo 1. Go to: https://render.com
echo 2. Sign up with GitHub
echo 3. Click "New +" → "Web Service"
echo 4. Connect repository: %username%/enhanced-job-detector
echo 5. Configure:
echo    - Name: job-detector-backend
echo    - Environment: Docker
echo    - Root Directory: backend
echo    - Dockerfile: Dockerfile
echo    - Branch: main
echo    - Plan: Free
echo.
echo 6. Create PostgreSQL Database:
echo    - Click "New +" → "PostgreSQL"
echo    - Name: job-detector-db
echo    - Plan: Free
echo.
echo 7. Set Environment Variables (copy from database dashboard):
echo    - SPRING_DATASOURCE_URL
echo    - SPRING_DATASOURCE_USERNAME
echo    - SPRING_DATASOURCE_PASSWORD
echo.
echo 8. Deploy and test at:
echo    - Health: https://jobdetector-backend.onrender.com/api/auth/health
echo    - Frontend: https://your-app.vercel.app
echo.

echo ========================================
echo   OPENING DEPLOYMENT WEBSITES
echo ========================================
echo.

echo Opening Render...
start https://render.com

echo Opening your GitHub repository...
start https://github.com/%username%/enhanced-job-detector

echo.
echo 🎉 DEPLOYMENT PROCESS INITIATED!
echo.
echo Your Enhanced Job Detection System is being deployed!
echo.
echo Next steps:
echo 1. Complete Render deployment (manual steps above)
echo 2. Update frontend environment variables if needed
echo 3. Test your live application
echo.
echo ========================================
pause
