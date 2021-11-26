from re import S
from flask import Flask, render_template, request, flash, redirect, url_for, session
from flask_mysqldb import MySQL
from werkzeug import datastructures

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
    cur.execute('SELECT * FROM Cliente')
    data = cur.fetchall()
    print(data)
    return render_template('Crear_Pedido.html')



#Iosif
@app.route('/Agregarcliente')
def Agregarcliente():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM Cliente')
    data = cur.fetchall()
    cur.close()
    return render_template('Agregarcliente.html', Cliente = data)

@app.route('add_Cliente', methods = ['POST'])
def add_Cliente():
    Dni = request.form['Dni']
    Nombre = request.form['Nombre']
    ApellidoPat = request.form['ApellidoPat']
    ApellidoMat = request.form['ApellidoMat']
    FechaNacim = request.form['FechaNacim']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO contacts (Dni, Nombre, ApellidoPat, ApellidoMat, FechaNacim) VALUES (%s,%s,%s,%s,%s)",
                (Dni, Nombre, ApellidoPat, ApellidoMat, FechaNacim))
    mysql.connection.commit()
    return redirect(url_for('Agregarcliente'))



if __name__ == '__main__':
    app.run(port=3000, debug=True)