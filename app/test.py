@app.route('/list<table_name>')
def listTable(table_name):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM " + table_name)

    column_names = [d[0] for d in cursor.description]
    s = "<table id='tab01'><tr>"
    for col in column_names:
        s = s + "<th>" + col + "</th>"
    s = s + "</tr>"
    for row in cursor:
        s = s + "<tr>"
        for x in row:
            s = s + "<td>" + str(x) + "</td>"
    s = s + "</tr>"
    return str("<html><head>\n"
               "<meta charset=\"utf-8\">\n"
               "<link rel=\"stylesheet\" href=\"static/stylesheets/styl.css\">\n"
               "<title> Lista Gmin </title>"
               "</head>\n"
               "<body>" + header_html() + "<main>" + s + "</main></body></html>")


def generateInsertHTML(tableName, col_names):
    htmlcode = """<html><body><div id = 'insertform'>
    <form action="/insert""" + tableName + """" method=post>
        <table><br>
         <b>Insert """ + tableName + """</b>
            <tr>"""
    for col in col_names:
        htmlcode = htmlcode + "<th>" + col + ": </th>"
    htmlcode = htmlcode + "</tr><tr>"
    for x in range(len(col_names)):
        htmlcode = htmlcode + "<td><input type=text name=\"" + str(x + 1) + "\" required/></td>"
    htmlcode = htmlcode + """</tr>
            <tr>
            <td><input type=submit value=Insert></td>
            </tr>
        </table>
        <br>
     </form>
   </div>
   <br></body></html>"""
    return htmlcode


    return render_template("update.html", table_name=table_name,
                           navigation_set=["set"+str(x+1) for x in range(len(col_names))],
                           navigation_where=["where"+str(x + 1) for x in range(len(col_names))],
                           col_names=col_names,
                           table=generateTable(table_name))