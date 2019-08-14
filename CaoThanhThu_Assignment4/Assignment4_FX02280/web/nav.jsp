<%-- 
    Document   : nav
    Created on : 15-Jul-2019, 10:19:46 AM
    Author     : CaoThu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Clean Blog - Start Bootstrap Theme</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

        <!-- Custom styles for this template -->
        <link href="css/clean-blog.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navigation -->
        <c:set var="login" value="${sessionScope.FULLNAME}" />
        <c:set var="role" value="${sessionScope.ROLE}" />
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="ShowPostServlet">Cao Thanh Thư</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="ShowPostServlet">Home</a>
                        </li>

                        <li class="nav-item">
                            <c:if test="${not empty login}">
                                <c:if test="${role == 'author'}">
                                    <a class="nav-link" href="author.jsp">Create New Post</a>
                                </c:if>
                                <c:if test="${role == 'reader'}">
                                    <a class="nav-link" href="notiForReader.jsp">Create New Post</a>
                                </c:if>
                            </c:if>
                            <c:if test="${empty login}">
                                <a class="nav-link" href="login.jsp">Create New Post</a>
                            </c:if>
                        </li>

                        <li class="nav-item">
                            <c:if test="${not empty login}">
                                <a class="nav-link">${login}</a>
                            </c:if>
                            <c:if test="${empty login}">
                                <a class="nav-link" href="login.jsp#formlogin">Login</a>
                            </c:if>
                        </li>
                        <li class="nav-item">
                            <c:if test="${not empty login}">
                                <a class="nav-link" href="LogoutServlet">Logout</a>
                            </c:if>
                            <c:if test="${empty login}">
                                <a class="nav-link" href="signup.jsp">Sign Up</a>
                            </c:if>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/clean-blog.min.js"></script>
    </body>
</html>
