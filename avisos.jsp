
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
               <%
            String url = "jdbc:mysql://localhost:3306/bar";
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (java.lang.ClassNotFoundException e) {
                System.err.print("ClassNotFoundException: ");
                System.err.println(e.getMessage());
            }%> 
              <%  try {            
            Connection con;
            
            String id = request.getParameter("idcont");
            String editNome = request.getParameter("editNome");
            String editContacto = request.getParameter("editContacto");
            String editTipo = request.getParameter("editTipo");
            String sql = "update contactos set nomecontacto='"+editNome+"',contacto='"+editContacto+"',idTipoContacto="+editTipo+" where idContacto="+id;
            
            con = DriverManager.getConnection(url,"root","");
            Statement stmt = con.createStatement();
             stmt.executeUpdate(sql);
            response.sendRedirect("index.jsp");
             
            stmt.close();
            con.close();
         } catch(SQLException ex) {
            System.err.println("SQLException: " + ex.getMessage());
        }
        %>
    </body>
</html>
