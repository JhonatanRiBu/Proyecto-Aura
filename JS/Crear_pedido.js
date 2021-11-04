$(document).ready(function () {
    $("#productos").Datatable({
        "scrollY": "1000px",
        "srcollCollage": true,
        "paging": false
    });
});
/*Popup*/
var btnAbrirpopup1 = document.getElementById('btn-neon_cliente'),
    overlay = document.getElementById("overlay"),
    popup1 = document.getElementById("popup1"),
    btnCerrarpopup1 = document.getElementById("btn-cerrar-pop-up1");

btnAbrirpopup1.addEventListener('click', function () {
    overlay.classList.add("activate");
});
btnCerrarpopup1.addEventListener('click', function () {
    overlay.classList.remove("activate");
});
/*Ocultar boton_busqueda*/
var nomostrar1 = document.getElementById('nomostrar1'),
    nomostrar1 = document.getElementById('nomostrar1'),
    nomostrar1 = document.getElementById('nomostrar1'),
    nomostrar1 = document.getElementById('nomostrar1'),
    nomostrar1 = document.getElementById('nomostrar1'),
    nomostrar1 = document.getElementById('nomostrar1');
btnAbrirpopup1.addEventListener('click', function () {
    nomostrar1.classList.add("activate");
});
btnAbrirpopup1.addEventListener('click', function () {
    nomostrar2.classList.add("activate");
});
btnAbrirpopup1.addEventListener('click', function () {
    nomostrar3.classList.add("activate");
});
btnAbrirpopup1.addEventListener('click', function () {
    nomostrar4.classList.add("activate");
});
btnAbrirpopup1.addEventListener('click', function () {
    nomostrar5.classList.add("activate");
});
btnAbrirpopup1.addEventListener('click', function () {
    nomostrar6.classList.add("activate");
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
btnCerrarpopup1.addEventListener('click', function () {
    nomostrar4.classList.remove("activate");
});
btnCerrarpopup1.addEventListener('click', function () {
    nomostrar5.classList.remove("activate");
});
btnCerrarpopup1.addEventListener('click', function () {
    nomostrar6.classList.remove("activate");
});