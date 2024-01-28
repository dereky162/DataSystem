#Queens College
#Database Systems(CSCI 331)
#Winter 2024
#Assignment 10 - Database Design and Normalization
#Derek Yee
#Collaborated with class

import Assignment5 as as5


def main():
    assn = "Assignment10"
    db = "udb"
    comments, queries = as5.readQueries(f"{assn}.sql")
    as5.process_queries(comments, queries, db, assn)

    comments, queries = as5.readQueries("Analytics.sql")
    as5.process_queries(comments, queries, db, f"{assn}a")


if __name__ == "__main__":
    main()