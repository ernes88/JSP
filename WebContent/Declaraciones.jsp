<html>
<body>
<h1>Ejemplo de Declaraciones</h1>
<%!
private int resultado;
public int suma(int x,int y){
	resultado=x+y;
	return resultado;
}

public int resta(int x,int y){
	resultado=x-y;
	return resultado;
}

public int multiplica(int x,int y){
	resultado=x*y;
	return resultado;
}

%>

El resultado de la suma es: <%=suma(7,5)%><br>
El resultado de la resta es: <%=resta(7,5)%><br>
El resultado de la multiplicación es: <%=multiplica(7,5)%><br>

</body>
</html>