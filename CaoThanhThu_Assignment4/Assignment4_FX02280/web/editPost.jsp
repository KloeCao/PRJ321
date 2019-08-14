<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Edit</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

        <!-- Custom styles for this template -->
        <link href="css/clean-blog.min.css" rel="stylesheet">
        <script src="ckeditor/ckeditor.js"></script>


    </head>

    <body>

        <%@include file='nav.jsp'%>


        <!-- Page Header -->
        <header class="masthead" style="background-image: url('img/about-bg.jpg')">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="page-heading">
                            <h1>Edit By Yourself</h1>
                            <c:if test="${empty errors}">
                                <span class="subheading">Share your experience with the world</span>
                            </c:if>
                            <c:if test="${not empty errors}">
                                <span>
                                    <c:if test="${not empty errors.haveTrouble}">
                                        <p class="help-block text-danger">${errors.haveTrouble}</p>
                                    </c:if>
                                </span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <form id="contactForm" novalidate 
                          name="action" action="MainController" method="POST">
                        <c:set var="errors" value="${requestScope.EDIT_ERROR}"/>
                        <c:set var="dto" value="${sessionScope.EDIT_DIRECT}"/>                    
                        <c:if test="${not empty dto}">
                            <input type="hidden" name="idPost" value="${dto.id}" />
                            <!--Title-->
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Title</label>
                                    <input type="text" class="form-control" 
                                           placeholder="Title" id="name" 
                                           value="${dto.title}"
                                           name="txtTitle"
                                           >
                                    <c:if test="${not empty errors.titleError}">
                                        <p class="help-block text-danger">${errors.titleError}</p>
                                    </c:if>
                                </div>
                            </div>
                            <!--Topic-->
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <label>Topic</label>
                                    <input type="text" class="form-control" 
                                           placeholder="Topic" id="name" 
                                           value="${dto.topic}"
                                           name="txtTopic"
                                           >
                                    <c:if test="${not empty errors.topicError}">
                                        <p class="help-block text-danger">${errors.topicError}</p>
                                    </c:if>
                                </div>
                            </div>

                            <!--Post-->
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls">
                                    <textarea name="txtPost" 
                                              id="name"
                                              value="${dto.post}"
                                              class="form-control" 
                                              >
                                    </textarea>
                                    <script>CKEDITOR.replace('txtPost');</script>
                                    <c:if test="${not empty errors.postError}">
                                        <p class="help-block text-danger">${errors.postError}</p>
                                    </c:if>
                                </div>
                            </div>

                            <!--Publish-->
                            <p><input type="checkbox" name="chkPublish" value="${dto.publish}" />Publish this post</p>
                            </c:if>

                    <!--Button-->
                    <input type="submit" value="Submit Edit" name="action" class="btn btn-primary" id="sendMessageButton"/>
                </form>
            </div>
        </div>
    </div>

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
