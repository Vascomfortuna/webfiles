
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>JSP Page</title>
        <style>
            td{
                text-align: left;
            }
        </style>
    </head>
    <body>
          
        <form action="listacontactos.jsp" method="POST">
            <table align="center">
            <tr>
                <th style="text-align:center;">Login</th>
            </tr>
            <tr>
                <td>
                    Username:
                </td>
                <td>
                    <input type="text" width="30px" name="tbutilizador"/>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <input type="password" width="30px" name="tbpassword"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                   
                 <input type="submit" value="Entrar" style="float:right;"/>
                </td>
            </tr>
            <tr>
                <td>
                    Não é utilizador, <a href="registo.jsp">clique aqui.</a>
                </td>
            </tr>
        </table>
        </form>
         
    </body>
</html>
