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
String usuario=request.getParameter("usuario");
String contrasena=request.getParameter("contra");

//carga din�mica del driver en tiempo de ejecucui�n.
Class.forName("com.mysql.jdbc.Driver");

try{
	Connection objConnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_jsp","root","");

	PreparedStatement objPreparedStatement=objConnection.prepareStatement("Select * from usuarios where Usuario=? and contrasena=?");

	objPreparedStatement.setString(1,usuario);
	
	objPreparedStatement.setString(2,contrasena);
	
	ResultSet objResultSet=objPreparedStatement.executeQuery();		//esta instrucci�n devolver� un ResultSet vacio, si los valores de usuario y contrase�a no coinciden con ninguno de los valores que hayen la base de datos o devolver� un registro con la coincidencia. 
	

	if(objResultSet.absolute(1)){		//este m�todo devolver� true si existe un valor dentro del ResultSet, si devuelve falso es que el ResultSet esta vacio.
			out.println("Usuario autorizado");
	}
	else{
		out.println("No existe usuario con esos datos");
	}
	
}

catch(Exception e){
	System.out.println("Se ha producido una excepci�n");
}

%>

</body>
</html>