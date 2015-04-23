<%-- 
    Document   : registo
    Created on : Apr 16, 2015, 10:36:32 AM
    Author     : VascoF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="avisos.jsp">
        <table align="center">
            <tr>
                <th>Novo registo</th>
            </tr>
            <tr>
                <td>
                    Username:
                </td>
                <td>
                    <input type="text" width="30px"/>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <input type="text" width="30px"/>
                </td>
            </tr>
            <tr>
                <td>
                    Nome:
                </td>
                <td>
                    <input type="text" width="30px"/>
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
    </body>
</html>
