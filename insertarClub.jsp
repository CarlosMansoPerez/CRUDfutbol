<%-- 
    Document   : insertarClub
    Created on : 09-may-2022, 9:07:33
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
    <title>Inserción de Club</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="./style/estilo.css" type="text/css">
  </head>
  <body style="background-image: url(img/balon.jpg)" class=" text-center">
    <h1 class="fuente fw-bold fst-italic tamanioLetra sombra2">Inserta un nuevo club</h1>
    
    <%
          request.setCharacterEncoding("UTF-8");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD_Carlos_Futbol","admin", "admin");
    %>
    
        <form class="bg-dark bg-opacity-50 p-3 m-3" action="insertarClub2.jsp" method="post">
            <p class="fuente sombra2 fs-2 ">Nombre del Club </p><input type="text" name="insercionClub"><br>
            <br>
            <select class="mx-3" name="insercionCiudad" id="ciudad">
              <%
                Statement v = conexion.createStatement();
                
          ResultSet mostrarCiudades= v.executeQuery("SELECT CodCiudad,NombreCiudad from Ciudad");
        
          while(mostrarCiudades.next()){
        
          out.println("<option value="+mostrarCiudades.getString("CodCiudad")+ " class=\"margen\" >"+mostrarCiudades.getString("NombreCiudad")+"</option>");
  
  
  
      }
        %>
            </select>
            
            <br><br>
            
            <button class="bg-secondary m-5 text-light boton2 fs-4 fuente fw-bold sombra" type="submit">Insertar</button>
        </form>

          <a href="index.jsp"><button class="bg-secondary m-5 text-light boton2 fs-4 fuente fw-bold sombra">Volver</button></a>
    
    
  </body>
</html>
