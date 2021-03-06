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
    cur = mysql.connection.cursor()
    cur.execute('CALL mostrar_joyas()')
    joyas = cur.fetchall()
    return render_template('Consultarjoya.html',joyas = joyas)
    


@app.route('/agregarjoya.html')
def AgregarJoya():
    return render_template('agregarjoya.html')








# Jhonatan
@app.route('/Crear_Pedido.html')
def Crear_Pedido():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM Cliente')
    data = cur.fetchall()
    print(data)
    return render_template('Crear_Pedido.html')

@app.route('/consultar_pedidos.html')
def Consultar_pedidos():
    cur = mysql.connection.cursor()
    cur.execute('CALL mostrar_pedidos()')
    ped = cur.fetchall()
    return render_template('consultar_pedidos.html', Pedidos = ped)


@app.route('/busqueda_Pedidos', methods=['POST'])
def BusquedaPedidos():
    if request.method == 'POST':
        Codigo = request.form['Codigo']
        Producto = request.form['Producto']
        Fecha = request.form.get('Fecha')
        if Codigo == '' and Producto != '' and Fecha == '':
            cur = mysql.connection.cursor()
            cur.execute('CALL realizarbusqueda_pedidos1(%s)',[Producto])
            ped = cur.fetchall()
            return render_template('consultar_pedidos.html', Pedidos=ped)
        if Codigo != '' and Producto == '' and Fecha == '':
            cur = mysql.connection.cursor()
            cur.execute('CALL realizarbusqueda_pedidos2(%s)', [Codigo])
            ped = cur.fetchall()
            return render_template('consultar_pedidos.html', Pedidos=ped)
        if Codigo == '' and Producto == '' and Fecha != '':
            cur = mysql.connection.cursor()
            cur.execute('CALL realizarbusqueda_pedidos3(%s)', [Fecha])
            ped = cur.fetchall()
            return render_template('consultar_pedidos.html', Pedidos=ped)
        if Codigo != '' and Producto != '' and Fecha == '':
            cur = mysql.connection.cursor()
            cur.execute('CALL realizarbusqueda_pedidos4(%s,%s)', (Codigo,Producto))
            ped = cur.fetchall()
            return render_template('consultar_pedidos.html', Pedidos=ped)
        if Codigo == '' and Producto != '' and Fecha != '':
            cur = mysql.connection.cursor()
            cur.execute('CALL realizarbusqueda_pedidos5(%s,%s)', (Producto,Fecha))
            ped = cur.fetchall()
            return render_template('consultar_pedidos.html', Pedidos=ped)
        if Codigo != '' and Producto == '' and Fecha != '':
            cur = mysql.connection.cursor()
            cur.execute('CALL realizarbusqueda_pedidos6(%s,%s)', (Codigo,Fecha))
            ped = cur.fetchall()
            return render_template('consultar_pedidos.html', Pedidos=ped)
        if Codigo != '' and Producto != '' and Fecha != '':
            cur = mysql.connection.cursor()
            cur.execute('CALL realizarbusqueda_pedidos7(%s,%s,%s)', (Codigo,Producto,Fecha))
            ped = cur.fetchall()
            return render_template('consultar_pedidos.html', Pedidos=ped)
        if Codigo == '' and Producto == '' and Fecha == '':
            cur = mysql.connection.cursor()
            cur.execute('CALL mostrar_pedidos()')
            ped = cur.fetchall()
            return render_template('consultar_pedidos.html', Pedidos=ped)

@app.route('/consultar_cotizacion.html')
def consultar_cotizacion():
    cur = mysql.connection.cursor()
    cur.execute('CALL mostrar_cotizaciones()')
    Cot = cur.fetchall()
    return render_template('consultar_cotizacion.html', Cotizacion=Cot)


@app.route('/busqueda_cotizacion', methods=['POST'])
def busqueda_Cotizacion():
    if request.method == 'POST':
        Nombre_Cliente = request.form['Nombre_Cliente']
        Fecha = request.form.get('Fecha')
        Valor_Cotizacion = request.form.get('Valor_Cotizacion')
        Estado = request.form.get('Estado')
        Tipo_Joya = request.form.get('Tipo_Joya')
        if  Nombre_Cliente == '' and Fecha != '' and Valor_Cotizacion == None and Estado == None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones1(%s)",[Fecha])
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if  Nombre_Cliente != '' and Fecha == '' and Valor_Cotizacion == None and Estado == None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones2(%s)", [Nombre_Cliente])
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha == '' and Valor_Cotizacion == 'S/0 - S/500' and Estado == None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones3A()")
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha == '' and Valor_Cotizacion == 'S/500 - S/1000' and Estado == None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones3B()")
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha == '' and Valor_Cotizacion == 'S/1000 - S/2000' and Estado == None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones3C()")
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if  Nombre_Cliente == '' and Fecha == '' and Valor_Cotizacion == None and Estado != None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones4(%s)", [Estado])
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if  Nombre_Cliente == '' and Fecha == '' and Valor_Cotizacion == None and Estado == None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones5(%s)", [Tipo_Joya])
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        
        if  Nombre_Cliente != '' and Fecha != '' and Valor_Cotizacion == None and Estado == None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute(
                "CALL realizarbusqueda_cotizaciones6(%s,%s)", (Nombre_Cliente, Fecha))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente != '' and Fecha == '' and Valor_Cotizacion == 'S/0 - S/500' and Estado == None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute(
                "CALL realizarbusqueda_cotizaciones7(%s)", [Nombre_Cliente])
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente != '' and Fecha == '' and Valor_Cotizacion == None and Estado != None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute(
                "CALL realizarbusqueda_cotizaciones8(%s,%s)", (Nombre_Cliente,Estado))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente != '' and Fecha == '' and Valor_Cotizacion == None and Estado == None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute(
                "CALL realizarbusqueda_cotizaciones9(%s,%s)", (Nombre_Cliente,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha != '' and Valor_Cotizacion == 'S/0 - S/500' and Estado == None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones10(%s)", [Fecha])
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha != '' and Valor_Cotizacion == None and Estado != None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones11(%s,%s)", (Fecha,Estado))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha != '' and Valor_Cotizacion == None and Estado == None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones12(%s,%s)", (Fecha,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha == '' and Valor_Cotizacion == 'S/0 - S/500' and Estado != None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones13(%s)", [Estado])
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha == '' and Valor_Cotizacion == 'S/0 - S/500' and Estado == None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones14(%s)", [Tipo_Joya])
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha == '' and Valor_Cotizacion == None and Estado != None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones15(%s,%s)", (Estado,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)

        if Nombre_Cliente != '' and Fecha != '' and Valor_Cotizacion == 'S/0 - S/500' and Estado == None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones16(%s,%s)", (Nombre_Cliente,Fecha))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente != '' and Fecha != '' and Valor_Cotizacion == None and Estado != None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones17(%s,%s,%s)", (Nombre_Cliente,Fecha,Estado))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente != '' and Fecha != '' and Valor_Cotizacion == None and Estado == None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones18(%s,%s,%s)", (Nombre_Cliente,Fecha,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha != '' and Valor_Cotizacion == 'S/0 - S/500' and Estado != None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones19(%s,%s)", (Fecha,Estado))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha != '' and Valor_Cotizacion == 'S/0 - S/500' and Estado == None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones20(%s,%s)", (Fecha,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha == '' and Valor_Cotizacion == 'S/0 - S/500' and Estado != None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones21(%s,%s)", (Estado,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente != '' and Fecha == '' and Valor_Cotizacion == 'S/0 - S/500' and Estado != None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones21A(%s,%s)", (Nombre_Cliente, Estado))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente != '' and Fecha == '' and Valor_Cotizacion == 'S/0 - S/500' and Estado == None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones21B(%s,%s)", (Nombre_Cliente,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente != '' and Fecha == '' and Valor_Cotizacion == None and Estado != None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones21C(%s,%s,%s)", (Nombre_Cliente,Estado,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha != '' and Valor_Cotizacion == None and Estado != None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones21D(%s,%s)", (Fecha,Estado,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        
        if Nombre_Cliente != '' and Fecha != '' and Valor_Cotizacion == 'S/0 - S/500' and Estado != None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones22(%s,%s,%s)", (Nombre_Cliente,Fecha,Estado))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente != '' and Fecha != '' and Valor_Cotizacion == 'S/0 - S/500' and Estado == None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones23(%s,%s,%s)", (Nombre_Cliente,Fecha,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        if Nombre_Cliente == '' and Fecha != '' and Valor_Cotizacion == 'S/0 - S/500' and Estado != None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones24(%s,%s,%s)", (Fecha,Estado,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        
        if Nombre_Cliente != '' and Fecha != '' and Valor_Cotizacion == 'S/0 - S/500' and Estado != None and Tipo_Joya != None:
            cur = mysql.connection.cursor()
            cur.execute("CALL realizarbusqueda_cotizaciones25(%s,%s,%s,%s)", (Nombre_Cliente,Fecha,Estado,Tipo_Joya))
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)
        
        if Nombre_Cliente == '' and Fecha == '' and Valor_Cotizacion == None and Estado == None and Tipo_Joya == None:
            cur = mysql.connection.cursor()
            cur.execute('CALL mostrar_cotizaciones()')
            Cot = cur.fetchall()
            return render_template('consultar_cotizacion.html', Cotizacion=Cot)


@app.route('/Crear_cotizacion.html')
def CrearCotizacion():
    return render_template('Crear_cotizacion.html')
@app.route('/add_cotizacion')
def add_cotizacion():
    if request.method == 'POST':
        Tipo_joya = request.form['Tipo_joya']
        Tipo_Pureza = request.form['Tipo_Pureza']
        Nombrejoya = request.form['Nombrejoya']
        cantidad = request.form['cantidad']
        preciounitario = request.form['preciounitario']
        Especificacion = request.form['Especificacion']
        cur = mysql.connection.cursor()
        cur.execute("")
        mysql.connection.commit()
        return 'received'


@app.route('/iniciopedido.html')
def iniciopedido():
    return render_template('inicioPedido.html')

@app.route('/InicioVenta.html')
def InicioVenta():
    return render_template('InicioVenta.html')


@app.route('/inicioCotizacion.html')
def inicioCotizacion():
    return render_template('inicioCotizacion.html')
    
#Iosif
@app.route('/Agregarcliente.html')
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

#1 campo
        if ApellidoMat != '' and ApellidoPat == '' and Nombre == '' and Dni == '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoMat = %s',[ApellidoMat])
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

        if ApellidoMat == '' and ApellidoPat != '' and Nombre == '' and Dni == '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoPat = %s',[ApellidoPat])
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

        if ApellidoMat == '' and ApellidoPat == '' and Nombre == '' and Dni != '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE Dni = %s',[Dni])
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

        if ApellidoMat == '' and ApellidoPat == '' and Nombre != '' and Dni == '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE Nombre = %s',[Nombre])
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

#2 campos
        if ApellidoMat != '' and ApellidoPat != '' and Nombre == '' and Dni == '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoMat = %s AND ApellidoPat = %s',(ApellidoMat, ApellidoPat))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

        if ApellidoMat != '' and ApellidoPat == '' and Nombre != '' and Dni == '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoMat = %s AND Nombre = %s',(ApellidoMat, Nombre))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)
        
        if ApellidoMat != '' and ApellidoPat == '' and Nombre == '' and Dni != '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoMat = %s AND Nombre = %s',(ApellidoMat, Dni))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

        if ApellidoMat == '' and ApellidoPat != '' and Nombre != '' and Dni == '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoPat = %s AND Nombre = %s',(ApellidoPat, Nombre))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

        if ApellidoMat == '' and ApellidoPat != '' and Nombre == '' and Dni != '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoPat = %s AND Dni = %s',(ApellidoPat, Dni))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

        if ApellidoMat == '' and ApellidoPat == '' and Nombre != '' and Dni != '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE Nombre = %s AND Dni = %s',(Nombre, Dni))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)
#3 campos
        if ApellidoMat != '' and ApellidoPat != '' and Nombre != '' and Dni == '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoMat = %s AND ApellidoPat = %s AND Nombre = %s',(ApellidoMat, ApellidoPat, Nombre))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

        if ApellidoMat != '' and ApellidoPat != '' and Nombre == '' and Dni != '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoMat = %s AND ApellidoPat = %s AND Dni = %s',(ApellidoMat, ApellidoPat, Dni))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

        if ApellidoMat == '' and ApellidoPat != '' and Nombre != '' and Dni != '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoPat = %s AND Nombre = %s AND Dni = %s',(ApellidoPat, Nombre, Dni))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)

        if ApellidoMat != '' and ApellidoPat == '' and Nombre != '' and Dni != '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoMat = %s AND Nombre = %s AND Dni = %s',(ApellidoMat, Nombre, Dni))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)
#4 Campos    

        if ApellidoMat != '' and ApellidoPat != '' and Nombre != '' and Dni != '':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM Cliente WHERE ApellidoMat = %s AND ApellidoPat = %s AND Nombre = %s AND Dni = %s',(ApellidoMat, ApellidoPat, Nombre, Dni))
            data = cur.fetchall()
            return render_template('Consultarcliente.html', Cliente=data)


        else: print(0)
    return 'iosif'

if __name__ == '__main__':
    app.run(port=3000, debug=True)