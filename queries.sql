-- =====================================================
-- Frequently Used Queries
-- =====================================================

-- Display all students

SELECT * FROM Students;

-- Display all courses

SELECT * FROM Courses;

-- Display all instructors

SELECT * FROM Instructors;

-- Display all enrollments

SELECT * FROM Enrollments;

-- Display all course assignments

SELECT * FROM Course_Assignments;

--------------------------------------------------------

-- Find a student by ID

SELECT *
FROM Students
WHERE student_id = 1001;

--------------------------------------------------------

-- Display all students enrolled in courses

SELECT
s.student_name,
c.course_name
FROM Students s
JOIN Enrollments e
ON s.student_id = e.student_id
JOIN Courses c
ON e.course_id = c.course_id;

--------------------------------------------------------

-- Display course and assigned instructor

SELECT
c.course_name,
i.instructor_name
FROM Courses c
JOIN Course_Assignments ca
ON c.course_id = ca.course_id
JOIN Instructors i
ON ca.instructor_id = i.instructor_id;

--------------------------------------------------------

-- Count students enrolled in each course

SELECT
c.course_name,
COUNT(*) AS total_students
FROM Courses c
JOIN Enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_name;

--------------------------------------------------------

-- Complete Academic Report

SELECT
s.student_id,
s.student_name,
s.email,
s.admission_date,

c.course_name,
c.credits,

e.semester,

i.instructor_name,
i.department

FROM Students s
JOIN Enrollments e
ON s.student_id = e.student_id
JOIN Courses c
ON e.course_id = c.course_id
JOIN Course_Assignments ca
ON c.course_id = ca.course_id
JOIN Instructors i
ON ca.instructor_id = i.instructor_id;
