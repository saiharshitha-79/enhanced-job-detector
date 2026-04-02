# 🚀 Enhanced Job Detection System - Deployment Guide

## 📋 Overview
This guide will help you deploy your Enhanced Job Detection System to production using **Render** for the backend and **Vercel** for the frontend.

---

## 🔧 Backend Deployment (Render)

### Step 1: Push to GitHub
```bash
cd c:\fakeee
git remote set-url origin https://github.com/YOUR_USERNAME/enhanced-job-detector.git
git push -u origin main
```

### Step 2: Deploy to Render
1. **Go to** [render.com](https://render.com)
2. **Sign up** with your GitHub account
3. **Click "New +" → "Web Service"**
4. **Connect** your GitHub repository
5. **Select** `enhanced-job-detector/backend` folder
6. **Configure**:
   - **Name**: `job-detector-backend`
   - **Environment**: `Docker`
   - **Branch**: `main`
   - **Root Directory**: `backend`
   - **Dockerfile Path**: `Dockerfile`

### Step 3: Set Environment Variables
In Render dashboard, add these environment variables:
```bash
PORT=8080
SPRING_DATASOURCE_URL=postgresql://your-db-url:5432/job_detector
SPRING_DATASOURCE_USERNAME=your_username
SPRING_DATASOURCE_PASSWORD=your_password
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_JPA_SHOW_SQL=true
SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT=org.hibernate.dialect.PostgreSQLDialect
```

### Step 4: Create Database
1. **Click "New +" → "PostgreSQL"**
2. **Name**: `job-detector-db`
3. **Plan**: Free
4. **Copy** the database connection string
5. **Update** environment variables with actual database URL

---

## 🌐 Frontend Deployment (Vercel)

### Step 1: Deploy to Vercel
```bash
cd c:\fakeee\frontend-new
npx vercel --prod
```

### Step 2: Configure Environment Variables
In Vercel dashboard, add:
```bash
REACT_APP_API_URL=https://jobdetector-backend.onrender.com
```

### Step 3: Update Vercel Configuration
The `vercel.json` file is already configured to proxy API calls to your backend.

---

## ✅ Verification

### Test Your Live Application
1. **Backend**: `https://jobdetector-backend.onrender.com/api/auth/register`
2. **Frontend**: `https://your-app.vercel.app`

### API Endpoints
- **Register**: `POST /api/auth/register`
- **Login**: `POST /api/auth/login`
- **Analyze Job**: `POST /api/jobs/analyze`
- **Get Jobs**: `GET /api/jobs`

---

## 🔍 Troubleshooting

### Common Issues
1. **CORS Errors**: Update `@CrossOrigin` annotations
2. **Database Connection**: Check environment variables
3. **Build Failures**: Verify Dockerfile syntax
4. **API Timeouts**: Check Render service logs

### Debug Commands
```bash
# Check Render logs
# Go to Render dashboard → Logs

# Test API locally
curl -X POST https://jobdetector-backend.onrender.com/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Test User","email":"test@example.com","password":"password123"}'
```

---

## 🎉 Success!

Your Enhanced Job Detection System is now live:
- **Backend**: Render hosting with PostgreSQL
- **Frontend**: Vercel hosting with API proxy
- **Database**: PostgreSQL with automatic schema creation
- **Security**: CORS configured for production

---

## 📞 Support

If you encounter issues:
1. Check Render and Vercel logs
2. Verify environment variables
3. Test API endpoints individually
4. Ensure CORS is properly configured

**🚀 Your application is now production-ready!**
