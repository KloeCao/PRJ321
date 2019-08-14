<%-- 
    Document   : signup
    Created on : 15-Jul-2019, 8:51:04 PM
    Author     : CaoThu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
    </head>
    <body>
        <%@include file='nav.jsp'%>
        <c:set var="errors" value="${requestScope.SIGNUP_ERROR}"/>
        <header class="masthead" style="background-color: black">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="site-heading">
                            <h1>Sign Up</h1>
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
                    <p>Please enter your information to sign-up an account!</p>
                    <form id="contactForm" novalidate 
                          name="action" action="MainController" method="POST">
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls">
                                <label>Fullname:</label>
                                <input type="text" class="form-control" 
                                       placeholder="Fullname" id="name" 
                                       value="${param.txtName}"
                                       name="txtName"
                                       >
                                <c:if test="${not empty errors.userError}">
                                    <p class="help-block text-danger">${errors.nameError}</p>
                                </c:if>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls">
                                <label>Username</label>
                                <input type="text" class="form-control" 
                                       placeholder="Username" id="name" 
                                       value="${param.txtUser}"
                                       name="txtUser"
                                       >
                                <c:if test="${not empty errors.userError}">
                                    <p class="help-block text-danger">${errors.userError}</p>
                                </c:if>
                                <c:if test="${not empty errors.userExited}">
                                    <p class="help-block text-danger">${errors.userExited}</p>
                                </c:if>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls">
                                <label>Password</label>
                                <input type="password" class="form-control" 
                                       placeholder="Password" 
                                       name="txtPwd"
                                       id="name" 
                                       >
                                <c:if test="${not empty errors.pwdError}">
                                    <p class="help-block text-danger">${errors.pwdError}</p>
                                </c:if>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls">
                                <label>Confirm Password</label>
                                <input type="password" class="form-control" 
                                       placeholder="Confirm Password" 
                                       name="txtConfirm"
                                       id="name" 
                                       >
                                <c:if test="${not empty errors.confirmError}">
                                    <p class="help-block text-danger">${errors.confirmError}</p>
                                </c:if>
                            </div>
                        </div>

                        <div class="control-group">
                            <label>Type Account:</label>
                            <div class="form-group floating-label-form-group controls">
                                <label>Type Account:</label>
                                <select name="role" class="form-control">
                                    <option value="author">Writer</option>
                                    <option value="reader">Read Only</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="form-group">
                            <input type="submit" value="Sign Up" name="action" class="btn btn-primary" id="sendMessageButton" />
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <hr>
        <%@include file='footer.jsp'%>
    </body>
</html>
