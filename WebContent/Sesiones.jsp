<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<html>

<body>
<form name="Formulario_Compra" action="Sesiones.jsp">
 
  <p>Artículos a comprar:</p>
  <p>
    <label>
      <input type="checkbox" name="articulos" value="agua " >
      Agua </label>
    <br>
    <label>
      <input type="checkbox" name="articulos" value="leche" >
      Leche </label>
    <br>
     <label>
      <input type="checkbox" name="articulos" value="pan" >
      Pan </label>
    <br>
     <label>
      <input type="checkbox" name="articulos" value="manzanas" >
      Manzanas </label>
    <br>
     <label>
      <input type="checkbox" name="articulos" value="carne" >
      Carne </label>
      <br>
       <label>
      <input type="checkbox" name="articulos" value="pescado" >
      Pescado </label>
  </p>
  <p>
    <input type="submit" name="button" id="button" value="Enviar">
    <br>
  </p>
</form>

<h2>Carro de la compra</h2>

<ul>
<%

List<String>listaElementos=(List<String>)session.getAttribute("misElementos");		//getAttributes devuelve un objeto ppor tanto hay que hacer un downcasting para que quepa e un objeto List<String>. Se le pasa el nombre del objeto

if(listaElementos==null){
	listaElementos=new ArrayList<String>();
	session.setAttribute("misElementos", listaElementos);		//se guardará en la sesión creada listaElementos para que no se pierda su información y se le da un nombre identificativo a este objeto, especificado por la String
}

String[]elementos=request.getParameterValues("articulos");		//se obtienen los elementos marcados en articulos que es un elemento html

if(elementos!=null){											//se añaden a la lista que tiene memoria en la sesion ya para este punto lo que haya en el array 
	for(String str:elementos){
		listaElementos.add(str);		
	}
}

for (String str2:listaElementos){
	out.println("<li>"+str2+"</li>");
}

//obtención del identificativo individual para esta session
out.println();
out.println(session.getId());

if(session.isNew()){
	out.println();
	out.println("Usuario nuevo, sesion nueva");
}
else{ 
	out.println();
	out.println("Mismo usuario");
}

if(listaElementos.size()==4){			//en este caso se establece que si se ha detectaddo que el cliente ha seleccionado ya 4 articulos del carro de la compra, se invalidará la sesión de modo que la próxima selección corresonderá con un Id nuevo que se generará
	session.invalidate();
}

//
out.println(session.getMaxInactiveInterval());

//establecimiento del tiempo de caducidad de la pagina
session.setMaxInactiveInterval(100);		//se establece este tiempo en 100 segundos. Pasado este tiempo se invalida la sesión.
%>
</ul>



</body>
</html>