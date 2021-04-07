<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!----------------------------------------Expression Language------------------------------------->
Aplicando Expresion Language
2 + 2 es igual a ${2+2}
<br>
1 es menor que 2 ${1<2}
<br>
Si divido 3 entre 0 me da: ${3.8/0}
<br>
Si multiplico 3 por 4 por 0 me da: ${3 * 4 * 0}
<br>
10%4 me devuelve: ${10 mod 4}
<br>



<!------------------------------------------ JSTL Core Tags -------------------------------------->
Establecer el contenido de una variable
<c:set var="salarioTrabajador1" value="${1100*2}"/>
<br>

<br>

Imprimir en la página web el cotenido de esa variable
<br>
El salario del trabajador 1 es:<c:out value="${salarioTrabajador1}"></c:out>
<br>
El salario del trabajador 2 es:<c:out value="${salarioTrabajador2}">No hay datos</c:out>	<!-- Acá se imprimirá No hay datos pues no existe la variable trabajador2 en el <set>, si la declaramos y no la inicializamos pues no imprime nada -->
<br><br>
Chequear si el salario es mayor que la media nacional
<c:if test="${salarioTrabajador1>3000}">
	El salario es mayor que la media nacional
</c:if>
<br>

<c:choose>
	<c:when test="${salarioTrabajador1<2000}">
		Salario clase baja
	</c:when>
	<c:when test="${salarioTrabajador1>2000 && salarioTrabajador1<4000}">
		El salario:<c:out value="${salarioTrabajador1}"></c:out> es un salario de clase media
	</c:when>
	<c:otherwise>Salario Clase Alta!!!</c:otherwise>
</c:choose>
<br>

<%
String[]alumnos={"Antonio","Sandra","Maria","Marco"};

pageContext.setAttribute("losAlumnos", alumnos);
%>

Usando un bucle for Each para recorrer un array.
<br><br>
<c:forEach var="temp" items="${losAlumnos}" begin="1" end="3">
	<c:out value="${temp}"/><br>
</c:forEach>
<br>

<h2>catch tag example</h2>
<h2>Captura cualquier excepción que ourra en su cuerpo y lo expone opcionalmente</h2>
<br>
<c:catch var="catchException">
	<% int x=5/6; %>
</c:catch>

<c:if test="${catchException != null}">
<p>La excepcion es: ${catchException} <br> y su mensaje es: ${catchException.message}</p>
</c:if>
<br>

<!----------------------------------------JSTL fmt tags-------------------------------------------->
<!-- Formateando numeros -->
<c:set var="valorAFormatear" value="12345688.849123"/>
${valorAFormatear}
<br/>

Default:
<fmt:formatNumber value="${valorAFormatear}" type="currency"/>		<!-- formato tipo moneda -->
<br/>

Máximo Numero de Digitos="3":
<fmt:formatNumber value="${valorAFormatear}" type="number" maxIntegerDigits="3"></fmt:formatNumber>		<!-- formato numérico, estableciendo 3 tomara de los 5 digitos ennteros del numero solo los 3 mas bajos o sea 335. Esta etiqueta se puede autocerrar en la etiqueta de apertura o usar el par de apertura y cierre -->
<br>

Máxima cantidad de digitos después de la coma decimal se mostrarán="2":
<fmt:formatNumber value="${valorAFormatear}" type="number" maxFractionDigits="2"></fmt:formatNumber>		<!-- formato numérico, estableciendo 3 tomara de los 5 digitos ennteros del numero solo los 3 mas bajos o sea 335 -->
<br>

Agrupamiento usado="false"
<fmt:formatNumber value="${valorAFormatear}" type="number" groupingUsed="3"/>	<!-- en este caso muestra los digitos enteros sin puntos que separan las decenas de miles de los cientos etc -->
<br>

Patrón de presentación de datos usado="###.###E0"
<fmt:formatNumber value="${valorAFormatear}" type="number" pattern="###.###E0"></fmt:formatNumber>		<!-- formato numérico, estableciendo 3 tomara de los 5 digitos ennteros del numero solo los 3 mas bajos o sea 335 -->
<br>

<!-- Formateando fechas -->

<fmt:setLocale value="nl_NL"/>		<!-- Acá se establece el lugar del planeta donde se va a formatear su fecha y hora -->

<c:set var="today" value="<%=new java.util.Date() %>"/>
<br> Tipo:Tiempo => <fmt:formatDate type="time" value="${today}"/>
<br> Tipo:Fecha => <fmt:formatDate type="date" value="${today}"/>
<br> Tipo:Ambos => <fmt:formatDate type="both" value="${today}"/>

</body>
</html>