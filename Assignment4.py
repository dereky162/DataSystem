#Queens College
#Database Systems(CSCI 331)
#Winter 2024
#Assignment #4 - Query Runner Tracker Visualizer
#Derek Yee
#Partially collaborated with class

import Assignment3 as as3
import OutputUtil as ou

#[6] Define a function that

#Reads the SQL file
#Parses into a list of queries separated by semicolons (the SQL convention)
#Separates the comment part from the query part
#Executes each query using run_query
#Logs each query along with its comment (you get this automatically when executing vis run_query)
#Collects the headers and data that are returned and uses that to build an HTML table
#Gathers all the tables into a single HTML file, with the "Table of Contents" at the top

def ProcessQueries(filename, db, assignment):
    with open(filename, 'r') as file:
        text = file.read()
        queries = text.strip().split(';')   #separating via semicolons
        tables = []
        for query in queries:
            if(len(query.strip()) == 0):
                continue
            comment, sql = query.split("*/")
            comment = comment.replace("/*", "").strip()
            sql = sql.strip()
            headers,data = as3.run_query(sql, comment, db, assignment)
            alignments = ['l'] * len(headers)
            types = ["S"] * len(headers)
            table = [comment, headers, types, alignments, data]
            tables.append(table)
        output_file = assignment.replace(" ", "") +  ".html"
        title = "All queries in " + assignment + " in " + filename
        ou.write_html_file_new(output_file, title, tables, True, None, True)

#[7] Define a function that

#Collects the queries recorded for each assignment separately
#Makes a table of queries for each assignment to date
#Gathers all the tables into a single HTML file, with the "Table of Contents" at the top

def retrieve_query_log(assignments, db):
    tables = []
    for assignment in assignments:
        sql = f"SELECT * FROM query WHERE query_assn = '{assignment}'"
        desc = f"Retrieve all queries executed for {assignment}"
        headers,data = as3.run_query(sql, desc, db, assignments[-1]) #-1 = last assignment in list
        alignments = ['l'] * len(headers)
        types = ["S"] * len(headers)
        table = [desc, headers, types, alignments, data]
        tables.append(table)
    output_file = assignment.replace(" ", "") + "-query-history.html"
    title = "All queries for assignments to date:"
    ou.write_html_file_new(output_file, title, tables, True, None, True)


def main():
    ProcessQueries("Assignment4.sql", "udb", "Assignment 4")
    assignments = [f"Assignment {i}" for i in range(3,5)]
    retrieve_query_log(assignments, "udb")

if __name__ == '__main__':
    main()


