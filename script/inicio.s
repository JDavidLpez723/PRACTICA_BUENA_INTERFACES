$(document).ready(function start2(){
  $(".grado").hide();
  $("#login").click(checkCookie);
  $("#register").click(function(){
    $("#inicio").hide();
    $("#formulario").show();$("#formulario").css("display", "grid");
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

  $("#save").click(setCookie2);
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

    username = document.getElementById('username').value;
    if (username == "") {
        alert("Debe rellenar el usuario");
        return "";
    }
	
	nia = document.getElementById('nia').value;
	if (nia == "") {
        alert("Debe rellenar con su NIA");
        return "";
    }
	
	
    password = document.getElementById('password').value;
    if (password == "") {
        alert("Debe rellenar la contraseña");
        return "";
    }
	
    name = document.getElementById('name').value;
    if (name == "") {
        alert("Debe rellenar el nombre");
        return "";
    }
    surname_1 = document.getElementById('surname_1').value;
    if (surname_1 == "") {
        alert("Debe rellenar el primer apellido");
        return "";
    }
    surname_2 = document.getElementById('surname_2').value;
    if (surname_2 == "") {
        alert("Debe rellenar el segundo apellido");
        return "";
    }
    email = document.getElementById('email').value;
    if (email == "") {
        alert("Debe rellenar un email correcto");
        return "";
    }
    var exp = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
    if (exp.test(email) == false) {
        alert("Debe rellenar un email correcto, formato nombre@dominio.extensión");
        return "";
    }

    bday = document.getElementById('bday').value;
    if (bday == "") {
        alert("Debe rellenar fecha de nacimiento");
        return "";
    }
	dni= document.getElementById('dni').value;
	if (dni == "") {
        alert("Debe rellenar su DNI");
        return "";
    }
	
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
    conditions = document.getElementById('conditions').value;
    if (conditions == "") {
        alert("No has aceptado los términos");
        return "";
    }

    //almacenamos en un String los valores de los campos separados por delimitador
    var userdata = username + delimiter + nia + delimiter + password + delimiter + name + delimiter + surname_1 + delimiter + surname_2 + delimiter + email + delimiter + bday + delimiter + dni + delimiter + rol + delimiter 
         + idioma_1 + delimiter + idioma_2 + delimiter + idioma_3 + delimiter + idioma_4 + delimiter + idioma_5 + delimiter + idioma_6 + delimiter + conditions;

    counter = parseInt(a, 10); //pasamos a entero el contador
    counter += 1; //lo incrementamos para llamar a la proxima cookie
    name_cookie = "" + counter; //ponemos nombre a cookie
    setCookie(name_cookie, userdata); //Creamos cookie, con identificadores distintos, cookie1, cookie2, etc
    sessionStorage.setItem("contador", String(counter)); //almacenamos valor actualizado de contador
    sessionStorage.setItem(name_cookie, name_cookie); //para tener sólo id de cookie guardada y buscar luego en iniciar sesion

    //si todo esta correcto
	
	if (confirm("Registro realizado con éxito")){
		//Que aparezca iniciar session
		document.getElementById('form_inicio').style.display='block'
		//Que se quite lo de registrarse
		document.getElementById('form_user').style.display='none'
	} 
}
