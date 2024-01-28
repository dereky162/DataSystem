/* */
DROP TABLE IF EXISTS grade_points;

/* [4]: Create a table grade_points (grade, points) that maps letter grades to number grades */
CREATE TABLE grade_points (
    grade VARCHAR(2) NOT NULL PRIMARY KEY,
    points NUMERIC(2, 1),
    CONSTRAINT check_points CHECK(points >= 0.0 AND points <= 4.0)

);

/* [4a] Letter grades and their numeric-equivalent */
INSERT into grade_points (grade, points)
    VALUES ('A', 4.0), ('A-', 3.7), ('B+', 3.3), ('B', 3.0), ('B-', 2.7), ('C+', 2.3), ('C', 2.0),
           ('C-', 1.7), ('D+', 1.3), ('D', 1.0), ('D-', 0.7), ('F', 0.0);


/* [5]: Add a foreign key from the grade column in the existing "takes" table to "grade_points"
ALTER TABLE takes

    ADD CONSTRAINT fk_grade
   FOREIGN KEY(grade) REFERENCES grade_points(grade);


 [6] Create v_takes_points view */
CREATE OR REPLACE VIEW v_takes_points AS
	SELECT t.*, g.points
    FROM takes as t
    LEFT OUTER JOIN grade_points as g ON t.grade = g.grade;

/* [6] Retrieve v_takes_points view, returning tables "takes" with numeric equivalent of grades */
SELECT *
FROM v_takes_points;

/* [7] Total grade points for student X */
SELECT COALESCE(SUM(credits * g.points), 0) AS "Total grade points for student ID: 00128"
FROM course, takes
LEFT OUTER JOIN grade_points g ON takes.grade = g.grade
WHERE takes.ID = '00128';

/* [8] GPA for student X */
SELECT COALESCE(SUM(credits * g.points) / SUM(credits), 0) AS "GPA for student ID: 00128"
FROM course, takes
LEFT OUTER JOIN grade_points g ON takes.grade = g.grade
WHERE takes.ID = '00128';

/* [9] Find GPA for all students */
SELECT COALESCE(SUM(c.credits * g.points) / SUM(c.credits), 0) AS "Total GPA of all students"
FROM course as c, takes as t
LEFT OUTER JOIN grade_points AS g ON t.grade = g.grade
GROUP BY t.ID;

/* [10] Create a view v_student_gpa */
CREATE OR REPLACE VIEW v_student_gpa AS
SELECT COALESCE(SUM(c.credits * g.points) / SUM(c.credits), 0) AS "Total GPA of all students", t.ID AS ID
FROM course as c, takes as t
LEFT OUTER JOIN grade_points AS g ON t.grade = g.grade
GROUP BY t.ID;

/* [10] Retrieve view v_student_gpa that gives a dynamic version of the information in previous question */
SELECT *
FROM v_student_gpa;
