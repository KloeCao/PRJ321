<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login WING - Let's fly away</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="signupForm/fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="signupForm/css/styleReg.css">
    </head>
    <body style="background-image: url(images/backgroundHomePage.jpg)">

        <div class="main">

            <section class="signup">
                <!-- <img src="images/signup-bg.jpg" alt=""> -->
                <div class="container">
                    <div class="signup-content">
                        <form action="AccountMainController" method="POST" id="signup-form" class="signup-form">
                            <h2 class="form-title">REGISTRATION FORM</h2>
                            <div class="form-group">
                                <input type="text" class="form-input" name="username" id="name" placeholder="USERNAME" required="true"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-input" name="fullname" id="name" placeholder="FULL-NAME" required="true"/>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-input" name="email" id="email" placeholder="EMAIL" required="true"/>
                            </div>
                            <div class="form-group">
                                <input type="text" pattern="\d{9,11}" class="form-input" name="phone" id="email" placeholder="PHONE" required="true"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-input" name="password" id="password" placeholder="PASSWORD" required="true"/>
                                <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-input" name="confirm" id="re_password" placeholder="CONFIRM PASSWORD" required="true"/>
                            </div>
                            <c:if test="${not empty requestScope.ERROR}">
                                <div class="form-group">
                                    <span style="color: red" class="form-input" id="re_password" value="${requestScope.ERROR.confirm}"></span>
                                    <span style="color: red" class="form-input" id="re_password" value="${requestScope.ERROR.username}"></span>
                                </div>
                            </c:if>
                            <div class="form-group">
                                <button type="submit" name="action" id="submit" class="form-submit" value="SignUp">REGISTRATION</button>
                            </div>
                        </form>
                        <p class="loginhere">
                            Have an account ? <a href="login.jsp" class="loginhere-link">Login</a>
                        </p>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
        <script src="signupForm/vendor/jquery/jquery.min.js"></script>
        <script src="signupForm/js/mainReg.js"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>