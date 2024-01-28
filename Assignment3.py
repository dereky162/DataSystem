#Queens College
#Database Systems(CSCI 331)
#Winter 2024
#Assignment #3 - SQL and Programming Languages
#Derek Yee
#Collaborated with class
import pymysql
import time
import texttable

assn = ""
db = ""


def getpass():
    with open('a3password.txt', 'r') as file:
        return file.read().strip()

password = getpass()
username = "yede7188"


def list_db_data(cursor, sql, desc):
    cursor.execute(sql)
    results = [row[0] for row in cursor]
    #print(desc + ":", results)
    return results

def preliminary(password):
    conn = pymysql.connect(host="localhost", user="yede7188", passwd=password)
    cursor = conn.cursor()
    databases = list_db_data(cursor, "SHOW DATABASES", "Databases")
    cursor.execute("USE udb")
    tables = list_db_data(cursor, "SHOW TABLES", "Tables in udb")
    for table in tables:
        columns = list_db_data(cursor, "DESC " + table, "Columns in table " + table)
    conn.close()
    return tables

#logging a query
def log_query(query_text, query_desc, query_db, query_rows, query_user, query_assn, query_dur, conn=None):
    query_text = query_text.replace("'", "\\'")
    query_desc = query_desc.replace("'", "\\'").replace("\\\\", "\\")
    query = f"INSERT into query (query_text, query_desc, query_db, query_rows, query_user, query_assn, query_dur) \nvalues ('{query_text}', '{query_desc}', '{query_db}', '{query_rows}', '{query_user}', '{query_assn}', '{query_dur}')"
    newConn = False
    #print(query_text)
    if conn is None:
        newConn = True
        conn = pymysql.connect(host="localhost", user=username, passwd=getpass(), db="udb")
        cursor = conn.cursor()
    cursor.execute(query)
    conn.commit()
    if newConn:
        conn.close()


def call_procedure(query_text, cursor):
    proc_query = query_text[4:].strip()
    idx1 = proc_query.index('(')
    idx2 = proc_query.index(')')
    arg = int(proc_query[idx1+1 : idx2])
    proc = proc_query[:idx1]
    cursor.callproc(proc, (arg, ))

#running a query
def run_query(query_text, query_desc, query_db, assignment, query_execute_values=None, get_cursor_desc=False):
    query_src = assignment
    conn = pymysql.connect(host="localhost", user=username, passwd=password, db="udb")
    start = time.time()
    cursor = conn.cursor()
    if query_text.upper().startswith("CALL"):
        call_procedure(query_text, cursor)
    else:
        if query_execute_values is None:
            cursor.execute(query_text)
        else:
            cursor.execute(query_text, query_execute_values)
    end = time.time()
    duration = end - start
    rows = cursor.fetchall()
    conn.commit()
    log_query(query_text, query_desc, query_db, len(rows), username, query_src, duration)
    conn.close()

    query_upper = query_text.upper()
    if query_upper.startswith("SELECT") or query_upper.startswith("SHOW") or query_upper.startswith("DESC"):
        headers = [desc[0] for desc in cursor.description]
        if len(rows) == 0:
            data = [[None for _ in headers]]
        else:
            data = [[col for col in row] for row in rows]
        if get_cursor_desc:
            return headers, data, cursor.description
        else:
            return headers, data
    else:
        return [], []



def print_table(title, headers, data, alignments = None):
    if alignments is None:
        alignments = ['l'] * len(headers)
    tt = texttable.Texttable(0)
    tt.set_cols_align(alignments)
    tt.add_rows([headers] + data, header=True)
    print(title)
    print(tt.draw())



def main():
    assignment = "Assignment 3"
    password = getpass()

    tables = preliminary(password)
    for table in tables:
        query = "SELECT * FROM " + table
        desc = "Retrieve all rows from Table " + table
        db = "udb"
        headers, data = run_query(query, desc, db, assignment)
        print_table("Table " + table, headers, data)






if __name__ == '__main__':
    main()

