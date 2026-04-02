@echo off
echo ========================================
echo   Enhanced Job Detection System
echo ========================================
echo.
echo 1. Starting Backend...
cd c:\fakeee\backend
start "Backend" cmd /k "mvn spring-boot:run"

echo 2. Waiting for backend to start...
timeout /t 15 /nobreak

echo 3. Starting Frontend...
cd c:\fakeee\frontend-new
start "Frontend" cmd /k "npm start"

echo 4. Opening browser...
timeout /t 10 /nobreak
start http://localhost:3001

echo ========================================
echo   System Started Successfully!
echo   Backend: http://localhost:8080
echo   Frontend: http://localhost:3001
echo ========================================
pause
