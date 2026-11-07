USE university_db;

-- Test 01: Unknown Column
INSERT INTO student
(student_code, full_name, email, phone)
VALUES
('S010', 'Test One', 'test1@example.com', '0771234567');


-- Test 02: NOT NULL Constraint
INSERT INTO student
(student_code, full_name)
VALUES
('S011', 'Test Two');


-- Test 03: Wrong Data Type
INSERT INTO course
(code, title, credits, lecturer_id)
VALUES
('CS301', 'Test Course', 'three', 1);


-- Test 04: Duplicate Value
INSERT INTO student
(student_code, full_name, email)
VALUES
('S001', 'Test Three', 'test3@example.com');


-- Test 05: Column Length
INSERT INTO department
(code, name)
VALUES
('D0000000001', 'Too Long Code');


-- Test 06: Foreign Key Constraint
INSERT INTO enrollment
(student_id, course_id, grade)
VALUES
(1, 999, 'A');


-- Test 07: Delete Referenced Data
DELETE FROM department
WHERE code = 'D01';


-- Test 08: CHECK Constraint
INSERT INTO course
(code, title, credits, lecturer_id)
VALUES
('CS302', 'Test Course', 10, 1);


-- ALTER TABLE: Add phone column
ALTER TABLE student
ADD COLUMN phone VARCHAR(15);

DESCRIBE student;

SELECT * FROM student;


-- Remove phone column
ALTER TABLE student
DROP COLUMN phone;