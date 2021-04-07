<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*" %>
<%@ page import=java.util.* %>
<%@ page import=jsptags.Empleado %>

<%
	ArrayList<Empleado>empleados=new ArrayList<Empleado>();
	
	//carga dinámica del driver en tiempo de ejecucuión.
	Class.forName("com.mysql.jdbc.Driver");
	
	try{
		Connection objConnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/empleados","root","");
		Statement objStatement=objConnection.createStatement();
		ResultSet objResultSet=objStatement.executeQuery("SELECT * FROM EMPLEADOS");
		while(objResultSet.next()){
			objResultSet.previous();
			empleados.add(new Empleado(objResultSet.getString(1),objResultSet.getString(2),objResultSet.getString(3),objResultSet.getDouble(4)));
		}
		objResultSet.close();
		objConnection.close();
	
	}
	catch(Exception e){
		System.out.println("Excepción");
	}
	
	pageContext.setAttribute("losEmpleados", empleados);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="tempEmpleados" items="${losEmpleados}">
	${tempEmpleados.nombre} ${tempEmpleados.apellido} ${tempEmpleados.puesto} ${tempEmpleados.salario} <br>
</c:forEach>

</body>
</html>