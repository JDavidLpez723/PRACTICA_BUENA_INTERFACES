$(document).ready(function start2(){
  $(".grado").hide();
  $("#login").click(check_session());
  $("#register").click(function(){
    $("#inicio").hide();
    $("#formulario").show();
    $("#formulario").css("display", "grid");
  });
  $("#save").click(function(){
    checkEmail();
  });
  $("#login").click(function(){
    check_session();
  });
  
  $("#alumno").click(function(){
    $(".grado").show();
  });
  $("#profesor").click(function(){
    $(".grado").hide();
  });
  $("#administrador").click(function(){
    $(".grado").hide();
  });

});



function setCookie(name, value) { //para guardar cookie con su nombre y valor (distintos Strings)
    var expires = "";

    cookieString = name + "=" + escape(value);
    if (expires)
        cookieString += "; expires=" + expires;

document.cookie = cookieString;
}

function getCookie(name) { //para obtener los distintos Strings de la cookie y eliminar delimitadores etc
    var delimiter = "---";

	var nameEquals = name + "=";
    var full_cookie = document.cookie.split(nameEquals)[1].split(";")[0]; //se queda con el valor de la cookie pedida desechando expires, etc
    var values_cookie = full_cookie.split(delimiter); //obtenemos los distintos valores en un array
    return values_cookie;
}

function checkCookie(a) { //validamos formulario. Parametro: valor de contador. Si esta todo correcto, creamos cookie
	var delimiter = "---";

    username = document.getElementById('usuario').value;
    if (username == "") {
        alert("Debe rellenar el usuario");
        return "";
    }
	nia = document.getElementById('nia').value;
	if (nia == "") {
        alert("Debe rellenar con su NIA");
        return "";
    }
    password = document.getElementById('contraseña').value;
    if (password == "") {
        alert("Debe rellenar la contraseña");
        return "";
    }
    namee = document.getElementById('nomAp').value;
    if (namee == "") {
        alert("Debe rellenar el nombre");
        return "";
    }
    email = document.getElementById('correo').value;
    if (email == "") {
        alert("Debe rellenar un email correcto");
        return "";
    }
    var exp = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
    if (exp.test(email) == false) {
        alert("Debe rellenar un email correcto, formato nombre@dominio.extensión");
        return "";
    }
    bday = document.getElementById('birth').value;
    if (bday == "") {
        alert("Debe rellenar fecha de nacimiento");
        return "";
    }
	dni= document.getElementById('dni').value;
	if (dni == "") {
        alert("Debe rellenar su DNI");
        return "";
    }
	/*
	rol = document.getElementById('rol').value;
    if (rol == "") {
        alert("Debe indicar un rol");
        return "";
    }
	
    idioma_1 = "";
    if (document.getElementById('español').checked) idioma_1 = document.getElementById('español').value;
    idioma_2 = "";
    if (document.getElementById('ingles').checked) idioma_2 = document.getElementById('ingles').value;
    idioma_3 = "";
    if (document.getElementById('frances').checked) idioma_3 = document.getElementById('frances').value;
    idioma_4 = "";
    if (document.getElementById('italiano').checked) idioma_4 = document.getElementById('italiano').value;
    idioma_5 = "";
    if (document.getElementById('aleman').checked) idioma_1 = document.getElementById('aleman').value;
    idioma_6 = "";
    if (document.getElementById('portugues').checked) idioma_1 = document.getElementById('portugues').value;
    */
    conditions = document.getElementById('terms').value;
    
    if (conditions == "") {
        alert("No has aceptado los términos");
        return "";
    }
    //almacenamos en un String los valores de los campos separados por delimitador
    var userdata = username + delimiter + nia + delimiter + password + delimiter + namee + delimiter + email + delimiter + bday + delimiter + dni + delimiter + conditions;

    counter = parseInt(a, 10); //pasamos a entero el contador
    counter += 1; //lo incrementamos para llamar a la proxima cookie
    name_cookie = "" + counter; //ponemos nombre a cookie
    setCookie(name_cookie, userdata); //Creamos cookie, con identificadores distintos, cookie1, cookie2, etc
    sessionStorage.setItem("contador", String(counter)); //almacenamos valor actualizado de contador
    sessionStorage.setItem(name_cookie, name_cookie); //para tener sólo id de cookie guardada y buscar luego en iniciar sesion

    //si todo esta correcto

	alert("Registro realizado con éxito");
    
}

function checkEmail() { //comprobamos primero si email esta correcto
    var delimiter = "---";
    if (sessionStorage.getItem("contador") == null) //sólo en la primera ejecucion establecemos contador, para posteriormente nombrar la cookie y buscar por ella
        sessionStorage.setItem("contador", "0");
    
    email = document.getElementById('correo').value;
    if (email == "") return false; //si email no tiene valor, no tiene sentido que busque si existe
    for (data_toSearch = document.cookie.split("delimiter"), i = data_toSearch.length; i--;) //si existe, no se hace nada
        if (data_toSearch[i] == email) {
            alert("Ya existe cuenta asociada a este correo");
            return false;
        }


    checkCookie(sessionStorage.getItem('contador')); //llamamos a checkCookie para rellenar la cookie con los valores de los campos del form y despues crearla



}

function check_session() { //comprobar el inicio de sesión para ver si existe correo y contraseña en alguna cookie
    var check_email = false;
    var check_pass = false;
    var usuario;
    //obtenemos campos que introdujo usuario
    email = document.getElementById('correo1').value;
    password = document.getElementById('contraseña1').value;
    //obtener contador, que es nuestro valor maximo de cookies guardadas
    limite = sessionStorage.getItem("contador");

    for (i = 1; i <= limite; i++) { //buscamos si email y password introducidas existen en cookies
        id = String(i);
        nom_cookie = sessionStorage.getItem(id);
        for (cookie_toSearch = getCookie(nom_cookie), j = cookie_toSearch.length; j--;) {
            if (cookie_toSearch[j] == email) check_email = true; //existe email
            if (cookie_toSearch[j] == password) check_pass = true; //existe password
            if (check_email == true && check_pass == true) {
                usuario = cookie_toSearch[0]; //si estamos en la cookie que contiene ese email y esa password, cogemos su usuario
            }
        }
    }
    if (check_email == true && check_pass == true) { //si existen email y contraseña, mostramos section con la pagina principal y usuario actualizado
        /* for (elements = document.getElementsByClassName('sect1'), i = elements.length; i--;) {
            (elements[i].style.display = "block");
        }
        for (elements = document.getElementsByClassName('sect3'), j = elements.length; j--;) {
            (elements[j].style.display = "none");
        }
        //cambiar nombre de usuario
        document.getElementById("user_text").innerHTML = String(usuario);
        //actualizamos menu
        document.getElementById('p_menu_1').id = "p_menu_1_changed";
        document.getElementById('p_menu_1_changed').innerHTML = "Cerrar sesión";
        document.getElementById("p_menu_2").id = "p_menu_2_changed";
        document.getElementById("p_menu_2_changed").innerHTML = "Perfil";

        var foot = document.getElementsByTagName('footer');
        foot[0].style.position = 'static'; //para que no se fije el footer */
        alert("usuario dado de alta");


    } else alert("Este usuario no está dado de alta"); //si no existe el usuario

}


