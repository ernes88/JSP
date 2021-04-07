<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agencia de Viajes</title>
</head>
<body>
<h2>Cookies</h2>

<%
//Esta pagina crea la cookie con las preferencias de usuario leidas desde el html
//Capturar la información que se envía desde el menú desplegable en el formulario html.
String ciudad_favorita=request.getParameter("ciudad_favorita");

//Creación de la Cookie
Cookie miCookie=new Cookie("agencia_viajes.ciudad_favorita",ciudad_favorita);		//Entre paréntesis se especifica el nombre y luego el valor de la cookie.

//Estableciendo la vida de la Cookie
miCookie.setMaxAge(365*24*60*60);		//un año de duración de la cookie

//Enviar la cookie al ordenador del usuario
response.addCookie(miCookie);

//agencia_viajes.jsp que se muestra abajo será el archivo encargado de ller esta cookie que generamos aca.
%>
Gracias por enviar tus preferencias

<a href="agencia_viajes_cookie.jsp">Ir a la agencia de viajes</a>
</body>
</html>