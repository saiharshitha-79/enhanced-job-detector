# Enhanced Rule-Based Fake Internship & Job Offer Detection System

A full-stack web application that analyzes job offers using rule-based algorithms to detect potentially fake or suspicious opportunities.

## Tech Stack
- **Frontend**: React 18 with functional components, hooks, and Axios
- **Backend**: Java Spring Boot with REST APIs
- **Database**: MySQL

## Project Structure
```
job-detector/
├── backend/                        # Spring Boot application
│   ├── src/main/java/com/jobdetector/
│   │   ├── JobDetectorApplication.java
│   │   ├── controller/
│   │   ├── entity/
│   │   ├── repository/
│   │   └── service/
│   ├── src/main/resources/
│   │   └── application.properties
│   ├── pom.xml
│   └── README.md
├── frontend/                       # React application
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── pages/
│   │   │   ├── Register.js
│   │   │   ├── Login.js
│   │   │   └── Dashboard.js
│   │   ├── App.js
│   │   ├── App.css
│   │   ├── index.js
│   │   └── index.css
│   ├── package.json
│   └── README.md
└── README.md                       # This file
```

## Features
- User authentication (registration/login)
- Rule-based job offer analysis
- Risk scoring system (0-10+ points)
- Status classification (SAFE/SUSPICIOUS/FAKE)
- Job analysis history
- Color-coded UI indicators

## Rule-Based Analysis Logic

### Risk Factors:
1. **High Salary**: Salary > $100,000 → +2 risk points
2. **Suspicious Email Domains**: gmail.com, yahoo.com → +2 risk points
3. **Suspicious Keywords**: "urgent", "quick money", "no experience", "work from home" → +3 risk points

### Classification:
- **Risk Score ≥ 5**: FAKE (Red)
- **Risk Score ≥ 3**: SUSPICIOUS (Yellow)
- **Risk Score < 3**: SAFE (Green)

## Setup Instructions

### Prerequisites
- Java 17+
- Maven 3.6+
- Node.js 16+
- MySQL 8.0+

### Step 1: Database Setup
```sql
CREATE DATABASE job_detector;
```

### Step 2: Backend Setup
1. Navigate to backend directory:
```bash
cd backend
```

2. Update database credentials in `src/main/resources/application.properties`

3. Run the backend:
```bash
mvn clean install
mvn spring-boot:run
```

Backend will start on `http://localhost:8080`

### Step 3: Frontend Setup
1. Navigate to frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Start the frontend:
```bash
npm start
```

Frontend will start on `http://localhost:3000`

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user

### Job Analysis
- `POST /api/jobs/analyze` - Analyze job offer
- `GET /api/jobs` - Get all analyzed jobs

## Usage
1. Start both backend and frontend applications
2. Register a new user account
3. Login to access the dashboard
4. Enter job details in the analysis form
5. View risk assessment and classification
6. Browse previous analyses in the history section

## Sample Test Data
Try these examples to test the detection system:

**Safe Job Example:**
- Company: "Microsoft Corporation"
- Email: "careers@microsoft.com"
- Salary: 80000
- Description: "Software developer position with competitive benefits"

**Suspicious Job Example:**
- Company: "QuickTech Solutions"
- Email: "jobs@quicktech.com"
- Salary: 95000
- Description: "Urgent hiring for software developer"

**Fake Job Example:**
- Company: "GetRichFast Inc"
- Email: "opportunity@gmail.com"
- Salary: 150000
- Description: "Quick money opportunity, no experience required, work from home"
