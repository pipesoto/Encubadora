<%-- 
    Document   : index
    Created on : 21-06-2018, 19:24:21
    Author     : marcos alexander
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <title>Inicio Emprende</title>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
            <nav>
                <jsp:include page="barnav.jsp" />
            </nav>
        </div>
        <div class="parallax-container">
            <div class="parallax"><img class="responsive-img" src="imagen/emprende1.jpg"></div>
        </div>
        <div class="section white">
            <div class="row container">
                <h2 class="header">Emprende con Inacap</h2>
                <h4 class="grey-text text-darken-3 lighten-3">Aprovecha esta oportunidad que te ofrece Inacap!</h4>
                <h4>¡¡Apresurate y sube tu projecto!!</h4>
            </div>
        </div>
        <div class="parallax-container">
            <div class="parallax"><img src="imagen/emprende2.png" class="responsive-img"></div>
        </div>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script>
            $(function () {
                $(".button-collapse").sideNav();
            });
            $(document).ready(function () {
                $('.parallax').parallax();
            });
        </script>
        <footer>
            <jsp:include page="footer.jsp" />
        </footer>
    </body>
</html>
