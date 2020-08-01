

def generateToIndexHTML():
    return """<!DOCTYPE html>
    <html>
       <head>
          <title>LogOut</title>
          <meta http-equiv = "refresh" content = "0; url = http://127.0.0.1:5000" />
       </head>
       <body>
          <p>Redirecting to another URL</p>
       </body>
    </html>"""


def generateRedirectHTML():
    return """<!DOCTYPE html>
<html>
   <head>
      <title>HTML Meta Tag</title>
      <meta http-equiv = "refresh" content = "0; url = http://127.0.0.1:5000/app" />
   </head>
   <body>
      <p>Redirecting to another URL</p>
   </body>
</html>"""
