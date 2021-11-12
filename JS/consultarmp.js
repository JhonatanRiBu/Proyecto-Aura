var btnAbrirPopup = document.getElementById('visualizar1'),
    overlay = document.getElementById('overlay'),
    popup = document.getElementById('popup'),
    btnCerarPopup = document.getElementById('btn-cerrar-pop-up');
    
btnAbrirPopup.addEventListener('click', function(){
    overlay.classList.add('activate');
    popup.classList.add("activate");
});

btnCerrarPopup.addEventListener('click', function(){
    overlay.classList.remove('activate');
    popup.classList.remove("activate");
});