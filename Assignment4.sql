
/* Chap 3, Slide 52. List all departments along with # of instructors in each department */
select dept_name,
    (select count(*)
        from instructor
        where department.dept_name = instructor.dept_name)
        as num_instructors
from department;

/* Chap 3, slide 9. List the names of students instructors along with the titles of courses that they have taken */
select name, title
from student natural join takes, course
where takes.course_id = course.course_id;

/* Chap 3, slide 10. */
select name, title
from  (student natural join takes)  join course using (course_id);

/* Chap 3, slide 11. retrieve all the info for students taking certain courses. */
select *
from  student join takes on student.ID  = takes.ID;

/* Chap 3, slide 11. Equivalent to the query example above.*/
select *
from  student , takes
where  student.ID  = takes.ID;

/* Chap 3, slide 19: find me the courses that have prerequisites  */
select *
from course natural right outer join prereq;

/* Chap 3, slide 19 */
select *
from course full join prereq using (course_id);

/* Chap 3, slide 20 */
Select *
From course inner join prereq on course.course_id = prereq.course_id;

/* Chap 3, slide 20 */
Select *
From course left outer join prereq on
course.course_id = prereq.course_id;

/* */
Select *
From course natural right outer join prereq;

/* */
Select *
from course full outer join prereq using (course_id);

/* Homework Query #1: Retrieve all courses that have the letters a, e, i in THAT order in their names*/
SELECT *
FROM course
WHERE LOWER(title) like '%a%e%i%';

/* Homework Query #2: Retrieve all courses that have the letters a, e, i in ANY order in their names */
SELECT *
FROM course
WHERE LOWER(title) like '%a%' and LOWER(title) like '%e%' and LOWER(title) like '%i%';

/* Homework Query #3: Retrieve the names of all students who failed a course (grade of F) along with the
   name of the course that they failed. */
SELECT name, title
FROM student, course, takes
WHERE takes.ID = student.ID
  and takes.course_id = course.course_id and grade = 'F';

/* Homework Query #4: Retrieve the percentage of solid A grades compared to all courses,
   and rename that column "Percent_A" */
SELECT COUNT(CASE
        WHEN grade = 'A' THEN TRUE
        END) * 100.0 / COUNT(*) AS Percent_A
FROM
  takes;

/* Homework Query #5: Retrieve the names and numbers of all courses that do not have prerequisites. */
SELECT title as COURSE, course_id as "COURSE NUMBER"
FROM course as c
WHERE NOT EXISTS (
    SELECT *
    FROM prereq
    WHERE prereq.course_id = c.course_id);

/* Homework Query #6: Retrieves the names of all students and their advisors if they have one. */
SELECT s.name AS Student, i.name AS Advisor
FROM student s
LEFT OUTER JOIN advisor a ON s.ID = a.s_ID
LEFT OUTER JOIN instructor i ON a.i_ID = i.ID;












