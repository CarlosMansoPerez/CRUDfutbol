<%-- 
    Document   : insertarFicha
    Created on : 09-may-2022, 10:06:23
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <%
      request.setCharacterEncoding("UTF-8");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD_Carlos_Futbol","admin", "admin");
        
              Statement c = conexion.createStatement();
              Statement f = conexion.createStatement();
              %>

    
    <h1>Ya está insertado en la Base de datos de nuestro web</h1>
    <form action="index.jsp">
        <button class="bg-secondary m-5  text-light boton2 fs-4 fuente fw-bold sombra">Volver</button>
      </form>
    
    <%
     
       
      
      String insercionDatos =  "INSERT INTO ficha (IDfutbolista,IDclub,FechaFichaje,FechaVenta) VALUES ("+request.getParameter("insercionIDfutbolista")+","+request.getParameter("insercionNuevoClub")+","+request.getParameter("insercionFF")+","+request.getParameter("insercionFV")+")";

   
      
    c.execute(insercionDatos);
      
     response.sendRedirect("index.jsp");

    %>
    
  </body>
</html>
