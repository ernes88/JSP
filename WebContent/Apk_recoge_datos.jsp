<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*" %>

<%
//En esta sección se extrae info de los campos del formulario html, los nombres que aparecen como String en getparameter no tienen que ver ni tienen que coincidir con las columnas de la base de datos, son solo los nombres que se dieron en el html   
String nombre=request.getParameter("nombre");
String apellido=request.getParameter("apellido");
String usuario=request.getParameter("usuario");
String contra=request.getParameter("contra");
String pais=request.getParameter("pais");
String tecno=request.getParameter("tecnologias");

//carga dinámica del driver en tiempo de ejecucuión.
Class.forName("com.mysql.jdbc.Driver");

try{
	
//Carga estática del driver
Connection objConnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_jsp","root",""); 
	
Statement objStatement=objConnection.createStatement();
	
//Consulta sql que se encargará de llevar los datos del archivo jsp hacia la base de datos.
String nuevoUsuario="INSERT INTO usuarios(Nombre,Apellido,Usuario,Contrasena,Pais,Tecnologia) VALUES ('" + nombre + "','" + apellido + "','" + usuario + "','" + contra + "','" + pais + "','" + tecno + "')";
	
objStatement.executeUpdate(nuevoUsuario);
	
System.out.println("Usuario insertado con exito");
}
catch(Exception e){
	System.out.println("Ha ocurrido una excepción");
}

%>
</body>
</html>