@echo off
echo ========================================
echo   Enhanced Job Detection System
echo   Render Backend Deployment
echo ========================================
echo.

echo 🔧 RENDER DEPLOYMENT STEPS
echo.

echo STEP 1: Open Render Dashboard
start https://render.com

echo.
echo STEP 2: Sign Up/Login with GitHub
echo.

echo STEP 3: Create Web Service
echo   - Click "New +" → "Web Service"
echo   - Connect GitHub account
echo   - Select repository (if it exists)
echo   - OR create manual deployment

echo.
echo STEP 4: Configure Web Service
echo   - Name: job-detector-backend
echo   - Environment: Docker
echo   - Root Directory: backend
echo   - Dockerfile: Dockerfile
echo   - Branch: main
echo   - Plan: Free
echo   - Click "Create Web Service"

echo.
echo STEP 5: Create PostgreSQL Database
echo   - Click "New +" → "PostgreSQL"
echo   - Name: job-detector-db
echo   - Database Name: job_detector
echo   - User: job_detector_user
echo   - Plan: Free
echo   - Click "Create Database"

echo.
echo STEP 6: Set Environment Variables
echo   In your web service settings, add:
echo   - SPRING_DATASOURCE_URL (copy from database dashboard)
echo   - SPRING_DATASOURCE_USERNAME (copy from database dashboard)
echo   - SPRING_DATASOURCE_PASSWORD (copy from database dashboard)
echo   - PORT: 8080
echo   - JAVA_OPTS: -Xmx512m -Xms256m

echo.
echo STEP 7: Manual Deploy (if GitHub not connected)
echo   Option A: Use Render CLI
echo   - npm install -g @render/cli
echo   - render login
echo   - cd backend
echo   - render deploy

echo   Option B: Upload Dockerfile
echo   - Zip backend folder
echo   - Upload to Render

echo.
echo ========================================
echo   EXPECTED RESULTS
echo ========================================
echo.
echo Backend URL: https://jobdetector-backend.onrender.com
echo Health Check: https://jobdetector-backend.onrender.com/api/auth/health
echo API Endpoints: https://jobdetector-backend.onrender.com/api/*
echo.
echo ========================================
echo.

echo Opening Render dashboard...
echo Please follow the steps above to complete deployment.
echo.

pause
