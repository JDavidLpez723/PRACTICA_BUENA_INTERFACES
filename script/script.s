var x;
$(document).ready(function start(){
    // Cargar gráficos de google
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    // Dibujar el gráfico y establecer los valores inciales
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
        ['Tarea', 'Nota'],
        ['Actividad 1', 5],
        ['Examen 1', 6],
        ['Examen 2', 9],
    ]);

    // Añadir título y establecer ancho y alto
    var options = {'title':'Calificaciones Interfaces de Usuario', 'width':400, 'height':400};

    // Mostrar el gráfico dentro del elemento con id "linechart"
    var chart = new google.visualization.LineChart(document.getElementById('linechart'));
    chart.draw(data, options);
    }

    document.getElementById("nombre").innerHTML=obtenerVariables();
    $("#inicio").click(function(){
        $("#studentDiv").hide();
        $("#foroDiv").hide();
        $("#calificacionesDiv").hide();
        $(".topicDiv").show();
        $("#calificaciones2").css("display", "none");
    });
    $(".inicio").click(function(){
        $("#studentDiv").hide();
        $("#foroDiv").hide();
        $("#calificacionesDiv").hide();
        $(".topicDiv").show();
        $("#calificaciones2").css("display", "none");
    });

    $("#estudiantes").click(function(){
        $(".topicDiv").hide();
        $("#foroDiv").hide();
        $("#calificacionesDiv").hide();
        $("#studentDiv").show();
        $("#calificaciones2").css("display", "none");
    });

    $("#foro").click(function(){
        $(".topicDiv").hide();
        $("#studentDiv").hide();
        $("#calificacionesDiv").hide();
        $("#foroDiv").show();
        $("#calificaciones2").css("display", "none");
    });

    $("#calificaciones").click(function(){
        $(".topicDiv").hide();
        $("#studentDiv").hide();
        $("#foroDiv").hide();
        $("#calificacionesDiv").show();
        $("#calificaciones2").css("display", "block");
        $(".asignatura").css("display", "none");
        $("#calificacionesTable").show();
        $("#calButton").show();
    });

    $("#calificaciones2").click(function(){
        $(".asignatura").css("display", "block");
        $("#calificacionesTable").hide();
        $("#calButton").hide();
    });

    $(".iconMail").click(function(){
        window.location.href="mailto:someone@example.com?Subject=Interfaces%20de%20Usuario";
    })

    $("#grafica").click(function(){
        $("#chart").css("display", "block");
    });

    $("#calendario").click(function(){
        $("#myModal").css("display", "block");
    });

    $(".close").click(function(){
        $("#myModal").css("display", "none");
    });
    
    $(".close1").click(function(){
        $("#chart").css("display", "none");
    });

    var modal = document.getElementById("myModal");
    $(window).click(function(event){
        if (event.target == modal) {
        $("#myModal").css("display", "none");
        }
    });


    $(".closeSe").click(function(){
        if (confirm("¿Realmente quiere cerrar sesión?")) {
            location.replace("inicio.html");
        }        
    });

    $("#rev1").click(function(){
        window.alert("Las revisiones solo estarán disponibles en un plazo de siete días después de la publicación de la nota.");
    });
    $("#rev3").click(function(){
        if (confirm("¿Realmente quiere solicitar la revisión de esta tarea?")) {
            window.alert("Revisión solicitada correctamente. El profesor le comunicará la fecha y hora asignada.");
        }  
    });

}); 


function obtenerVariables(){
    var paramstr = window.location.search.substr(1);
    var paramarr = paramstr.split ("&");
    var params = {};

    for ( var i = 0; i < paramarr.length; i++) {
        var tmparr = paramarr[i].split("=");
        params[tmparr[0]] = tmparr[1];
        }
    return params['user'];
}

function exportTableToExcel(tableID, filename = ''){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}

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

