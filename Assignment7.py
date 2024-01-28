#Queens College
#Database Systems(CSCI 331)
#Winter 2024
#Assignment #7 - Stored Procedures and Functions
#Derek Yee
#Collaborated with class

import Assignment3 as as3
import Assignment5 as as5
import OutputUtil as ou


def main():
    comments, queries = as5.readQueries("Assignment7.sql")
    as5.process_queries(comments, queries, "udb", "Assignment 7")

    comments, queries = as5.readQueries("Analytics.sql")
    as5.process_queries(comments, queries, "udb", "Assignment 7a")



if __name__ == '__main__':
    main()


