<%@ page import="ernes88.CalculosMatematicos.*"%>

<html>
<head>
<title>Mi primer JSP</title>
</head>

<body>
<!--Uso de Expresi�n JSP para incluir c�digo java en el archivo .jsp-->
La suma de 5 y 7 es <%= Calculo.suma(5,7) %>
<br>
La resta de 5 y 7 es <%= Calculo.resta(5,7) %>
<br>
La multiplicaci�n de 5 y 7 es <%= Calculo.multiplica(5,7) %>
<br>
<!--Se usa Expression Language (EL) para no tener que incluir c�digo java-->
La suma de 5 y 7 es ${5+7}
<br>
La resta de 5 y 7 es ${5-7}
<br>
La multiplicaci�n de 5 y 7 es ${5*7}
<br>
</body>
</html>