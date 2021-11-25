var btnAbrirPopup = document.getElementById('visualizar1'),
    overlay = document.getElementById('overlay'),
    popup = document.getElementById('popup'),
    btnCerrarPopup = document.getElementById('btn-cerrar-pop-up');
    
    
btnAbrirPopup.addEventListener('click', function(){
    overlay.classList.add('activate');
    popup.classList.add("activate");
});

btnCerrarPopup.addEventListener('click', function(){
    overlay.classList.remove('activate');
    popup.classList.remove("activate");
});


var btnAbrirPopup2 = document.getElementById('modificar1'),
    overlay2 = document.getElementById('overlay2'),
    popup2 = document.getElementById('popup2'),
    btnCerrarPopup2 = document.getElementById('btn-cerrar-pop-up2');
    
btnAbrirPopup2.addEventListener('click', function(){
    overlay2.classList.add('activate');
    popup2.classList.add("activate");
});

btnCerrarPopup2.addEventListener('click', function(){
    overlay2.classList.remove('activate');
    popup2.classList.remove("activate");
});