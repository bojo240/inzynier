from flask import Flask, render_template, request, url_for, Response, Blueprint, redirect, session, make_response, \
    jsonify
from flask_restplus import Api, Resource, fields
import pyodbc
import os
import simplejson as json
import pandas as pd

# set FLASK_APP=flask_sql.py
# flask run

app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'
blueprint = Blueprint('api', __name__, url_prefix='/test')
api = Api(blueprint)
app.register_blueprint(blueprint)

a_language = api.model('Language', {'language': fields.String('The language.')})
languages = []
python = {'language': 'Python', 'id': 1}
languages.append(python)


#API

@app.context_processor
def override_url_for():
    return dict(url_for=dated_url_for)


def dated_url_for(endpoint, **values):
    if endpoint == 'static':
        filename = values.get('filename', None)
        if filename:
            file_path = os.path.join(app.root_path, endpoint, filename)
            values['q'] = int(os.stat(file_path).st_mtime)
    return url_for(endpoint, **values)


@api.route('/swagger/language')
class Language(Resource):
    @api.marshal_with(a_language, envelope='the_data')
    def get(self):
        return languages

    @api.expect(a_language)
    def post(self):
        new_language = api.payload
        new_language['id'] = len(languages) + 1
        languages.append(new_language)
        return {'result': 'Language added'}, 201


@app.route('/api/<table_name>', methods=['GET'])
def json_table(table_name):
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM " + table_name)
        rows = cursor.fetchall()
        items = [dict(zip([key[0] for key in cursor.description], row)) for row in rows]
        resp_body = json.dumps(items, ensure_ascii=False)
        resp_head = dict()
        resp_head['Record count'] = len(items)
        connection.close()
        response = make_response(resp_body, 200, resp_head)
        return response
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


@app.route('/api/<table_name>/<id>/<start_date>', methods=['GET'])
def json_main_table(table_name, id, start_date):
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM " + table_name + " where ID = " + id + " and Start_Date = '" + start_date + "'")
        rows = cursor.fetchall()
        items = [dict(zip([key[0] for key in cursor.description], row)) for row in rows]
        resp_body = json.dumps(items, ensure_ascii=False)
        resp_head = dict()
        resp_head['Record count'] = len(items)
        connection.close()
        response = make_response(resp_body, 200, resp_head)
        return response
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


@app.route('/api/<table_name>/<id>/<start_date>/<id1>/<start_date1>/<start_date2>', methods=['GET'])
def json_relational_table(table_name, id, start_date, id1, start_date1, start_date2):
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM " + table_name)
        cursor.execute("SELECT * FROM " + table_name + " where " + cursor.description[0][0] + " = " + id + " and " +
                       cursor.description[1][0] + " = '" + start_date + "'" + " and " +
                       cursor.description[2][0] + " = " + id1 + " and " + cursor.description[3][0] + " = '" +
                       start_date1 + "'" + " and " + cursor.description[4][0] + " = '" + start_date2 + "'")
        rows = cursor.fetchall()
        items = [dict(zip([key[0] for key in cursor.description], row)) for row in rows]
        resp_body = json.dumps(items, ensure_ascii=False)
        resp_head = dict()
        resp_head['Record count'] = len(items)
        connection.close()
        response = make_response(resp_body, 200, resp_head)
        return response
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


@app.route('/api/<table_name>', methods=['POST'])
def json_insert_table(table_name):
    data = request.get_json()
    col_names = list(data.keys())
    col_vals = list(data.values())
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        cursor.execute("SELECT column_name, data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                       + table_name + "') order by ordinal_position asc")
    except:
        return Response(status = 401)
    for row in cursor:
        for x in range(len(col_names)):
            if col_names[x] == row[0]:
                if col_vals[x] == '':
                    col_vals[x] = "null"
                elif row[1] in ("date", "nvarchar"):
                    col_vals[x] = "'" + col_vals[x] + "'"
                break
    try:
        count = insert_all(table_name, col_names, col_vals, connection)
        resp = Response(status=201)
        resp.headers['Record count'] = count
        return resp
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


@app.route('/api/<table_name>/<id>/<start_date>', methods=['PUT'])
def json_udate_main_table(table_name, id, start_date):
    data = request.get_json()
    col_names = list(data.keys())
    col_vals = list(data.values())
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        for x in range(len(col_names)):
            cursor.execute("SELECT data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                           + table_name + "') and upper(column_name) = upper('" + col_vals[x] + "')")
            if col_vals[x] == '' or col_vals[x].lower == 'null':
                col_vals[x] = "null"
            elif cursor[0][0] in ("date", "nvarchar"):
                col_vals[x] = "'" + col_vals[x] + "'"
        s = "update " + table_name + " set " + col_names[0] + " = " + col_vals[0]
        for x in range(len(col_names) - 1):
            s = s + ", " + col_names[x + 1] + " = " + col_vals[x + 1]
        where = " where id = " + str(id) + " and StartDate = '" + str(start_date) + "'"
        s = s + where
        cursor.execute("select count(*) from " + table_name + " " + where)
        count = cursor[0][0]
        cursor.execute(s)
        connection.commit()
        resp = Response(status=201)
        resp.headers['Record count'] = count
        return resp
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


@app.route('/api/<table_name>/<id>/<start_date>/<id1>/<start_date1>/<start_date2>', methods=['PUT'])
def json_update_relational_table(table_name, id, start_date, id1, start_date1, start_date2):
    data = request.get_json()
    col_names = list(data.keys())
    col_vals = list(data.values())
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        for x in range(len(col_names)):
            cursor.execute("SELECT data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                           + table_name + "') and upper(column_name) = upper('" + col_vals[x] + "')")
            if col_vals[x] == '' or col_vals[x].lower == 'null':
                col_vals[x] = "null"
            elif cursor[0][0] in ("date", "nvarchar"):
                col_vals[x] = "'" + col_vals[x] + "'"
        s = "update " + table_name + " set " + col_names[0] + " = " + col_vals[0]
        for x in range(len(col_names) - 1):
            s = s + ", " + col_names[x + 1] + " = " + col_vals[x + 1]
        s = s + " where " + col_names[0] + " = " + str(id) + " and " + col_names[1] + " = '" + str(start_date) + "'" + \
            " and " + col_names[2] + " = " + str(id1) + " and " + col_names[3] + " = '" + str(start_date1) + "'" \
            + " and " + col_names[4] + " = '" + str(start_date2) + "'"
        try:
            cursor.execute(s)
            connection.commit()
            return Response(status=200)
        except:
            return Response(status=400)
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


@app.route('/api/<table_name>/<id>/<start_date>', methods=['DELETE'])
def json_delete_main_table(table_name, id, start_date):
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        s = "delete from " + table_name + " where ID = " + str(id) + " and StartDate = '" + str(start_date) + "'"
        cursor.execute(s)
        connection.commit()
        return Response(status=200)
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


@app.route('/api/<table_name>/<id>/<start_date>/<id1>/<start_date1>/<start_date2>', methods=['DELETE'])
def json_delete_relational_table(table_name, id, start_date, id1, start_date1, start_date2):
    col_names = list()
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        cursor.execute("SELECT column_name, data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                       + table_name + "') order by ordinal_position asc")
        for row in cursor:
            col_names.append(row[0])
        s = "delete from " + table_name + " where " + col_names[0] + " = " + str(id) + " and " + col_names[1] + " = '" \
            + str(start_date) + "'" + " and " + col_names[2] + " = " + str(id1) + " and " + col_names[3] + " = '" + \
            str(start_date1) + "'" + " and " + col_names[4] + " = '" + str(start_date2) + "'"
        cursor.execute(s)
        connection.commit()
        return Response(status=200)
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


# GUI


@app.route('/diconnect', methods=['GET'])
def disconnect():
    session.pop('asd', None)
    session.pop('login', None)
    session.pop('password', None)
    return redirect(url_for('index'))


@app.route('/', methods=['GET', 'POST'])
def index():
    global GUIconnection
    if session.get("asd") is not None:
        return redirect(url_for('index'))
    if request.method == "POST":
        if 'mslogin' in request.form:
            GUIconnection = pyodbc.connect("Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;"
                                           "Trusted_GUIconnection=yes")
            session['asd'] = 'asd'
            return redirect(url_for('app'))
        details = request.form
        login = details['login']
        password = details['haslo']

        if not login:  # if login is None or "" or everything that means null ([], (), {}, ...)
            return render_template('index.html')

        try:
            GUIconnection = pyodbc.connect("Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID="
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
        "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
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
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
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
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
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


@app.errorhandler(404)  # Page not found
def not_found():
    return render_template('404.html')


@app.errorhandler(500)  # Internal server error
def internal_error():
    return render_template('500.html')


if __name__ == '__main__':
    app.run(debug=True, threaded=True)
