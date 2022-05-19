<%-- 
    Document   : insertar
    Created on : 28-abr-2022, 12:13:28
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
        <title>Inserción de jugador</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="./style/estilo.css" type="text/css">
    </head>
    <body style="background-image: url(img/pelota.jpg)">
        <h1 class="fuente fw-bold fst-italic tamanioLetra sombra2 m-3">Inserta a un nuevo jugador</h1>
        <%
          request.setCharacterEncoding("UTF-8");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD_Carlos_Futbol","admin", "admin");
        %>
         
            <form class="bg-dark bg-opacity-50 p-3 m-3" action="insertarBD.jsp" method="post">
            <p class="fuente sombra2 fs-2 ">Nombre </p><input type="text" name="insercionNombre"><br>
            <p class="fuente sombra2 fs-2 ">Apellido </p><input type="text" name="insercionApellido"><br>
            
            <button class="bg-secondary m-5 text-light boton2 fs-4 fuente fw-bold sombra" type="submit">Insertar</button>
          </form>

          <a href="index.jsp"><button class="bg-secondary m-5 text-light boton2 fs-4 fuente fw-bold sombra">Volver</button></a>
    </body>
</html>

