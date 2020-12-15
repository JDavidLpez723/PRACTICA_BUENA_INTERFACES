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



