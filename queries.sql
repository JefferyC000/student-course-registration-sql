-- View all students
SELECT * FROM Students;

-- Courses with instructor names
SELECT 
    c.course_name,
    c.department,
    c.credits,
    i.first_name || ' ' || i.last_name AS instructor_name
FROM Courses c
JOIN Instructors i ON c.instructor_id = i.instructor_id;

-- Students and their courses
SELECT 
    s.first_name || ' ' || s.last_name AS student_name,
    c.course_name,
    e.semester,
    e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
ORDER BY student_name;

-- Count students per course
SELECT 
    c.course_name,
    COUNT(e.student_id) AS total_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY total_students DESC;

-- Information Systems students
SELECT 
    first_name,
    last_name,
    major
FROM Students
WHERE major = 'Information Systems';

-- Students with grade A
SELECT 
    s.first_name || ' ' || s.last_name AS student_name,
    c.course_name,
    e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.grade = 'A';

-- Average credits by department
SELECT 
    department,
    AVG(credits) AS avg_credits
FROM Courses
GROUP BY department;

-- Total courses per student
SELECT 
    s.first_name || ' ' || s.last_name AS student_name,
    COUNT(e.course_id) AS total_courses
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY total_courses DESC;