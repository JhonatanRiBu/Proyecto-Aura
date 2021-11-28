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
    return render_template('Agregarcliente.html')


@app.route('/add_Cliente', methods=['POST'])
def add_Cliente():
    
    if request.method == 'POST':
        Dni = request.form['Dni']
        Nombre = request.form['Nombre']
        ApellidoPat = request.form['ApellidoPat']
        ApellidoMat = request.form['ApellidoMat']
        FechaNacim = request.form['FechaNacim']
        cur = mysql.connection.cursor()
        cur.execute("CALL add_cliente(%s,%s,%s,%s,%s,@v_CodParty)",(Dni,Nombre,ApellidoPat,ApellidoMat,FechaNacim))
        mysql.connection.commit()
        return 'recibido'


@app.route('/Consultarcliente')
def Consultarcliente():
    cur = mysql.connection.cursor()
    cur.execute('CALL tabla_cliente(@v_maxParty)')
    data = cur.fetchall()
    return render_template('Consultarcliente.html',Cliente = data)
@app.route('/registrarbusqueda_cliente',methods = ['POST'])  
def registrarbusqueda_cliente():
    if request.method == 'POST':
        Dni = request.form['Dni']
        Nombre = request.form['Nombre']
        ApellidoPat = request.form['ApellidoPat']
        ApellidoMat = request.form['ApellidoMat']
        
        if ApellidoMat == '' and ApellidoPat != '' and Nombre != '' and Dni != '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoPat = %s AND Nombre = %s AND Dni = %s',(ApellidoPat,Nombre,Dni))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)
        if ApellidoMat == '' and ApellidoPat == '' and Nombre != '' and Dni != '':
            cur = mysql.connection.cursor()
            cur.execute(
                'SELECT * FROM Cliente WHERE Nombre = %s AND Dni = %s', (Nombre, Dni))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)
        if ApellidoMat == '' and ApellidoPat == '' and Nombre != '' and Dni == '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE Nombre = %s',[Nombre])
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)
        else: print(0)
    return 'iosif'



if __name__ == '__main__':
    app.run(port=3000, debug=True)