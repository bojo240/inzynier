from flask import Flask, render_template, request, url_for, Response, Blueprint, redirect, session, make_response
from flask_restplus import Api, Resource, fields
import pyodbc
import os
import simplejson as json
import pandas as pd


# GUI


@app.route('/diconnect', methods=['GET'])
def disconnect():
    session.pop('asd', None)
    session.pop('login', None)
    session.pop('password', None)
    return redirect(url_for('index'))


@app.route('/', methods=['GET', 'POST'])
def index():
    if session.get("asd") is not None:
        return redirect(url_for('appl'))
    if request.method == "POST":
        if 'mslogin' in request.form:
            try:
                pyodbc.connect("Driver={SQL Server};Server=DESKTOP-HMMDTP9;PORT=1433;Database=Inzynier;"
                                               "Trusted_connection=yes")
                session['asd'] = 'asd'
                return redirect(url_for('appl')) # app -> appl
            except:
                return render_template('index.html')
        details = request.form
        login = details['login']
        password = details['haslo']

        if not login:  # if login is None or "" or everything that means null ([], (), {}, ...)
            return render_template('index.html')

        try:
            pyodbc.connect("Driver={SQL Server};Server=DESKTOP-HMMDTP9;PORT=1433;Database=Inzynier;UID="
                                           + login + ";PWD=" + password)
            session['asd'] = 'asd'
            session['login'] = login
            session['password'] = password
            return redirect(url_for('app'))
        except:
            return render_template('index.html')
    return render_template('index.html')


@app.route('/app', methods=['GET'])
def appl():
    if session.get("asd") is not None:
        return render_template('app.html', context='hello')
    return redirect(url_for('index'))


@app.route('/list<table_name>', methods=['GET'])
def list_table(table_name):
    if session.get("asd") is not None:
        s = generate_table(table_name)
        return render_template('list.html', table=s)
    return redirect(url_for('index'))


def generate_table(table_name):
    login = session.get("login")
    password = session.get("password")
    connection = pyodbc.connect(
        "Driver={SQL Server};Server=DESKTOP-HMMDTP9;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM " + table_name)
    column_names = [d[0] for d in cursor.description]
    lista = []
    for row in cursor:
        tmp = []
        for x in row:
            tmp.append(str(x))
        lista.append(tmp)

    df = pd.DataFrame(data=lista, columns=column_names)
    df_html = df.to_html(index=False)  # use pandas method to auto generate html
    return df_html


@app.route('/insert<table_name>', methods=['GET', 'POST'])
def insert_table(table_name):
    if session.get("asd") is not None:
        login = session.get("login")
        password = session.get("password")
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-HMMDTP9;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
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
                value = request.form[str(x + 1)]
                if value == '':
                    value = "null"
                elif col_types[x].lower() in ("date", "nvarchar"):
                    value = "'" + value + "'"
                col_vals.append(value)
            insert_all(table_name, col_names, col_vals, GUIconnection)
        return render_template("insert.html", table_name=table_name,
                               navigation=[str(x + 1) for x in range(len(col_names))],
                               col_names=col_names,
                               table=generate_table(table_name))
    return redirect(url_for('index'))


def insert_all(table_name, col_names, col_vals, connection):
    cursor = connection.cursor()
    s = "insert into " + table_name + "(" + col_names[0]
    for x in range(len(col_names) - 1):
        s = s + ", " + col_names[x + 1]
    s = s + ") values (" + col_vals[0]
    for x in range(len(col_vals) - 1):
        s = s + ", " + col_vals[x + 1]
    s = s + ")"
    cursor.execute(s)
    connection.commit()
    cnt = cursor.rowcount
    connection.close()
    return cnt


@app.route('/update<table_name>', methods=['GET', 'PUT'])
def update_table(table_name):
    if session.get("asd") is not None:
        global GUIconnection
        cursor = GUIconnection.cursor()
        cursor.execute("SELECT column_name, data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                       + table_name + "') order by ordinal_position asc")
        col_names = list()
        col_types = list()
        for row in cursor:
            col_names.append(row[0])
            col_types.append(row[1])
        if request.method == 'PUT':
            set_vals = dict()
            where_vals = dict()
            for x in range(len(col_names)):
                setvalue = request.form['set' + str(x + 1)]
                if col_types[x].lower() in ("date", "nvarchar") and setvalue.lower() != "null":
                    setvalue = "'" + setvalue + "'"
                if setvalue != '' and setvalue != "''":
                    set_vals[col_names[x]] = setvalue
                wherevalue = request.form["where" + str(x + 1)]
                if col_types[x].lower() in ("date", "nvarchar") and wherevalue.lower() != "null":
                    wherevalue = "'" + wherevalue + "'"
                if wherevalue != '' and wherevalue != "''":
                    where_vals[col_names[x]] = wherevalue
            update_all(table_name, set_vals, where_vals, GUIconnection)
        return render_template("update.html", table_name=table_name,
                               navigation=[str(x + 1) for x in range(len(col_names))],
                               col_names=col_names,
                               table=generate_table(table_name))
    return redirect(url_for('index'))


def update_all(table_name, set_vals, where_vals, connection):
    cursor = connection.cursor()
    s = "update " + table_name + " set " + list(set_vals.keys())[0] + " = " + set_vals[list(set_vals.keys())[0]]
    for x in range(len(set_vals) - 1):
        s = s + ", " + list(set_vals.keys())[x + 1] + " = " + set_vals[list(set_vals.keys())[x + 1]]

    s = s + " where " + list(where_vals.keys())[0]
    if where_vals[list(where_vals.keys())[0]].lower() == "null":
        s = s + " is "
    else:
        s = s + " = "
    s = s + where_vals[list(where_vals.keys())[0]]
    for x in range(len(where_vals) - 1):
        s = s + " and " + list(where_vals.keys())[x + 1]
        if where_vals[list(where_vals.keys())[x + 1]].lower() == "null":
            s = s + " is "
        else:
            s = s + " = "
        s = s + where_vals[list(where_vals.keys())[x + 1]]

    cursor.execute(s)
    connection.commit()
    return


@app.route('/delete<table_name>', methods=['GET', 'DELETE'])
def delete_table(table_name):
    if session.get("asd") is not None:
        login = session.get("login")
        password = session.get("password")
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-HMMDTP9;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        cursor.execute("SELECT column_name, data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                       + table_name + "') order by ordinal_position asc")
        col_names = list()
        col_types = list()
        for row in cursor:
            col_names.append(row[0])
            col_types.append(row[1])
        if request.method == 'DELETE':
            where_vals = dict()
            for x in range(len(col_names)):
                wherevalue = request.form["where" + str(x + 1)]
                if col_types[x].lower() in ("date", "nvarchar") and wherevalue.lower() != "null":
                    wherevalue = "'" + wherevalue + "'"
                if wherevalue != '' and wherevalue != "''":
                    where_vals[col_names[x]] = wherevalue
            delete_all(table_name, where_vals, GUIconnection)
        return render_template("delete.html", table_name=table_name,
                               navigation=[str(x + 1) for x in range(len(col_names))],
                               col_names=col_names,
                               table=generate_table(table_name))
    return redirect(url_for('index'))


def delete_all(table_name, where_vals, connection):
    cursor = connection.cursor()
    s = "delete from " + table_name + " where " + list(where_vals.keys())[0]
    if where_vals[list(where_vals.keys())[0]].lower() == "null":
        s = s + " is "
    else:
        s = s + " = "
    s = s + where_vals[list(where_vals.keys())[0]]
    for x in range(len(where_vals) - 1):
        s = s + " and " + list(where_vals.keys())[x + 1]
        if where_vals[list(where_vals.keys())[x + 1]].lower() == "null":
            s = s + " is "
        else:
            s = s + " = "
        s = s + where_vals[list(where_vals.keys())[x + 1]]

    cursor.execute(s)
    connection.commit()
    return
