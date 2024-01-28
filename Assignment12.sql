ALTER TABLE query
DROP INDEX idx_query_assignment;

/* Select all queries using IN clause without index */
SELECT COUNT(*) as count
FROM query
WHERE query_assn IN
    ('Assignment3', 'Assignment4', 'Assignment5', 'Assignment6', 'Assignment7', 'Assignment8',
    'Assignment9', 'Assignment10');




/* Select all queries using OR clause without index */
SELECT COUNT(*) as count
FROM query
WHERE query_assn = 'Assignment3' OR
      query_assn = 'Assignment4' OR
      query_assn = 'Assignment5' OR
      query_assn = 'Assignment6' OR
      query_assn = 'Assignment7' OR
      query_assn = 'Assignment8' OR
      query_assn = 'Assignment9' OR
      query_assn = 'Assignment10';

/* Select all queries using LIKE clause without index */
SELECT COUNT(*) as count
FROM query
WHERE query_assn LIKE 'Assignment %';

/* Select all queries using UNION clause without index */
SELECT SUM(c) as count
FROM
(SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment3' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment4' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment5' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment6' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment7' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment8' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment9' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment 10')
    as counts;


/*Create index */
CREATE INDEX idx_query_assignment ON query (query_assn);


/* Select all queries using IN clause with index */
SELECT COUNT(*) as count
FROM query
WHERE query_assn IN
    ('Assignment3', 'Assignment4', 'Assignment5', 'Assignment6', 'Assignment7', 'Assignment8',
    'Assignment9', 'Assignment10');




/* Select all queries using OR clause with index */
SELECT COUNT(*) as count
FROM query
WHERE query_assn = 'Assignment3' OR
      query_assn = 'Assignment4' OR
      query_assn = 'Assignment5' OR
      query_assn = 'Assignment6' OR
      query_assn = 'Assignment7' OR
      query_assn = 'Assignment8' OR
      query_assn = 'Assignment9' OR
      query_assn = 'Assignment10';

/* Select all queries using LIKE clause with index */
SELECT COUNT(*) as count
FROM query
WHERE query_assn LIKE 'Assignment %';

/* Select all queries using UNION clause with index */
SELECT SUM(c) as count
FROM
(SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment3' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment4' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment5' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment6' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment7' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment8' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment9' UNION
SELECT COUNT(*) as c
FROM query
WHERE query_assn = 'Assignment 10')
    as counts;

/* Find queries associated with this assignment */
SELECT query_id, query_desc, query_dur
FROM query
WHERE query_assn = 'Assignment12'
ORDER BY query_ended desc limit 10;





