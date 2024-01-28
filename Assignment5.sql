/* Assignment 5: In-class view of all tables and columns in udb */

CREATE OR REPLACE VIEW v_udb_table_columns as
SELECT TABLE_NAME, ORDINAL_POSITION as COLUMN_NUM, COLUMN_NAME, DATA_TYPE, COALESCE(CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION) as LENGTH, is_nullable as nullable
FROM information_schema.columns
WHERE table_schema = "udb"
ORDER BY table_name, ordinal_position;

/* Select everything from the new view v_udb_table_columns */
SELECT *
FROM v_udb_table_columns
ORDER BY TABLE_NAME, COLUMN_NUM;

/* Get the number of columns per table */
SELECT table_name, COUNT(column_name) as COLUMNS
FROM v_udb_table_columns
GROUP BY table_name;
