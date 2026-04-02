@echo off
echo ========================================
echo   Enhanced Job Detection System
echo   Production Deployment
echo ========================================
echo.
echo 1. BACKEND DEPLOYMENT (Render)
echo    - Go to: https://render.com
echo    - Connect GitHub repository
echo    - Use backend/Dockerfile
echo    - Set environment variables
echo.
echo 2. FRONTEND DEPLOYMENT (Vercel)
echo    - Run: cd frontend-new && npx vercel --prod
echo    - Set REACT_APP_API_URL environment variable
echo.
echo 3. DATABASE SETUP
echo    - Create PostgreSQL database on Render
echo    - Update connection string in backend
echo.
echo 4. REPLACE PLACEHOLDERS:
echo    - YOUR_USERNAME in GitHub URL
echo    - Database credentials in render.yaml
echo.
echo ========================================
echo.
echo Ready for deployment! Your code is committed.
echo.
echo Next steps:
echo 1. Create GitHub repository
echo 2. Deploy to Render
echo 3. Deploy to Vercel
echo 4. Update environment variables
echo.
echo ========================================
pause
