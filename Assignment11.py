#Queens College
#Database Systems(CSCI 331)
#Winter 2024
#Assignment 11 - Database Record Storage
#Derek Yee
#Collaborated with class

import Assignment5 as as5

assn = "Assignment11"
db = "udb"


def main():
    comments, queries = as5.readQueries(f"{assn}.sql")
    as5.process_queries(comments, queries, db, assn + "F", "F")
    as5.process_queries(comments, queries, db, assn + "V", "V")

    comments, queries = as5.readQueries("Analytics.sql")
    as5.process_queries(comments, queries, db, f"{assn}a")


if __name__ == "__main__":
    main()