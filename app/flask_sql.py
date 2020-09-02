from flask import Flask, render_template, request, url_for, Response, redirect, session, make_response
import pyodbc
import os
import simplejson as json
import pandas as pd


#APP CONFIG
app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'


#APP CONFIG
#   ERROR HANDLING
@app.errorhandler(404)  # PAGE NOT FOUND
def not_found():
    return render_template('404.html')


@app.errorhandler(500)  # INTERNAL SERVER ERROR
def internal_error():
    return render_template('500.html')


#APP CONFIG
#   FUNCTIONS TO CLEAR CACHE FOR CSS RELOAD
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


#API
#   API HTTP GET FUNCTION RESPOND FUNCTION
def api_respond_handler(query):
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        cursor.execute(query)
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


#API
#   HTTP GET
#       TABLES
@app.route('/api/tabele/<table_name>', methods=['GET'])
def json_tabele_tablename(table_name):
    query = "SELECT * FROM " + table_name
    return api_respond_handler(query)


@app.route('/api/tabele/<table_name>/<arg>', methods=['GET'])
def json_tabele_tablename_arg(table_name, arg):
    if str(arg).isnumeric():
        query = "SELECT * \
                FROM " + table_name + \
                " where id = " + arg
    else:
        query = "SELECT * \
                FROM " + table_name + \
                " where '" + arg + "' between startdate and enddate"
    return api_respond_handler(query)


@app.route('/api/tabele/<table_name>/<id>/<arg_date>', methods=['GET'])
def json_tabele_tablename_id_date(table_name, id, arg_date):
    query = "SELECT * \
            FROM " + table_name + \
            " where ID = " + id + " \
            and '" + arg_date + "' between startdate and enddate"
    return api_respond_handler(query)


#API
#   HTTP GET
#       RELATIONAL_TABLES
@app.route('/api/relacje/GminaRelacja/<arg>', methods=['GET'])
def json_relacje_gminarelacja_arg(arg):
    if str(arg).isnumeric():
        query = "SELECT * \
                FROM gminaRelacja \
                where IDGmina_1 = " + arg + " or idGmina_2 = " + arg
    else:
        query = "SELECT * \
                FROM gminaRelacja\
                where '" + arg + "' between startdate and enddate"
    return api_respond_handler(query)


@app.route('/api/relacje/GminaRelacja/<id>/<arg_date>', methods=['GET'])
def json_relacje_gminarelacja_id_argdate(id, arg_date):
    query = "SELECT * \
            FROM gminaRelacja \
            where (IDGmina_1 = " + id + " or idGmina_2 = " + id + ") \
            and '" + arg_date + "' between startdate and enddate"
    return api_respond_handler(query)


@app.route('/api/relacje/<table_name>', methods=['GET'])
def json_relacje_tablename(table_name):
    query = "SELECT * \
            FROM " + table_name
    return api_respond_handler(query)


@app.route('/api/relacje/<table_name>/<arg_date>', methods=['GET'])
def json_relacje_table_name_arg_date(table_name, arg_date):
    query = "SELECT * \
            FROM " + table_name + "\
            where '" + arg_date + "' between startdate and enddate"
    return api_respond_handler(query)


@app.route('/api/relacje/<table_name>/<id_type>/<id>', methods=['GET'])
def json_relacje_table_name_idtype_id(table_name, id_type, id):
    query = "SELECT * \
            FROM " + table_name + "\
            where ID" + id_type + " = " + id
    return api_respond_handler(query)


@app.route('/api/relacje/<table_name>/<id_type>/<id>/<arg_date>', methods=['GET'])
def json_relacje_tablename_idtype_id_argdate(table_name, id_type, id, arg_date):
    query = "SELECT * \
            FROM " + table_name + "\
            where ID" + id_type + " = " + id + " \
            and '" + arg_date + "' between startdate and enddate"
    return api_respond_handler(query)


@app.route('/api/relacje/<table_name>/<id1>/<arg_date1>/<id2>/<arg_date2>/<arg_date3>', methods=['GET'])
def json_relacje_id_date_id1_date1_argdate(table_name, id1, arg_date1, id2, arg_date2, arg_date3):
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        cursor.execute("SELECT * \
                        FROM " + table_name)
        query = "SELECT * \
                FROM " + table_name + \
               " where " + cursor.description[0][0] + " = " + id1 +\
               " and " + cursor.description[1][0] + " = '" + arg_date1 + "'" + \
               " and " + cursor.description[2][0] + " = " + id2 + \
               " and " + cursor.description[3][0] + " = '" + arg_date2 + "'" + \
               " and '" + arg_date3 + "' between startdate and enddate"
        connection.close()
        return api_respond_handler(query)
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


#API
#   HTTP GET
#       VIEWS
@app.route('/api/widoki/GminaPowiatWojewodztwo', methods=['GET'])
def json_widoki_GminaPowiatWojewodztwoRelacje():
    query = "SELECT * \
            FROM GminaPowiatWojewodztwo \
            order by gmina_name"
    print(query)
    return api_respond_handler(query)


@app.route('/api/widoki/GminaPowiatWojewodztwo/<arg_date>', methods=['GET'])
def json_widoki_GminaPowiatWojewodztwo_argdate(arg_date):
    query = "SELECT * \
            FROM GminaPowiatWojewodztwo \
            where ('" + arg_date + "' between GminaPowiat_StartDate and gminapowiat_endDate \
            or '" + arg_date + "' between GminaWojewodztwo_StartDate and GminaWojewodztwo_EndDate) \
            and '" + arg_date + "' between PowiatWojewodztwo_StartDate and PowiatWojewodztwo_EndDate \
            order by gmina_name"
    return api_respond_handler(query)


@app.route('/api/widoki/GminaPowiatWojewodztwo/<table_name>/<arg>', methods=['GET'])
def json_widoki_GminaPowiatWojewodztwo_tablename_arg(table_name, arg):
    if str(arg).isnumeric():
        query = "SELECT * \
                FROM GminaPowiatWojewodztwo \
                where " + table_name + "_ID = " + arg + " \
                order by " + table_name + "_name"
    else:
        query = "SELECT * \
                FROM GminaPowiatWojewodztwoRelacje \
                where " + arg + " betweeen " + table_name + "_StartDate and " + table_name + "_EndDate  \
                order by " + table_name + "_name"
    return api_respond_handler(query)


@app.route('/api/widoki/GminaPowiatWojewodztwo/<table_name>/<id>/<arg_date>', methods=['GET'])
def json_widoki_GminaPowiatWojewodztwo_tablename_id_argdate(table_name, id, arg_date):
    query = "SELECT * \
            FROM GminaPowiatWojewodztwo \
            where " + table_name + "_ID = " + id + " \
            and '" + arg_date + "' between " + table_name + "_StartDate and " + table_name + "_EndDate"
    print(query)
    return api_respond_handler(query)


@app.route('/api/widoki/GminaGmina/<arg>', methods=['GET'])
def json_widoki_gminagmina_arg(arg):
    if str(arg).isnumeric():
        query = "SELECT * \
                FROM GminaGmina \
                where IDGmina1 = " + arg + " or idGmina2 = " + arg
    else:
        query = "SELECT * \
                FROM GminaGmina\
                where '" + arg + "' between startdate and enddate"
    return api_respond_handler(query)


@app.route('/api/widoki/GminaGmina/<id>/<arg_date>', methods=['GET'])
def json_widoki_gminagmina_id_argdate(id, arg_date):
    query = "SELECT * \
            FROM GminaGmina \
            where (IDGmina1 = " + id + " or IDGmina2 = " + id + ") \
            and '" + arg_date + "' between startdate and enddate"
    return api_respond_handler(query)


@app.route('/api/widoki/<view>', methods=['GET'])
def json_widoki_view(view):
    query = "SELECT * \
            FROM " + view
    return api_respond_handler(query)


@app.route('/api/widoki/<view>/<arg>', methods=['GET'])
def json_widoki_view_arg(view, arg):
    tab = ""
    if view[0].lower() == 'g':
        tab = "gmina"
    elif view[0].lower() == 'p':
        tab = "powiat"
    elif view[0].lower() == 'w':
        tab = "wojewodztwo"
    if str(arg).isnumeric():
        query = "SELECT * \
                FROM " + view + "\
                where " + tab + "_ID = " + arg + " \
                order by startDate"
    else:
        query = "SELECT * \
                FROM " + view + "\
                where '" + arg + "' between startdate and enddate\
                order by startDate"
    return api_respond_handler(query)


@app.route('/api/widoki/<view>/<id>/<arg_date>', methods=['GET'])
def json_widoki_view_id_argdate(view, id, arg_date):
    tab = ""
    if view[0].lower() == 'g':
        tab = "gmina"
    elif view[0].lower() == 'p':
        tab = "powiat"
    elif view[0].lower() == 'w':
        tab = "wojewodztwo"
    query = "SELECT * \
            FROM " + view + "\
            where " + tab + "_ID = " + str(id) + \
            " and '" + arg_date + "' between StartDate and EndDate \
            order by StartDate"
    return api_respond_handler(query)


#API
#   HTTP POST
@app.route('/api/<table_name>', methods=['POST'])
def json_insert_table(table_name):
    data = request.get_json(force=True)
    data = dict(data)
    col_names = list(data.keys())
    col_vals = list(data.values())
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        cursor.execute("SELECT column_name, data_type \
                        FROM INFORMATION_SCHEMA.COLUMNS \
                        where upper(table_name) = upper('" + table_name + "') \
                        order by ordinal_position asc")
    except:
        return Response(status=401)
    for row in cursor:
        for x in range(len(col_names)):
            if str(col_names[x]) == row[0]:
                if str(col_vals[x]) == '' or str(col_vals[x]) == "null":
                    col_vals[x] = "null"
                elif row[1] in ("date", "nvarchar"):
                    col_vals[x] = "'" + str(col_vals[x]) + "'"
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


#API
#   HTTP PUT
#       TABLES
@app.route('/api/<table_name>/<id>/<start_date>', methods=['PUT'])
def json_udate_main_table(table_name, id, start_date):
    data = request.get_json(force=True)
    data = dict(data)
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
                           + table_name + "') and upper(column_name) = upper('" + str(col_names[x]) + "')")
            if str(col_vals[x]) == '' or str(col_vals[x]).lower() == 'null':
                col_vals[x] = "null"
            elif cursor.fetchall()[0][0] in ("date", "nvarchar"):
                col_vals[x] = "'" + str(col_vals[x]) + "'"
        s = "update " + table_name + " set " + str(col_names[0]) + " = " + str(col_vals[0])
        for x in range(len(col_names) - 1):
            s = s + ", " + str(col_names[x + 1]) + " = " + str(col_vals[x + 1])
        where = " where id = " + str(id) + " and StartDate = '" + str(start_date) + "'"
        s = s + where
        print(s)
        cursor.execute("select count(*) from " + table_name + where)
        count = cursor.fetchall()[0][0]
        cursor.execute(s)
        connection.commit()
        resp = Response(status=200)
        resp.headers['Record count'] = count
        return resp
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


#API
#   HTTP PUT
#       RELATIONAL_TABLES
@app.route('/api/<table_name>/<id>/<start_date>/<id1>/<start_date1>/<start_date2>', methods=['PUT'])
def json_update_relational_table(table_name, id, start_date, id1, start_date1, start_date2):
    data = request.get_json(force=True)
    data = dict(data)
    col_names = list(data.keys())
    col_vals = list(data.values())
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        col_names2 = list()
        cursor.execute("SELECT column_name, data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                       + table_name + "') order by ordinal_position asc")
        for row in cursor:
            col_names2.append(row[0])
        for x in range(len(col_names)):
            cursor.execute("SELECT data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('"
                           + table_name + "') and upper(column_name) = upper('" + str(col_names[x]) + "')")
            if str(col_vals[x]) == '' or str(col_vals[x]).lower() == 'null':
                col_vals[x] = "null"
            elif cursor.fetchall()[0][0] in ("date", "nvarchar"):
                col_vals[x] = "'" + str(col_vals[x]) + "'"
        s = "update " + table_name + " set " + str(col_names[0]) + " = " + str(col_vals[0])
        for x in range(len(col_names) - 1):
            s = s + ", " + str(col_names[x + 1]) + " = " + str(col_vals[x + 1])
        where = " where " + str(col_names2[0]) + " = " + id + " and " + str(col_names2[1]) + " = '" + \
                start_date + "'" + " and " + str(col_names2[2]) + " = " + str(id1) + " and " + \
                str(col_names2[3]) + " = '" + start_date1 + "'" + " and " + str(col_names2[4]) + " = '" + \
                start_date2 + "'"
        s = s + where
        print(s)
        cursor.execute("select count(*) from " + table_name + where)
        count = cursor.fetchall()[0][0]
        cursor.execute(s)
        connection.commit()
        resp = Response(status=200)
        resp.headers['Record count'] = count
        return resp
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


#API
#   HTTP DELETE
#       TABLES
@app.route('/api/<table_name>/<id>/<start_date>', methods=['DELETE'])
def json_delete_main_table(table_name, id, start_date):
    login = request.headers.get('login')
    password = request.headers.get('password')
    try:
        connection = pyodbc.connect(
            "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
        cursor = connection.cursor()
        s = "delete from " + table_name
        where = " where ID = " + str(id) + " and StartDate = '" + str(start_date) + "'"
        s = s + where
        cursor.execute("select count(*) from " + table_name + where)
        count = cursor.fetchall()[0][0]
        cursor.execute(s)
        connection.commit()
        resp = Response(status=200)
        resp.headers['Record count'] = count
        return resp
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


#API
#   HTTP DELETE
#       RELATIONAL_TABLES
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
        s = "delete from " + table_name
        where = " where " + col_names[0] + " = " + str(id) + " and " + col_names[1] + " = '" \
            + str(start_date) + "'" + " and " + col_names[2] + " = " + str(id1) + " and " + col_names[3] + " = '" + \
            str(start_date1) + "'" + " and " + col_names[4] + " = '" + str(start_date2) + "'"
        s = s + where
        print(s)
        cursor.execute("select count(*) from " + table_name + where)
        count = cursor.fetchall()[0][0]
        cursor.execute(s)
        connection.commit()
        resp = Response(status=200)
        resp.headers['Record count'] = count
        return resp
    except:
        resp = Response(status=400)
        resp.headers['Record count'] = 0
        return resp


#GUI
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
                pyodbc.connect("Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;"
                               "Trusted_connection=yes")
                session['asd'] = 'asd'
                return redirect(url_for('appl'))  # app -> appl
            except:
                return render_template('index.html')
        details = request.form
        login = details['login']
        password = details['haslo']

        if not login:  # if login is None or "" or everything that means null ([], (), {}, ...)
            return render_template('index.html')

        try:
            pyodbc.connect("Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID="
                           + login + ";PWD=" + password)
            session['asd'] = 'asd'
            session['login'] = login
            session['password'] = password
            return redirect(url_for('appl'))
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
        s, col_names = generate_table(table_name)
        return render_template('list.html', table=s, navigation=[str(x + 1) for x in range(len(col_names))],
                               col_names=col_names)
    return redirect(url_for('index'))


@app.route('/zawartosc_wojewodztw', methods=['GET', 'POST'])
def zawartosc_wojewodztw():
    login = session.get("login")
    password = session.get("password")
    connection = pyodbc.connect(
        "Driver={SQL Server};Server=DESKTOP-BQPOPVS;PORT=1433;Database=Inzynier;UID=" + login + ";PWD=" + password)
    cursor = connection.cursor()
    cursor.execute("SELECT column_name, data_type FROM INFORMATION_SCHEMA.COLUMNS where upper(table_name) = upper('\
                   zawartosc_wojewodztw') order by ordinal_position asc")
    col_names = list()
    col_types = list()
    for row in cursor:
        col_names.append(row[0])
        col_types.append(row[1])
    col_vals = list()
    if request.method == "POST":
        for x in range(len(col_names)):
            value = request.form[str(x + 1)]
            if value == '':
                value = "null"
            elif col_types[x].lower() in ("date", "nvarchar"):
                value = "'" + value + "'"
            col_vals.append(value)

    s = "select * from zawartosc_wojewodztw"
    cursor.execute(s)
    column_names = [d[0] for d in cursor.description]
    lista = []
    for row in cursor:
        tmp = []
        for x in row:
            tmp.append(str(x))
        lista.append(tmp)

    df = pd.DataFrame(data=lista, columns=column_names)
    df_html = df.to_html(index=False)  # use pandas method to auto generate html
    return render_template("list.html", table_name="zawartosc_wojewodztw",
                           navigation=[str(x + 1) for x in range(len(column_names))],
                           col_names=column_names,
                           table=df_html)


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
    return df_html, column_names


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
        s, x = generate_table(table_name)
        return render_template("insert.html", table_name=table_name,
                               navigation=[str(x + 1) for x in range(len(col_names))],
                               col_names=col_names,
                               table=s)
    return redirect(url_for('index'))


def insert_all(table_name, col_names, col_vals, connection):
    cursor = connection.cursor()
    s = "insert into " + table_name + "(" + str(col_names[0])
    for x in range(len(col_names) - 1):
        s = s + ", " + str(col_names[x + 1])
    s = s + ") values (" + str(col_vals[0])
    for x in range(len(col_vals) - 1):
        s = s + ", " + str(col_vals[x + 1])
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
        s, x = generate_table(table_name)
        return render_template("update.html", table_name=table_name,
                               navigation=[str(x + 1) for x in range(len(col_names))],
                               col_names=col_names,
                               table=s)
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
    print(s)
    s = s + where_vals[list(where_vals.keys())[0]]
    for x in range(len(where_vals) - 1):
        s = s + " and " + list(where_vals.keys())[x + 1]
        if where_vals[list(where_vals.keys())[x + 1]].lower() == "null":
            s = s + " is "
        else:
            s = s + " = "
        s = s + where_vals[list(where_vals.keys())[x + 1]]
    print(s)
    cursor.execute(s)
    connection.commit()
    cnt = cursor.rowcount
    connection.close()
    return cnt


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
        s, x = generate_table(table_name)
        return render_template("delete.html", table_name=table_name,
                               navigation=[str(x + 1) for x in range(len(col_names))],
                               col_names=col_names,
                               table=s)
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
    cnt = cursor.rowcount
    connection.close()
    return cnt


#APP
if __name__ == '__main__':
    app.run(debug=True, threaded=True)