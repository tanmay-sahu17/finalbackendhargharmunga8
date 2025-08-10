-- Database Schema Update for Normalized Design
-- This will move hierarchical data from students to users table and use JOINs for filtering

-- Step 1: Rename columns for consistency
ALTER TABLE students RENAME COLUMN aanganwadi_code TO aanganwadi_id;
ALTER TABLE users RENAME COLUMN aanganwaadi_id TO aanganwadi_id;

-- Step 2: Remove redundant columns from students table
ALTER TABLE students
DROP COLUMN pariyojna_name,
DROP COLUMN sector_name,
DROP COLUMN village_name,
DROP COLUMN aanganwadi_kendra_name;

-- Step 3: Add hierarchical columns to users table
ALTER TABLE users
ADD COLUMN pariyojna_name VARCHAR(100),
ADD COLUMN sector_name VARCHAR(100),
ADD COLUMN village_name VARCHAR(100),
ADD COLUMN aanganwadi_kendra_name VARCHAR(100);

-- Step 4: Create indexes for better JOIN performance
CREATE INDEX idx_students_aanganwadi_id ON students(aanganwadi_id);
CREATE INDEX idx_users_aanganwadi_id ON users(aanganwadi_id);
CREATE INDEX idx_users_pariyojna ON users(pariyojna_name);
CREATE INDEX idx_users_sector ON users(sector_name);
CREATE INDEX idx_users_village ON users(village_name);
CREATE INDEX idx_users_aanganwadi_kendra ON users(aanganwadi_kendra_name);
