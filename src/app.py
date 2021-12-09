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

@app.route('/InicioSesion.html')
def InicioSesion():
    return render_template('InicioSesion.html')

@app.route('/InicioPage.html')
def InicioPage():
    return render_template('InicioPage.html')

@app.route('/InicioInventarios.html')
def Inventario():
    return render_template('InicioInventarios.html')

@app.route('/Consultarmp.html')
def MateriaPrima():
    cur = mysql.connection.cursor()
    cur.execute('CALL mostrar_mp()')
    mp = cur.fetchall()
    return render_template('Consultarmp.html',materiaprima = mp)

@app.route('/busquedamp', methods = ['POST'])
def BusquedaMP():
    if request.method == 'POST':
        Codigo = request.form['codigomp']
        Nombre = request.form['nombremp']
        Tipomp = request.form.get('tipomp')
        Purezamp = request.form['tipopureza']
        
        if Codigo == '' and Nombre != '' and Tipomp != '' and Purezamp != '':
            cur = mysql.connection.cursor()
            cur.execute("""
            SELECT m.CodMateriaPrima, m.NombMateriaPrima, t.Descripcion, p.Pureza, s.Stock, u.Descripcion
            FROM MateriaPrima m INNER JOIN TipoMateriaPrima t
                                INNER JOIN Pureza p
                                INNER JOIN StockMP s INNER JOIN UnidadMedida u
            WHERE  m.CodTipoMP= %s AND m.CodPureza= %s AND m.NombMateriaPrima= %s 
            and m.CodTipoMP=t.CodTipoMP and p.CodPureza=m.CodPureza 
            and s.CodMateriaPrima=m.CodMateriaPrima and s.CodUMedida = u.CodUMedida;""",(Tipomp, Purezamp, Nombre))
            mp = cur.fetchall()
            return render_template('Consultarmp.html', materiaprima=mp)

@app.route('/especificaciones/<string:codigo>')
def Mostrarespecif(codigo):
    cur = mysql.connection.cursor()
    cur.execute("CALL especificaciones_mp(%s)", [codigo])
    especif_data = cur.fetchall()
    esp = especif_data[0]
    print(esp)
    return render_template('Consultarmp.html', esp = especif_data[0])



@app.route('/agregarmp.html')
def CargarAgregar():
    return render_template('agregarmp.html')


@app.route('/Consultarjoya.html')
def ConsultarJoya():
    return render_template('Consultarjoya.html')







# Jhonatan
@app.route('/Crear_Pedido')
def Crear_Pedido():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM Cliente')
    data = cur.fetchall()
    print(data)
    return render_template('Crear_Pedido.html')

@app.route('/Consultar_pedidos')
def Consultar_pedidos():
    cur = mysql.connection.cursor()
    cur.execute('Select * from Pedido ,ArticuloPedido ')
    data = cur.fetchall()
    return render_template('consultar_pedidos.html', Pedido=data)


@app.route('/Consultar_cotizacion')
def Consultar_cotizacion():
    cur = mysql.connection.cursor()
    cur.execute('Select * from Cotizacion')
    data = cur.fetchall()
    return render_template('consultar_cotizacion.html', Cotizacion=data)

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