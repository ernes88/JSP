<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agencia de Viajes</title>
</head>
<body>
<h1 style="text-align:center">Agencia de viajes</h1>

<%
//La pagina mostrará por defecto los valores originales de la página si nadie ha entrado en la misma.
//Este archivo se encarga de leer la cookie generada anteriormente.

//valor por defecto
String ciudad_favorita="Madrid";

//Lee las cookies de la petición del navegador
Cookie[]cookies=request.getCookies();

//Buscar las preferencias, en este caso la ciudad favorita, pero solo si ya se ha visitado la pagina al menos una vez anterior. 
if(cookies!=null){
	for(Cookie miCookie:cookies){
		if("agencia_viajes.ciudad_favorita".equals(miCookie.getName())){
			ciudad_favorita=miCookie.getValue();		//recojo la ciudad que el usuario escogio en el html.
			break;
		}
	}
}

%>

<h3>Vuelos a <%=ciudad_favorita %></h3>

<h3>Hoteles en <%=ciudad_favorita %></h3>

<h3>Descuentos en <%=ciudad_favorita %></h3>

</body>
</html>