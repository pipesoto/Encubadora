<%-- 
    Document   : admin
    Created on : 21-jun-2018, 20:32:34
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

    <body background="imagen/fondo2.jpg">
        <nav>
            <jsp:include page="barnav.jsp" />
        </nav>
        <div class="container"><br><br>
            <div class="row grey-text text-darken-1">
                <div class="col s8 offset-s2 m6 offset-m3 l6 offset-l3">
                    <div class="card-panel z-depth-5">
                        <div class="row">
                            <div class="center-align hide-on-small-only">
                                <form action="listar" method="post">
                                    <button name="bt" value="1" type="submit" class="btn red darken-2">
                                        Agregar Documentación
                                    </button>
                                    
                                    <br>
                                </form>
                            </div>
                            <div class="center-align hide-on-med-and-up">
                                <form action="listar" method="post">
                                    <button name="bt" value="1" type="submit" class="btn red darken-2">
                                        Agregar
                                    </button>
                                    
                                    <br>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="center-align">
                                <form action="evaluar" method="post">
                                    <button name="bt" value="1" type="submit" class="btn red darken-2">
                                        Evaluar Proyectos
                                    </button>
                                    <br>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="center-align">
                                <form action="finalizar" method="post">
                                    <button name="bt" value="1" type="submit" class="btn red darken-2">
                                        Finalizar Proceso
                                    </button>
                                    <br>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- FIN DEL ROW DENTRO ARTICULOS PRINCIPALES -->
    </body>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script>
        $(function () {
            $(".button-collapse").sideNav();
        });
    </script>
</html>

