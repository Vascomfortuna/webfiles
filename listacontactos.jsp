<%-- 
    Document   : listacontactos
    Created on : Apr 16, 2015, 10:33:22 AM
    Author     : VascoF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            th{
                width:150px;
            }
            tr{
                border-style: solid;
                border-width: 1px;
            }
        </style>
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
            String table="";
            String nome = request.getParameter("tbutilizador");
            String sql = "select nome from utilizadores where username = '" +nome+"' and password = '" +request.getParameter("tbpassword")+"'";
            
            con = DriverManager.getConnection(url,"root","");
            Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql);
           if(rs.next()){
            String sql2 = "Select contactos.idcontacto,contactos.NomeContacto, contactos.Contacto, tipocontacto.Tipocontacto"
                        + " from contactos"
                        + " inner join utilizadores"
                        + " on utilizadores.idutilizador = contactos.idutilizador"
                        + " inner join tipocontacto"
                        + " on tipocontacto.idtipocontacto = contactos.idcontacto"
                        + " where username = '"+nome+"'";
            
           ResultSet rs2 = stmt.executeQuery(sql2);
           while(rs2.next()){
               table +="<tr>";
                for(int i =1;i<4;i++){
                 table+= "<td>"
                         +rs2.getString(i+1)
                         + "</td>"; 
                }
                table +="<td><a href=\"contacto.jsp?idcontacto="+rs2.getString(1)+"\">Editar</a></td></tr>";
                  
           }
          
           }else{
                 response.sendRedirect("index.jsp");
                   }
           
             
       %>
        <table align="center" style="text-align: center">
            <tr> Bem vindo,<%=nome%> </tr>
            <tr style="font-size: 25px; text-align: left; width: 200px">
                <td><p>Lista de Contactos:</p></td>
            </tr>
            <tr style="font-size: 25px;">
                <th>Nome</th>
                <th>Contacto</th>
                <th>Tipo</th>
                <td>&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;</td>
            </tr>
            <%=table%>
        </table>
        <form action="contacto.jsp">
        <div align="center"><input type="submit" value="Novo" style="float:left;"></div>
        </form>
        <%
            
            stmt.close();
            con.close();
         } catch(SQLException ex) {
            System.err.println("SQLException: " + ex.getMessage());
        }
        %>
    </body>
</html>
