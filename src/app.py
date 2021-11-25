from flask import Flask, render_template, request, flash, redirect, url_for, session


app = Flask(__name__)

# Jesus


@app.route('/iniciosesion')
def InicioSesion():
    return render_template('InicioSesion.html')



# Jhonatan
@app.route('/Crear_Pedido')
def Crear_Pedido():
    return render_template('Crear_Pedido.html')









#Iosif







if __name__ == '__main__':
    app.run(port=3000, debug=True)