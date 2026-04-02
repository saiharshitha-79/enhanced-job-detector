#!/bin/bash
echo "=========================================="
echo "  Enhanced Job Detection System"
echo "  Production Deployment"
echo "=========================================="
echo.

echo "1. Building backend..."
cd c:\fakeee\backend
mvn clean package -DskipTests

echo "2. Building frontend..."
cd c:\fakeee\frontend-new
npm run build

echo "3. Deployment ready!"
echo "   Backend: Deploy to Render"
echo "   Frontend: Deploy to Vercel"
echo.
echo "4. Next steps:"
echo "   a) Push backend to Render"
echo "   b) Deploy frontend to Vercel"
echo "   c) Update database credentials"
echo.
echo "=========================================="

# Create environment file for frontend
echo "REACT_APP_API_URL=https://jobdetector-backend.onrender.com" > c:\fakeee\frontend-new\.env

echo "Environment file created for frontend!"
echo "=========================================="
