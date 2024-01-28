#Queens College
#Database Systems(CSCI 331)
#Winter 2024
#Assignment #12 - Indexing and Query Optimization
#Derek Yee
#Collaborated with class

import  OutputUtil as ou
import DBUtil
import Assignment5 as as5

DBUtil.assn = "Assignment12"
DBUtil.db = "udb"

def main():

    comments, queries = DBUtil.readQueries("Assignment12.sql")
    DBUtil.process_queries(comments, queries, DBUtil.db, DBUtil.assn)

    comments, queries = DBUtil.readQueries("Analytics.sql")
    DBUtil.process_queries(comments, queries, DBUtil.db, DBUtil.assn + "a")

if __name__ == '__main__':
    main()