<%-- 
    Document   : regemprendedor
    Created on : 21-jun-2018, 22:01:44
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
                <div class="col s12 m8 offset-m2 l6 offset-l3">              
                    <form class="col s12 card-panel hoverable" action="emprende" method="post">
                        <h5 class="center-align"><b>Registro de Emprendedor</b></h5>
                        <c:if test="${not empty requestScope.msg}">
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">assignment_ind</i>
                                <input placeholder="Inserte su rut:" data-length="10" id="rut" name="rut" type="text" class="validate" required>
                                <label for="rut">Rut:</label>
                                <span class="helper-text red-text"  >${requestScope.msg}</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">account_circle</i>
                                <input placeholder="Inserte su nombre completo:" id="nombre" name="nombre" type="text" class="validate" required value="${requestScope.nombre}">
                                <label for="nombre">Nombre y Apellido:</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">business_center</i>
                                <input placeholder="Inserte su profesion:" id="profesion" name="profesion" type="text" class="validate"  required value="${requestScope.profesion}">
                                <label for="profesion">Profesión:</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">email</i>
                                <input id="email" placeholder="Inserte su email:" type="email" class="validate" required value="${requestScope.email}">
                                <label for="email" data-error="Formato incorrecto" data-success="Formato Correcto">Email:</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <button name="btnReg" value="1" type="submit" class="btn right red">Siguiente</button>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${empty requestScope.msg}">
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">assignment_ind</i>
                                <input placeholder="Inserte su rut:" data-length="10" id="rut" name="rut" type="text" required class="validate">
                                <label for="rut">Rut:</label>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">account_circle</i>
                                <input placeholder="Inserte su nombre completo:" id="nombre" name="nombre" type="text" required class="validate">
                                <label for="nombre">Nombre y Apellido:</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">business_center</i>
                                <input placeholder="Inserte su profesion:" id="profesion" name="profesion" type="text" required class="validate">
                                <label for="profesion">Profesión:</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12"><i class="material-icons prefix">email</i>
                                <input id="email" placeholder="Inserte su email:" type="email" required class="validate">
                                <label for="email" data-error="Formato incorrecto" data-success="Formato Correcto">Email:</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <button name="btnReg" value="1" type="submit" class="btn right red">Siguiente</button>
                            </div>
                        </div>
                        </c:if>
                    </form>
                </div>
            </div>
        </div> <!-- FIN DEL ROW DENTRO ARTICULOS PRINCIPALES -->
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