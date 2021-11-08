/*Popup*/
var btnAbrirpopup1 = document.getElementById('cliente'),
    overlay1 = document.getElementById("overlay1"),
    popup1 = document.getElementById("popup1"),
    btnCerrarpopup1 = document.getElementById("btn-cerrar-pop-up1"),
    btnAgregarCliExistente = document.getElementById("btn_agregar_cli_existente"),
    btnAbrirpopup2 = document.getElementById("buscar_pd"),
    overlay2 = document.getElementById("overlay2"),
    popup2 = document.getElementById("popup2"),
    btnCerrarpopup2 = document.getElementById("btn-cerrar-pop-up2"),
    btnAgregarPd = document.getElementById("btn_agregar_prod");

    
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
    nomostrar3 = document.getElementById('nomostrar3'),
    nomostrar4 = document.getElementById('nomostrar4'),
    nomostrar5 = document.getElementById('nomostrar5'),
    nomostrar6 = document.getElementById('nomostrar6');
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

btnAgregarCliExistente.addEventListener('click', function () {
    nomostrar1.classList.remove("activate");
});
btnAgregarCliExistente.addEventListener('click', function () {
    nomostrar2.classList.remove("activate");
}); btnAgregarCliExistente.addEventListener('click', function () {
    nomostrar3.classList.remove("activate");
}); btnAgregarCliExistente.addEventListener('click', function () {
    nomostrar4.classList.remove("activate");
}); btnAgregarCliExistente.addEventListener('click', function () {
    nomostrar5.classList.remove("activate");
}); btnAgregarCliExistente.addEventListener('click', function () {
    nomostrar6.classList.remove("activate");
});



btnAbrirpopup2.addEventListener('click', function () {
    overlay2.classList.add("activate");
    popup2.classList.add("activate");
});
btnCerrarpopup2.addEventListener('click', function () {
    overlay2.classList.remove("activate");
    popup2.classList.remove("activate");
});
btnAgregarPd.addEventListener('click', function () {
    overlay2.classList.remove("activate");
    popup2.classList.remove("activate");
});


/*Ocultar boton_busqueda*/

btnAbrirpopup2.addEventListener('click', function () {
    nomostrar1.classList.add("activate");
});
btnAbrirpopup2.addEventListener('click', function () {
    nomostrar2.classList.add("activate");
});
btnAbrirpopup2.addEventListener('click', function () {
    nomostrar3.classList.add("activate");
});
btnAbrirpopup2.addEventListener('click', function () {
    nomostrar4.classList.add("activate");
});
btnAbrirpopup2.addEventListener('click', function () {
    nomostrar5.classList.add("activate");
});
btnAbrirpopup2.addEventListener('click', function () {
    nomostrar6.classList.add("activate");
});

btnCerrarpopup2.addEventListener('click', function () {
    nomostrar1.classList.remove("activate");
});
btnCerrarpopup2.addEventListener('click', function () {
    nomostrar2.classList.remove("activate");
});
btnCerrarpopup2.addEventListener('click', function () {
    nomostrar3.classList.remove("activate");
});
btnCerrarpopup2.addEventListener('click', function () {
    nomostrar4.classList.remove("activate");
});
btnCerrarpopup2.addEventListener('click', function () {
    nomostrar5.classList.remove("activate");
});
btnCerrarpopup2.addEventListener('click', function () {
    nomostrar6.classList.remove("activate");
});

btnAgregarPd.addEventListener('click', function () {
    nomostrar1.classList.remove("activate");
});
btnAgregarPd.addEventListener('click', function () {
    nomostrar2.classList.remove("activate");
}); btnAgregarPd.addEventListener('click', function () {
    nomostrar3.classList.remove("activate");
}); btnAgregarPd.addEventListener('click', function () {
    nomostrar4.classList.remove("activate");
}); btnAgregarPd.addEventListener('click', function () {
    nomostrar5.classList.remove("activate");
}); btnAgregarPd.addEventListener('click', function () {
    nomostrar6.classList.remove("activate");
});

var btn_pd_seleccionados = document.getElementById("btn_pd_seleccionados");
btn_pd_seleccionados.addEventListener('click', function () {
    alert("Pedido agregado correctamente");
});
