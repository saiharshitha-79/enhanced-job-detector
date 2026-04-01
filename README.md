# Enhanced Rule-Based Fake Internship & Job Offer Detection System

A full-stack web application that helps identify potentially fraudulent job postings using rule-based analysis and machine learning techniques.

## 🚀 Features

- 🔍 **Smart Job Analysis** - Rule-based risk scoring system
- 👤 **User Authentication** - Secure registration and login system
- 📊 **Interactive Dashboard** - Real-time job analysis results
- 🛡️ **Risk Assessment** - SAFE, SUSPICIOUS, FAKE classification
- 💾 **Data Persistence** - MySQL database integration
- 🔒 **Security** - CORS enabled and input validation

## 🛠️ Tech Stack

### Backend
- **Framework**: Spring Boot 3.x
- **Language**: Java 17
- **Database**: MySQL 8.0
- **ORM**: Spring Data JPA
- **Build Tool**: Maven
- **Security**: Spring Security (CORS configuration)

### Frontend
- **Framework**: React 18
- **Language**: JavaScript ES6+
- **HTTP Client**: Axios
- **Routing**: React Router DOM
- **Styling**: CSS3 with responsive design
- **Build Tool**: Create React App

## 📋 Installation & Setup

### Prerequisites
- Java 17+
- Node.js 16+
- MySQL 8.0+
- Maven 3.6+

### Backend Setup
```bash
cd backend
mvn clean install
mvn spring-boot:run
```

### Frontend Setup
```bash
cd frontend-new
npm install
npm start
```

### Database Setup
```sql
CREATE DATABASE job_detector;
USE job_detector;
```

## 🎯 Usage

1. **Start the applications**:
   - Backend: `http://localhost:8080`
   - Frontend: `http://localhost:3001`

2. **Register a new account** at `http://localhost:3001/register`

3. **Login** with your credentials at `http://localhost:3001/login`

4. **Analyze job postings** from the dashboard at `http://localhost:3001/dashboard`

## 🔍 Risk Analysis Rules

The system analyzes job postings based on multiple risk factors:

### High Risk Indicators
- Suspicious email domains (gmail.com, yahoo.com, etc.)
- Unrealistic salary ranges
- Urgent hiring language
- Requests for payment/training fees
- Vague job descriptions

### Medium Risk Indicators
- Generic company names
- Remote-only positions without details
- Poor grammar in postings

### Safe Indicators
- Official company domains
- Realistic salary ranges
- Detailed job requirements
- Professional contact information

## 📊 API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login

### Job Analysis
- `POST /api/jobs/analyze` - Analyze job posting
- `GET /api/jobs` - Get all analyzed jobs

## 🗄️ Database Schema

### Users Table
```sql
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
```

### Jobs Table
```sql
CREATE TABLE jobs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    description TEXT NOT NULL,
    risk_score INT NOT NULL,
    status VARCHAR(20) NOT NULL
);
```

## 🚀 Deployment

### Docker Deployment
```yaml
version: '3.8'
services:
  backend:
    build: ./backend
    ports:
      - "8080:8080"
    environment:
      - SPRING_DATASOURCE_URL=jdbc:mysql://mysql:3306/job_detector
      - SPRING_DATASOURCE_USERNAME=root
      - SPRING_DATASOURCE_PASSWORD=password
  
  frontend:
    build: ./frontend-new
    ports:
      - "3001:3000"
    depends_on:
      - backend
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Your Name** - *Initial Development & Architecture*

---

**Built with ❤️ to help job seekers avoid fraudulent opportunities**
