CREATE VIEW Student_Course_Summary AS
SELECT 
    s.student_id,
    s.first_name || ' ' || s.last_name AS student_name,
    s.major,
    c.course_name,
    c.department,
    e.semester,
    e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;