<%-- 
    Document   : ficha
    Created on : 18-abr-2022, 9:54:41
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>futbolCRUD </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./style/estilo.css" type="text/css">
  </head>
  <body style="background-image: url(img/pelota.jpg)">
    
    <%
      
      request.setCharacterEncoding("UTF-8");
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD_Carlos_Futbol","admin", "admin");
      Statement s = conexion.createStatement();
      Statement q = conexion.createStatement();
      
      ResultSet futbolistas = s.executeQuery("SELECT Nombrefutbolista,Apefutbolista from futbolista WHERE IDfutbolista="+request.getParameter("IDfutbolista"));
      
      futbolistas.next();
     
      ResultSet ficha = q.executeQuery("SELECT Nombreclub,FechaFichaje,FechaVenta from ficha INNER JOIN club ON ficha.IDclub=club.IDclub WHERE IDfutbolista="+request.getParameter("IDfutbolista"));
      %>
      
      <h1 class="fuente fw-bold fst-italic tamanioLetra sombra2">Ficha técnica de <%=futbolistas.getString("Nombrefutbolista")+(" ")+futbolistas.getString("Apefutbolista")%></h1>
      
      <%
      out.println("<table class=\"centrar bg-dark bg-opacity-50\" border=1>");
      
      while (ficha.next()) {
        out.println("<tr>");
        out.println("<td class=\"text-light fuente fs-3\">");
        out.println(ficha.getString("Nombreclub")+(" | ")+ficha.getString("FechaFichaje")+("-")+ficha.getString("FechaVenta"));
        out.println("</td>");
        out.println("</tr>");
        
      }
      
      out.println("</table>");
      %>
    
      <h2 class="fuente  fw-bold fst-italic margen sombra2">Inserta nuevos datos a <%=futbolistas.getString("Nombrefutbolista")+(" ")+futbolistas.getString("Apefutbolista")%></h2>
      
      <p class="mx-3 my-2 fs-4 fuente sombra2">Nombre del club: </p>
      
        <form action="insertarFicha.jsp">
      <select class="mx-3" name="insercionNuevoClub" id="clubes">
        <%
         
        ResultSet mostrarClubes = s.executeQuery("SELECT IDclub,Nombreclub,Ciudad.CodCiudad, Ciudad.NombreCiudad from club JOIN Ciudad ON club.CodCiudad=Ciudad.CodCiudad ");
        
          while(mostrarClubes.next()){
        
         out.println("<option value="+mostrarClubes.getString("IDclub")+ " class=\"margen\" >"+mostrarClubes.getString("Nombreclub")+" - "+mostrarClubes.getString("CodCiudad")+" - "+mostrarClubes.getString("NombreCiudad")+"</option>");
  
  
  
    }
    %>
</select>
      
<br>

  <label class="mx-3  fs-4 fuente sombra2">Año de fichaje</label>
  <input name="insercionFF" class="margen"  type="text"><br>
   <label class="mx-3  fs-4 fuente sombra2">Año de venta</label>
  <input name="insercionFV"  class="margen" type="text">
  <input name="insercionIDfutbolista" value="<%=request.getParameter("IDfutbolista")%>" type="hidden">


  <br>
        <button class="bg-secondary m-5  text-light boton3 fs-4 fuente fw-bold sombra">Insertar Datos</button>
  </form>
    
      
      <form action="index.jsp">
        <button class="bg-secondary m-5  text-light boton2 fs-4 fuente fw-bold sombra">Volver</button>
      </form>
      
    
    </body>
  
