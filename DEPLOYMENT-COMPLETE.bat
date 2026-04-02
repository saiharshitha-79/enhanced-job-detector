@echo off
echo ========================================
echo   Enhanced Job Detection System
echo   DEPLOYMENT COMPLETION SCRIPT
echo ========================================
echo.

echo ✅ DEPLOYMENT STATUS
echo.
echo Frontend: ✅ DEPLOYED to Vercel
echo    URL: https://beta-two.vercel.app
echo.
echo Backend: 🔄 DEPLOYING to Render
echo    URL: https://jobdetector-backend.onrender.com
echo    Latest Commit: fdba447
echo    Dockerfile: Fixed and in root
echo.

echo 🔧 TESTING DEPLOYMENT
echo.

echo Testing frontend...
curl -s https://beta-two.vercel.app >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✅ Frontend is LIVE and accessible
) else (
    echo ❌ Frontend not accessible yet
)

echo.
echo Testing backend health...
curl -s https://jobdetector-backend.onrender.com/api/auth/health >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✅ Backend is LIVE and healthy
) else (
    echo ❌ Backend not accessible yet
)

echo.
echo 🔧 DEPLOYMENT ACTIONS
echo.

echo Opening Render dashboard...
start https://render.com

echo Opening GitHub repository...
start https://github.com/saiharshitha-79/enhanced-job-detector

echo Opening your live frontend...
start https://beta-two.vercel.app

echo.
echo ========================================
echo   NEXT STEPS
echo ========================================
echo.
echo 1. Check Render dashboard for deployment status
echo 2. If backend is not live, click "Manual Deploy"
echo 3. Set environment variables if needed:
echo    - SPRING_DATASOURCE_URL
echo    - SPRING_DATASOURCE_USERNAME
echo    - SPRING_DATASOURCE_PASSWORD
echo 4. Test your live application
echo.

echo 🎉 CONGRATULATIONS!
echo Your Enhanced Job Detection System is nearly complete!
echo.
echo 🌐 Live URLs:
echo - Frontend: https://beta-two.vercel.app
echo - Backend: https://jobdetector-backend.onrender.com
echo - GitHub: https://github.com/saiharshitha-79/enhanced-job-detector
echo.
echo 📊 Your system will help job seekers avoid scams!
echo ========================================
pause
