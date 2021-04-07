
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String[]alumnos={"Antonio","Sandra","Maria","Marco"};

pageContext.setAttribute("losAlumnos", alumnos);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
//Vía 1 utilizando código Java dentro de un Scriptlet dentro del HTML
//haciendo esto de esta forma estamos metiendo código java dentro de las etiquetas jsp y todo esto dentro del codigo html
for(String e:alumnos){
	out.print(e+"/n");
}
%>

<!-- Utilizando jsp tags de la librería jstl se crea este ciclo for each -->
<!-- se utiliza también una EL, o sea Expression Language ${} que permite sin tener que importar ninguna librería acceder a atributos,   -->
<c:forEach var="tempAlumno" items="${losAlumnos}">
	${tempAlumno} <br>
</c:forEach>

</body>
</html>