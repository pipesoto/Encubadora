<%-- 
    Document   : listarProyectos
    Created on : 25-jun-2018, 12:36:03
    Author     : 2guzm
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.beans.IncubadoraLocal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! IncubadoraLocal incuba;%>
<%
    InitialContext ctx = new InitialContext();
    incuba = (IncubadoraLocal) ctx.lookup("java:global/Incubadora/Incubadora-ejb/Incubadora!cl.beans.IncubadoraLocal");
%>
<c:set var="incuba" value="<%= incuba%>" scope="page" />
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body background="imagen/fondo4.jpg" width="100%" height="100">
        <nav>
            <jsp:include page="barnav.jsp" />
        </nav>
        <div class="container"><br><br>
                <div class="row">
                    <table class="bordered highlight centered highlight white">
                        <tr>
                            <td valign="middle"><b>Nombre del Proyecto</b></td>
                            <td><b>Emprendedor</b></td>
                            <td><b>Tiempo de Desarrollo</b></td>
                            <td><b>Monto de Inversión</b></td>
                            <td><b>Documentación</b></td>                          
                        </tr>
                        <c:forEach items="${incuba.proyecto}" var="p">
                            <tr>
                                <td>${p.nombre}</td>
                                <c:forEach items="${encuba.emprendedor}" var="e">
                                    <c:if test="${e.rut == p.rut}">
                                    <td>${e.nombre}</td>
                                    </c:if>
                                </c:forEach>    
                                <td>${p.tiempo} meses</td>
                                <td>$ ${p.monto}</td>
                                <c:choose>
                                    <c:when test="${p.documentacion}">
                                        <td><span>SI</span></td>   
                                    </c:when>    
                                    <c:otherwise>
                                        <td><span>NO</span>
                                            <a href="documentar.do?rut=${p.rut}" class="btn-floating red">
                                                <i class="material-icons">assignment</i>
                                            </a>
                                        </td>   
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
        </div><br><br>
    </body>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script>
        $(function () {
            $(".button-collapse").sideNav();
        });
    </script>
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</html>

