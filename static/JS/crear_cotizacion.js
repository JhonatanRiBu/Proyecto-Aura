/*Popup*/
var btnAbrirpopup1 = document.getElementById('cliente'),
    overlay1 = document.getElementById("overlay1"),
    popup1 = document.getElementById("popup1"),
    btnCerrarpopup1 = document.getElementById("btn-cerrar-pop-up1"),
    btnAgregarCliExistente = document.getElementById("btn_agregar_cli_existente");


btnAbrirpopup1.addEventListener('click', function () {
    overlay1.classList.add("activate");
    popup1.classList.add("activate");
});
btnCerrarpopup1.addEventListener('click', function () {
    overlay1.classList.remove("activate");
    popup1.classList.remove("activate");
});
btn_agregar_cli_existente.addEventListener('click', function () {
    overlay1.classList.remove("activate");
    popup1.classList.remove("activate");
});


/*Ocultar boton_busqueda*/
var nomostrar1 = document.getElementById('nomostrar1'),
    nomostrar2 = document.getElementById('nomostrar2'),
    nomostrar3 = document.getElementById('nomostrar3');
    
btnAbrirpopup1.addEventListener('click', function () {
    nomostrar1.classList.add("activate");
});
btnAbrirpopup1.addEventListener('click', function () {
    nomostrar2.classList.add("activate");
});
btnAbrirpopup1.addEventListener('click', function () {
    nomostrar3.classList.add("activate");
});


btnCerrarpopup1.addEventListener('click', function () {
    nomostrar1.classList.remove("activate");
});
btnCerrarpopup1.addEventListener('click', function () {
    nomostrar2.classList.remove("activate");
});
btnCerrarpopup1.addEventListener('click', function () {
    nomostrar3.classList.remove("activate");
});
btnAgregarCliExistente.addEventListener('click', function () {
    nomostrar1.classList.remove("activate");
});
btnAgregarCliExistente.addEventListener('click', function () {
    nomostrar2.classList.remove("activate");
});
btnAgregarCliExistente.addEventListener('click', function () {
    nomostrar3.classList.remove("activate");
});
var btn_agregar_cotizacion = document.getElementById("boton-eliminar");
btn_agregar_cotizacion.addEventListener('click', function () {
    alert("Cotización agregada correctamente");
});

