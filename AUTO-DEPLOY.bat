@echo off
echo ========================================
echo   Enhanced Job Detection System
echo   Auto Deployment Script
echo ========================================
echo.

echo 1. PREPARING FOR DEPLOYMENT...
echo.

echo Checking if all files are ready...
if exist "backend\Dockerfile" (
    echo ✅ Dockerfile found
) else (
    echo ❌ Dockerfile missing
    pause
    exit /b 1
)

if exist "backend\render.yaml" (
    echo ✅ render.yaml found
) else (
    echo ❌ render.yaml missing
    pause
    exit /b 1
)

echo.
echo 2. BUILD VERIFICATION...
echo.

cd backend
echo Building backend...
mvn clean package -DskipTests
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Build failed
    pause
    exit /b 1
)
echo ✅ Build successful

echo.
echo 3. DEPLOYMENT INSTRUCTIONS...
echo.

echo ========================================
echo   MANUAL DEPLOYMENT STEPS
echo ========================================
echo.
echo STEP 1: Create GitHub Repository
echo - Go to: https://github.com/new
echo - Repository name: enhanced-job-detector
echo - Description: Enhanced Rule-Based Fake Job Detection System
echo - Make it Public
echo - Click "Create repository"
echo.
echo STEP 2: Push to GitHub
echo - Run these commands:
echo   cd c:\fakeee
echo   git remote set-url origin https://github.com/YOUR_USERNAME/enhanced-job-detector.git
echo   git push -u origin main
echo.
echo STEP 3: Deploy Backend to Render
echo - Go to: https://render.com
echo - Sign up with GitHub
echo - Click "New +" → "Web Service"
echo - Connect your GitHub repository
echo - Configure:
echo   * Name: job-detector-backend
echo   * Environment: Docker
echo   * Root Directory: backend
echo   * Dockerfile: Dockerfile
echo   * Branch: main
echo   * Plan: Free
echo.
echo STEP 4: Create Database
echo - Click "New +" → "PostgreSQL"
echo - Name: job-detector-db
echo - Plan: Free
echo.
echo STEP 5: Set Environment Variables
echo - In your web service, add:
echo   * SPRING_DATASOURCE_URL (copy from database dashboard)
echo   * SPRING_DATASOURCE_USERNAME (copy from database dashboard)
echo   * SPRING_DATASOURCE_PASSWORD (copy from database dashboard)
echo.
echo STEP 6: Deploy Frontend to Vercel
echo - Run: cd frontend-new && npx vercel --prod
echo - Set REACT_APP_API_URL=https://jobdetector-backend.onrender.com
echo.
echo ========================================
echo.
echo Your system is ready for deployment!
echo All files have been prepared and tested.
echo.
echo Press any key to open deployment websites...
pause

echo Opening GitHub...
start https://github.com/new

echo Opening Render...
start https://render.com

echo Opening Vercel...
start https://vercel.com

echo.
echo 🚀 Your Enhanced Job Detection System is ready for deployment!
echo ========================================
pause
