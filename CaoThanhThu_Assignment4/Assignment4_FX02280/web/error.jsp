<%-- 
    Document   : success
    Created on : 15-Jul-2019, 9:31:33 PM
    Author     : CaoThu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <%@include file='nav.jsp'%>
        <!-- Page Header -->
        <header class="masthead" style="background-image: url('img/home-bg.jpg')">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="site-heading">
                            <h1>Error</h1>
                            <span class="subheading">
                                <c:set var="error" value="${requestScope.ERROR}"/>
                                ${error}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <%@include file='footer.jsp'%>
    </body>
</html>
