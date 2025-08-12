-- Database setup for HarGharMunga Local Development
-- Run this script in your MySQL to set up the database

-- Create the database
CREATE DATABASE IF NOT EXISTS hargharmunga;
USE hargharmunga;

-- Table: users
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    contact_number VARCHAR(100),
    password_hash VARCHAR(255),
    role ENUM('admin','aanganwadi_worker','health_worker'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    aanganwaadi_id VARCHAR(100),
    gram VARCHAR(100),
    block VARCHAR(100),
    tehsil VARCHAR(100),
    zila VARCHAR(100),
    supervisor_name VARCHAR(100)
);

-- Table: students
CREATE TABLE IF NOT EXISTS students (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    name VARCHAR(100),
    mobile VARCHAR(100),
    password VARCHAR(100),
    guardian_name VARCHAR(100),
    father_name VARCHAR(100),
    mother_name VARCHAR(100),
    aanganwadi_code INT,
    age INT,
    dob VARCHAR(100),
    weight FLOAT,
    height FLOAT,
    health_status ENUM('healthy','malnourished','critical'),
    plant_photo LONGTEXT,
    pledge_photo LONGTEXT,
    address VARCHAR(255),
    totalImagesYet INT DEFAULT 0,
    INDEX (username)
);

-- Insert sample admin user (password: admin123)
INSERT INTO users (name, contact_number, password_hash, role, aanganwaadi_id) VALUES 
('Admin User', '9999999999', 'admin123', 'admin', 'ADMIN001');

-- Insert sample aanganwadi worker (password: worker123)
INSERT INTO users (name, contact_number, password_hash, role, aanganwaadi_id, gram, block, tehsil, zila) VALUES 
('Aanganwadi Worker', '8888888888', 'worker123', 'aanganwadi_worker', 'AWC001', 'Sample Village', 'Sample Block', 'Sample Tehsil', 'Sample District');

-- Insert sample student family
INSERT INTO students (username, name, mobile, password, guardian_name, father_name, mother_name, aanganwadi_code, age, dob, weight, height, health_status, address) VALUES 
('family001', 'Test Child', '7777777777', 'family123', 'Guardian Name', 'Father Name', 'Mother Name', 1001, 5, '2019-01-01', 15.5, 105.0, 'healthy', 'Sample Address');
