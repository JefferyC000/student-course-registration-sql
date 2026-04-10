INSERT INTO Students (student_id, first_name, last_name, major, email) VALUES
(1, 'Jeffery', 'Conner', 'Information Systems', 'jeffery.conner@email.com'),
(2, 'Eric', 'Velasquez', 'Computer Science', 'eric.velasquez@email.com'),
(3, 'Ayesha', 'Khan', 'Business Analytics', 'ayesha.khan@email.com'),
(4, 'Justin', 'Brewer', 'Information Systems', 'justin.brewer@email.com'),
(5, 'Maria', 'Lopez', 'Accounting', 'maria.lopez@email.com'),
(6, 'Daniel', 'Nguyen', 'Computer Science', 'daniel.nguyen@email.com');

INSERT INTO Instructors (instructor_id, first_name, last_name, department) VALUES
(1, 'John', 'Smith', 'Information Systems'),
(2, 'Linda', 'Johnson', 'Computer Science'),
(3, 'Robert', 'Davis', 'Business');

INSERT INTO Courses (course_id, course_name, department, credits, instructor_id) VALUES
(1, 'Database Systems', 'Information Systems', 3, 1),
(2, 'Networking', 'Computer Science', 3, 2),
(3, 'Software Engineering', 'Computer Science', 4, 2),
(4, 'Business Analytics', 'Business', 3, 3),
(5, 'Systems Analysis and Design', 'Information Systems', 3, 1);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, semester, grade) VALUES
(1, 1, 1, 'Spring 2026', 'A'),
(2, 1, 2, 'Spring 2026', 'B'),
(3, 2, 1, 'Spring 2026', 'B'),
(4, 2, 3, 'Spring 2026', 'A'),
(5, 3, 4, 'Spring 2026', 'A'),
(6, 4, 2, 'Spring 2026', 'C'),
(7, 4, 5, 'Spring 2026', 'B'),
(8, 5, 1, 'Spring 2026', 'A'),
(9, 6, 3, 'Spring 2026', 'B'),
(10, 6, 2, 'Spring 2026', 'A');