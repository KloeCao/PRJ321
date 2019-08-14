<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <c:set var="detail" value="${requestScope.DETAIL}"/>

        <title>${detail.title}</title>

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
        <header class="masthead" style="background-image: url('img/post-bg.jpg')">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="post-heading">
                            <c:if test="${not empty detail}">
                                <h1>${detail.title}</h1>
                                <h2 class="subheading">${detail.topic}</h2>
                                <span class="meta">Posted by
                                    <font color="yellowdark">${detail.username}</font>
                                    on ${detail.date}</span>
                                <font color="yellowdark">
                                <c:if test="${detail.publish}">published</c:if>
                                <c:if test="${!detail.publish}">draft</c:if>
                                    </font>
                            </c:if>
                            <c:if test="${empty detail}">
                                <h1>Sorry...<br/>Something wrong!</h1>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Post Content -->
        <article>
            <div class="container">
                <div class="row">
                    <c:if test="${not empty detail}">
                        <div class="col-lg-8 col-md-10 mx-auto">
                            ${detail.post}
                        </div>
                    </c:if>
                </div>
            </div>
        </article>

        <hr>

        <!-- Footer -->
        <%@include file='footer.jsp'%>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/clean-blog.min.js"></script>

    </body>

</html>
