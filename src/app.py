from re import S
from flask import Flask, render_template, request, flash, redirect, url_for, session
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'bkstiyllpyyyrxlek7bt-mysql.services.clever-cloud.com'
app.config['MYSQL_USER'] = 'utdk0pjqeflx9aib'
app.config['MYSQL_PASSWORD'] = 'W3W4O1uOe9gGRFHBJINn'
app.config['MYSQL_DB'] = 'bkstiyllpyyyrxlek7bt'
mysql = MySQL(app)
# Jesus


@app.route('/iniciosesion')
def InicioSesion():
    return render_template('InicioSesion.html')



# Jhonatan
@app.route('/Crear_Pedido')
def Crear_Pedido():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM Producto')
    data = cur.fetchall()
    print(data)

    return render_template('Crear_Pedido.html', Productos = data)









#Iosif







if __name__ == '__main__':
    app.run(port=3000, debug=True)