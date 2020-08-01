from flask import Flask, jsonify, render_template, request, send_from_directory, url_for
import pyodbc
import os

from werkzeug.utils import cached_property
#set FLASK_APP=flask_sql.py
#flask run

from html_codes import *
import pandas as pd
app = Flask(__name__)

connection = None  # global variable


@app.context_processor
def override_url_for():
    return dict(url_for=dated_url_for)


def dated_url_for(endpoint, **values):
    if endpoint == 'static':
        filename = values.get('filename', None)
        if filename:
            file_path = os.path.join(app.root_path,
                                 endpoint, filename)
            values['q'] = int(os.stat(file_path).st_mtime)
    return url_for(endpoint, **values)


@app.route('/diconnect', methods=['GET', 'POST'])
def disconnect():
    global connection
    connection.close()
    connection = None
    return generateToIndexHTML()


@app.route('/', methods=['GET', 'POST'])
def index():
    global connection
    if connection:
        return generateRedirectHTML()
    login = ""
    haslo = ""
    if request.method == "POST":
        if 'mslogin' in request.form:
            connection = pyodbc.connect('Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;'
                                        'Trusted_Connection=yes')
            return generateRedirectHTML()
        details = request.form
        login = details['login']
        haslo = details['haslo']

        if not login:  # if login is None or "" or everything that means null ([], (), {}, ...)
            return render_template('index.html')

        try:
            connection = pyodbc.connect("Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID="
                                        + login + ";PWD=" + haslo)

            return generateRedirectHTML()
        except:
            return render_template('index.html')
    return render_template('index.html')


@app.route('/app')
def appl():
    return render_template('app.html', context='hello')


@app.route('/list<table_name>')
def listTable(table_name):
    s = generateTable(table_name)
    return render_template('list.html', table=s)


def generateTable(table_name):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM " + table_name)
    column_names = [d[0] for d in cursor.description]
    lista =[]
    for row in cursor:
        tmp=[]
        for x in row:
            tmp.append(str(x))
        lista.append(tmp)

    df = pd.DataFrame(data=lista, columns=column_names)
    df_html = df.to_html(index=False)  # use pandas method to auto generate html
    return df_html


@app.route('/insert<table_name>', methods=['GET', 'POST'])
def insertTable(table_name):
    cursor = connection.cursor()  
    cursor.execute("SELECT column_name, data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                   + table_name + "') order by ordinal_position asc")
    col_names = list()
    col_types = list()
    for row in cursor:  
        col_names.append(row[0])
        col_types.append(row[1])
    col_vals = list()
    if request.method == 'POST':	
        for x in range(len(col_names)):
            value = request.form[str(x+1)]
            if value == '':
                value = "null"
            elif col_types[x].lower() in ("date", "nvarchar"):
                value = "'" + value + "'"
            col_vals.append(value)
        insertALL(table_name, col_names, col_vals)
    return render_template("insert.html", table_name=table_name,
                           navigation=[str(x+1) for x in range(len(col_names))],
                           col_names=col_names,
                           table=generateTable(table_name))


def insertALL(table_name, col_names, col_vals):
    cursor = connection.cursor()  
    s = "insert into " + table_name + "(" + col_names[0]
    for x in range(len(col_names)-1):
        s = s + ", " + col_names[x+1]
    s = s +  ") values (" + col_vals[0]
    for x in range(len(col_vals)-1):
        s = s + ", " + col_vals[x+1]
    s = s + ")"
    print(s)
    cursor.execute(s)
    connection.commit()	
    return


@app.route('/update<table_name>', methods=['GET', 'POST'])
def updateTable(table_name):
    cursor = connection.cursor()
    cursor.execute("SELECT column_name, data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                   + table_name + "') order by ordinal_position asc")
    col_names = list()
    col_types = list()
    for row in cursor:
        col_names.append(row[0])
        col_types.append(row[1])
    if request.method == 'POST':
        print('asd')
        set_vals = dict()
        where_vals = dict()
        for x in range (len(col_names)):
            print('asd'+str(x+1))
            setvalue = request.form['set'+str(x+1)]
            print('asd' + str(x))
            if col_types[x].lower() in ("date", "nvarchar") and setvalue.lower() != "null":
                setvalue = "'" + setvalue + "'"
            if setvalue != '' and setvalue != "''":
                set_vals[col_names[x]] = setvalue
            wherevalue = request.form["where"+str(x+1)]
            if col_types[x].lower() in ("date", "nvarchar") and wherevalue.lower() != "null":
                wherevalue = "'" + wherevalue + "'"
            if wherevalue != '' and wherevalue != "''":
                where_vals[col_names[x]] = wherevalue
        updateALL(table_name, set_vals, where_vals)
    return render_template("update.html", table_name=table_name,
                           navigation=[str(x + 1) for x in range(len(col_names))],
                           col_names=col_names,
                           table=generateTable(table_name))


def updateALL(table_name, set_vals, where_vals):
    cursor = connection.cursor()  
    s = "update " + table_name + " set " + list(set_vals.keys())[0] + " = " + set_vals[list(set_vals.keys())[0]]
    for x in range(len(set_vals)-1):
        s = s + ", " + list(set_vals.keys())[x+1] + " = " + set_vals[list(set_vals.keys())[x+1]]
    
    s = s + " where " + list(where_vals.keys())[0]
    if where_vals[list(where_vals.keys())[0]].lower() == "null":
        s = s + " is "
    else :
        s = s + " = " 
    s = s + where_vals[list(where_vals.keys())[0]]
    for x in range(len(where_vals)-1):
        s = s + " and " + list(where_vals.keys())[x+1] 
        if where_vals[list(where_vals.keys())[x+1]].lower() == "null":
            s = s + " is "
        else:
            s = s + " = " 
        s = s + where_vals[list(where_vals.keys())[x+1]]

    cursor.execute(s)
    connection.commit()	
    return


@app.route('/delete<table_name>', methods=['GET', 'POST'])
def deleteTable(table_name):
    cursor = connection.cursor()  
    cursor.execute("SELECT column_name, data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                   + table_name + "') order by ordinal_position asc")
    col_names = list()
    col_types = list()
    for row in cursor:  
        col_names.append(row[0])
        col_types.append(row[1])
    if request.method == 'POST':	
        where_vals = dict()
        for x in range(len(col_names)):
            wherevalue = request.form["where"+str(x+1)]
            if col_types[x].lower() in ("date", "nvarchar") and wherevalue.lower() != "null":
                wherevalue = "'" + wherevalue + "'"   
            if wherevalue != '' and wherevalue != "''":
                where_vals[col_names[x]] = wherevalue
        deleteALL(table_name, where_vals)
    return render_template("delete.html", table_name=table_name,
                           navigation=[str(x + 1) for x in range(len(col_names))],
                           col_names=col_names,
                           table=generateTable(table_name))


def deleteALL(table_name, where_vals):
    cursor = connection.cursor()  
    s = "delete from " + table_name + " where " + list(where_vals.keys())[0]
    if where_vals[list(where_vals.keys())[0]].lower() == "null":
        s = s + " is "
    else:
        s = s + " = " 
    s = s + where_vals[list(where_vals.keys())[0]]
    for x in range(len(where_vals)-1):
        s = s + " and " + list(where_vals.keys())[x+1] 
        if where_vals[list(where_vals.keys())[x+1]].lower() == "null":
            s = s + " is "
        else:
            s = s + " = " 
        s = s + where_vals[list(where_vals.keys())[x+1]]

    cursor.execute(s)
    connection.commit()	
    return


@app.errorhandler(404)  # Page not found
def not_found(error):
    return render_template('404.html')


@app.errorhandler(500)  # Internal server error
def internal_error(error):
    return render_template('500.html')


if __name__ == '__main__':
    app.run()
