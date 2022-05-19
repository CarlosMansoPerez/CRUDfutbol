<%-- 
    Document   : insertarBD
    Created on : 09-may-2022, 8:51:24
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
        
              Statement k = conexion.createStatement();
              %>

    
    <h1>Ya está insertado en la Base de datos de nuestro web</h1>
    <form action="index.jsp">
        <button class="bg-secondary m-5  text-light boton2 fs-4 fuente fw-bold sombra">Volver</button>
      </form>
    
    <%
      String insercion =  "INSERT INTO futbolista (Nombrefutbolista,Apefutbolista) VALUES ('"+request.getParameter("insercionNombre")+"','"+request.getParameter("insercionApellido")+"')";

      k.execute(insercion);
      
        response.sendRedirect("index.jsp");

    %>
    
  </body>
</html>
