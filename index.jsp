<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Futbolistas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./style/estilo.css" type="text/css">
  </head>
  <body style="background-image: url(img/balon.jpg)" class=" text-center">
    
    <%@include file="login.jsp"%>
    
  
    <h2 class="tamanioLetra fuente fw-bold sombra2">FUTBOLISTAS</h1>
    
    <%
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD_Carlos_Futbol","admin", "admin");
      Statement s = conexion.createStatement();
      
      ResultSet futbolistas = s.executeQuery("SELECT * from futbolista");
      
      out.print("<table class=\"centrar\" border=1>");
      
      while (futbolistas.next()) {
        out.println("<tr>");
        out.println("<td class=\"  datos fuente sombra fw-bold\">"+futbolistas.getString("Nombrefutbolista")+(" ")+futbolistas.getString("Apefutbolista")+"</td>");
        %>
        <td>
        <form class="borde" action="ficha.jsp" method="post">
          <input type="hidden" name="IDfutbolista" value="<%=futbolistas.getString("IDfutbolista")%>">
          <button class="bg-secondary fs-5 text-light boton fuente fw-bold sombra" type="submit">Ficha técnica</button>
        </form>
          
        
        <%
        out.println("</tr>");
      }
      out.println("</table>");

    %>
    
    <form  class="bg-light borde" action="insertar.jsp" method="post">
      <button class="bg-secondary text-light boton fs-4 fuente fw-bold sombra" type="submit">+ JUGADOR</button>
    </form>
    
    <form  class="bg-light borde" action="insertarClub.jsp" method="post">
      <button class="bg-secondary text-light boton fs-4 fuente fw-bold sombra" type="submit">+ CLUB</button>
    </form>
    
   
  </body>
</html>