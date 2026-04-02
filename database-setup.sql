-- Enhanced Job Detection System - Database Setup
-- Run this script in MySQL to set up your database

-- Create database
CREATE DATABASE IF NOT EXISTS job_detector;
USE job_detector;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create jobs table
CREATE TABLE IF NOT EXISTS jobs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    description TEXT NOT NULL,
    risk_score INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    user_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert sample data
INSERT IGNORE INTO users (name, email, password) VALUES 
('Admin User', 'admin@jobdetector.com', 'admin123'),
('John Doe', 'john@example.com', 'password123');

INSERT IGNORE INTO jobs (company_name, email, salary, description, risk_score, status, user_id) VALUES 
('Microsoft Corporation', 'careers@microsoft.com', 85000.00, 'Senior Software Developer with competitive benefits and career growth opportunities', 0, 'SAFE', 1),
('Google LLC', 'careers@google.com', 95000.00, 'Frontend Developer position with excellent work-life balance', 0, 'SAFE', 1),
('QuickTech Solutions', 'hr@quicktech.com', 120000.00, 'Urgent hiring for software developer, no experience needed', 6, 'SUSPICIOUS', 2),
('GetRichFast Inc', 'opportunity@gmail.com', 150000.00, 'Quick money opportunity, work from home, no experience required', 9, 'FAKE', 2);

-- Show results
SELECT 'Database setup completed!' as status;
SELECT COUNT(*) as user_count FROM users;
SELECT COUNT(*) as job_count FROM jobs;
