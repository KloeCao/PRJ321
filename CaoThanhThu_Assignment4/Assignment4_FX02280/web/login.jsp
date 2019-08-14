<%-- 
    Document   : login
    Created on : 15-Jul-2019, 1:34:06 PM
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

        <title>Login</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

        <!-- Custom styles for this template -->
        <link href="css/clean-blog.min.css" rel="stylesheet">
        <script>
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange = function () {
                window.location.hash = "no-back-button";
            }
        </script>
    </head>
    <body>
        <%@include file='nav.jsp'%>
        <c:set var="errors" value="${requestScope.LOGIN_ERROR}"/>

        <header class="masthead" style="background-color: black">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="site-heading">
                            <h1>Login</h1>
                            <span>
                                <c:if test="${not empty errors.haveTrouble}">
                                    <p class="help-block text-danger">${errors.haveTrouble}</p>
                                </c:if>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container" id="formlogin">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <c:if test="${not empty errors.userPwdWrong}">
                        <p class="help-block text-danger">${errors.userPwdWrong}</p>
                    </c:if>
                    <p>Please enter your Username and Password to login page!</p>
                    <form id="contactForm" name="action" action="MainController" method="POST">

                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls">
                                <label>Username</label>
                                <input type="text" class="form-control" 
                                       placeholder="Username" id="name" 
                                       name="txtUser"
                                       required data-validation-required-message="Please enter your name.">
                                <c:if test="${not empty errors.userError}">
                                    <p class="help-block text-danger">${errors.userError}</p>
                                </c:if>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls">
                                <label>Password</label>
                                <input type="password" class="form-control" 
                                       placeholder="Password" 
                                       name="txtPwd"
                                       id="name" required data-validation-required-message="Please enter your email address.">
                                <c:if test="${not empty errors.pwdError}">
                                    <p class="help-block text-danger">${errors.pwdError}</p>
                                </c:if>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="form-group">
                            <input type="submit" value="Login" name="action" class="btn btn-primary" id="sendMessageButton" />
                            or 
                            <a href="signup.jsp#formlogin" class="btn btn-primary" id="sendMessageButton">Sign Up</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <hr>
        <%@include file='footer.jsp'%>
    </body>
</html>
