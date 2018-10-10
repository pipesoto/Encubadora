<%-- 
    Document   : regproyecto
    Created on : 25-jun-2018, 11:23:18
    Author     : 2guzm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <body background="imagen/fondo1.jpg">
        <nav>
            <jsp:include page="barnav.jsp" />
        </nav>
        <div class="container">
            <div class="row grey-text text-darken-1">
                <div class="col s6 offset-s3">
                    <form class="col s12 card-panel hoverable" action="save" method="post">
                        <h5 class="center-align"><b>Registro de Proyecto</b></h5>
                        <input id="rut" type="hidden" name="rut" value="${param.rut}">
                        <input id="nombre" type="hidden" name="nombre"  value="${param.nombre}">
                        <input id="profesion" type="hidden" name="profesion"  value="${param.profesion}">
                        <input id="email" type="hidden" name="email"  value="${param.email}">
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">account_circle</i>
                                <input placeholder="Inserte el nombre del proyecto" id="nompro" name="nompro" type="text" required class="validate">
                                <label for="nompro">Nombre Proyecto</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">assignment</i>
                                <label for="descpro">Descripción del Proyecto:</label>
                                <textarea name="descpro" class="materialize-textarea validate" maxlength="150" required placeholder="Agrega una breve descripción de tu proyecto..."></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">attach_money</i>
                                <input  class="validate" id="monto" placeholder="Inserte monto de inversión" required step="10000" min="10000" max="10000000" type="number" name="monto">
                                <label for="monto" data-error="Monto permitido entre $10.000 y $10.000.000" data-success="Perfecto!">Monto de Inversión:</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">timer</i>
                                <input id="tiempo" placeholder="Inserte tiempo que demorará el desarrollo" type="number" min="3" max="60" name="tiempo" class="validate" required>
                                <label for="tiempo" data-error="Tiempo permitido entre 3 y 60 meses." data-success="Perfecto!">Tiempo del Desarrollo (en meses):</label><br>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                            <button name="bt" value="1" type="submit" class="btn right red">
                                Terminar Registro
                            </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div> 
        </div>
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