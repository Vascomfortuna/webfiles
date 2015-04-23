


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
            
            String id = request.getParameter("idcontacto");
            String sql = "Select contactos.idcontacto,contactos.NomeContacto, contactos.Contacto, contactos.idTipocontacto"
                        + " from contactos"
                        + " inner join utilizadores"
                        + " on utilizadores.idutilizador = contactos.idutilizador"
                        + " inner join tipocontacto"
                        + " on tipocontacto.idtipocontacto = contactos.idcontacto"
                        + " where idcontacto = '"+id+"'";
            
            con = DriverManager.getConnection(url,"root","");
            Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql);
             rs.next();
             String nome = rs.getString(2);
             String contacto = rs.getString(3);
             String tipo = rs.getString(4);
       %>
       <form action="avisos.jsp?idcont=<%=id%>" method="POST">
        <table align="center">
            <tr>
                <td>(Novo ou editar)</td>
            </tr>
            <tr>
                <td>
                    Nome:
                </td>
                <td>
                    <input type="text" width="30px" value="<%=nome%>" name="editNome"/>
                </td>
            </tr>
            <tr>
                <td>
                    Contacto:
                </td>
                <td>
                    <input type="text" width="30px" value="<%=contacto%>" name="editContacto"/>
                </td>
            </tr>
            <tr>
                <td>
                    Tipo:<%=tipo%>
                </td>
                <td>
                    <select  name="editTipo"  >  
                            
                        <option value="1" <%if(tipo.equals("1")){%>selected<%}%>>Telefone</option>
                            <option value="2" <%if(tipo.equals("2")){%>selected<%}%>>Telemóvel</option>
                            <option value="3" <%if(tipo.equals("3")){%>selected<%}%>>Email</option>
                            <option value="4" <%if(tipo.equals("4")){%>selected<%}%>>Fax</option>     
                        </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Guardar"/>
                </td>
                <td>
                    <input type="submit" value="Cancelar"/>
                </td>
            </tr>
        </table>
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
