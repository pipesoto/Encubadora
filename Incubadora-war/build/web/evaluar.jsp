<%-- 
    Document   : evaluar
    Created on : 26-jun-2018, 19:13:48
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

    <body background="imagen/fondo4.jpg">
        <nav>
            <jsp:include page="barnav.jsp" />
        </nav>
        <div class="container"><br><br>
            <div class="row">
                <table class="bordered highlight centered highlight white">
                    <tr>
                        <td><b>Nombre del Proyecto</b></td>
                        <td><b>Emprendedor</b></td>
                        <td><b>Tiempo de Desarrollo</b></td>
                        <td><b>Monto de Inversión</b></td>
                        <td><b>Evaluación</b></td>                          
                    </tr>
                    <c:forEach items="${requestScope.listaProyectos}" var="p">
                        <c:choose>
                            <c:when test="${p.documentacion}">
                                <tr>
                                    <td>${p.nombre}</td>
                                    <c:forEach items="${incuba.emprendedor}" var="e">
                                        <c:if test="${e.rut == p.rut}">
                                        <td>${e.nombre}</td>
                                        </c:if>
                                    </c:forEach>    
                                    <td>${p.tiempo}<span> meses</span></td>
                                    <td>$ ${p.monto}</td>
                                    <c:choose>
                                        <c:when test="${p.nota>0}">
                                            <td valign="middle"><span>${p.nota}</span></td>   
                                                </c:when>    
                                                <c:otherwise>
                                            <td>
                                                <form action="nota.do" method="get">
                                                    <div class="input-field">
                                                        <input id="rut" type="hidden"  value="${p.rut}" name="rut">
                                                        <label for="" class="center-align" data-error="Las notas deben ser entre 1.0 y 7.0" 
                                                               data-success="Formato correcto">Nota:</label><br>
                                                        <input id="nota" type="number" min="1" max="7" step="1" placeholder="Agregue una nota a este proyecto" class="validate" minlength="1" data-length="1"  name="nota">
                                                        <button name="bt" value="1" type="submit" class="btn right">
                                                            Guardar
                                                        </button>
                                                    </div>
                                                </form>      
                                            </td>  
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                            </c:choose>
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
