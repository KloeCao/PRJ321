<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Home - All Posts</title>

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
        <%@include file='nav.jsp'%>
        <!-- Page Header -->
        <c:set var="login" value="${sessionScope.FULLNAME}" />
        <header class="masthead" style="background-image: url('img/home-bg.jpg')">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="site-heading">
                            <c:if test="${empty login}">
                                <h1>Welcome My Blog</h1>
                                <span class="subheading">Where to share experiences</span>
                            </c:if>
                            <c:if test="${not empty login}">
                                <h1>Welcome back, ${login}!</h1>
                                <span class="subheading">Where to share experiences</span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <c:set var="allPost" value="${requestScope.SHOWALL}" />
        <c:if test="${not empty allPost}">
            <c:forEach var="dto" items="${allPost}">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-10 mx-auto">
                            <div class="post-preview">
                                <form name="action" action="MainController">
                                    <input type="hidden" name="idPost" value="${dto.id}" />
                                    <h2 class="post-title">
                                        <c:url value="DetailServlet" var="viewDetail">
                                            <c:param name="idPost" value="${dto.id}"/>
                                        </c:url>
                                        <a href="${viewDetail}">${dto.title}</a>
                                    </h2>
                                    <h4 class="post-subtitle">
                                        ${dto.topic}
                                    </h4>
                                    <input type="hidden" name="userPost" value="${dto.username}" />
                                    <input type="submit" value="Edit" name="action"/>
                                </form>

                                <p class="post-meta">Posted by
                                    <font color="black">${dto.username}</font>
                                    on ${dto.date}<br/>
                                    Status: 
                                    <font color="yellowdark">
                                    <c:if test="${dto.publish}">published</c:if>
                                    <c:if test="${!dto.publish}">draft</c:if>
                                        </font>
                                    </p>
                                </div>
                                <hr>
                            </div>
                        </div>
                    </div>

            </c:forEach>
        </c:if>
        <hr>
        <%@include file='footer.jsp'%>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/clean-blog.min.js"></script>

    </body>

</html>
