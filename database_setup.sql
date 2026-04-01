-- Database setup script for Job Detector Application
-- Run this script in MySQL to create the database and initial setup

-- Create database
CREATE DATABASE IF NOT EXISTS job_detector;

-- Use the database
USE job_detector;

-- Note: Tables will be automatically created by Spring Boot JPA
-- due to 'spring.jpa.hibernate.ddl-auto=update' setting

-- Sample data insertion (optional - can be added via API)
-- Users table will be created automatically
-- Jobs table will be created automatically

-- You can verify the database structure after running the application:
-- DESCRIBE users;
-- DESCRIBE jobs;
