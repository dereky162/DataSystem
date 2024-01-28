/* Summary of tables and columns */
select table_name, count(column_name) as columns
from v_udb_table_columns
group by table_name;

/* Detail of tables and columns */
select *
from v_udb_table_columns
order by table_name, COLUMN_NUM;

/* Summary of queries */
SELECT query_assn, COUNT(*), MIN(query_dur) AS Min_Dur, AVG(query_dur) AS Avg_Dur, MAX(query_dur) AS Max_Dur, SUM(query_dur) AS Total_Dur
FROM query
GROUP BY query_assn
ORDER BY query_assn;

/* Retrieve queries for Assignment 3 */
SELECT * FROM query where query_assn in ('Assignment 3', 'Assignment3') ORDER BY query_ended LIMIT 200;

/* Retrieve queries for Assignment 4 */
SELECT * FROM query where query_assn in ('Assignment 4', 'Assignment4') ORDER BY query_ended LIMIT 200;

/* Retrieve queries for Assignment 5 */
SELECT * FROM query where query_assn in ('Assignment 5', 'Assignment5') ORDER BY query_ended LIMIT 200;

/* Retrieve queries for Assignment 6 */
SELECT * FROM query where query_assn in ('Assignment 6', 'Assignment6') ORDER BY query_ended LIMIT 200;

/* Retrieve queries for Assignment 7 */
SELECT * FROM query where query_assn in ('Assignment 7', 'Assignment7') ORDER BY query_ended LIMIT 200;

/* Retrieve queries for Assignment 8 */
SELECT * FROM query where query_assn in ('Assignment 8', 'Assignment8') ORDER BY query_ended LIMIT 200;
/* Retrieve from view v_table_backups that has a list of backups*/
SELECT * FROM v_table_backups;

/* Retrieve queries for Assignment 9 */
SELECT * FROM query where query_assn in ('Assignment 9', 'Assignment9') ORDER BY query_ended LIMIT 200;

/* Retrieve queries for Assignment 10 */
SELECT * FROM query where query_assn in ('Assignment 10', 'Assignment10') ORDER BY query_ended LIMIT 200;

/* Retrieve queries for Assignment 11 */
SELECT * FROM query where query_assn in ('Assignment 11', 'Assignment11') ORDER BY query_ended LIMIT 200;

/* Retrieve queries for Assignment 12 */
SELECT * FROM query where query_assn in ('Assignment 12', 'Assignment12') ORDER BY query_ended LIMIT 200;

/* Collect Statistics on tables */
SHOW TABLE STATUS LIKE '%';
