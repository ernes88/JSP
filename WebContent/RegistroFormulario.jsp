<html>
<body>
<h2>Usuarios Registrados</h2>

Usuario Confirmado<br><br>
Nombre:<%=request.getParameter("Nombre") %> &nbsp Apellido:<%=request.getParameter("Apellido") %>
<br><br>
<jsp:include page="Fecha.jsp"></jsp:include><br><br>


</body>
</html>