<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<%
      
      if ("logout".equals(request.getParameter("accion"))) {
        session.invalidate();
        session = request.getSession();
      }
      
      String usuario = (String)session.getAttribute("usuario");
      if (usuario==null) {
        usuario = request.getParameter("usuarioform");
        
        if (usuario!=null) {
          request.setCharacterEncoding("UTF-8");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD_Carlos_Futbol", "admin", "admin");
          Statement s = conexion.createStatement();
          
          
          String consulta="SELECT * FROM Usuarios WHERE Usuario='";
          consulta += usuario+"' AND Contrasenia='";
          consulta += request.getParameter("contraseniaform")+"'";
          
          ResultSet consultaLogin = s.executeQuery(consulta);
          
          if (consultaLogin.next()){
            session.setAttribute("usuario",usuario);
          } else {
            usuario=null;
          }
        }
      }
        
      if (usuario==null) {
        %>
        <p class="tamanioLetra fuente sombra2">FutbolCRUD</p><br>
        <form class="centrar" action="#" method="post">
          <p class="fuente sombra2 fs-2">Nombre de usuario: </p><input type="text" name="usuarioform"><br>
          <p class="fuente sombra2 fs-2 ">Contraseña: </p><input type="password" name="contraseniaform"><br>
          <button class="bg-secondary m-5 text-light boton2 fs-4 fuente fw-bold sombra">Entrar</button>
          
        </form>    
        </body>
        </html>
        <%
        out.close();
      }
      
      
    %>
