<%-- 
    Document   : register
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register</h1>
        <c:set var="errors" value="${requestScope.REGISTER_ERROR}"/>
        <form action="register" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Username <span style ="color:red;">*</span>:</td>
                        <td>
                            <input type="text" name="txtCustID" value="${param.txtCustID}" maxlength="10" 
                                   required="true"/><br/>
                            <c:if test="${not empty errors.idExistErr}">
                                <font color="red">
                                ${errors.idExistErr}
                                </font>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>Password <span style ="color:red;">*</span>:</td>
                        <td>
                            <input type="password" name="txtPassword" required="true" 
                                   title="Password must be 6 to 30 characters long and have at 
                                   least one uppercase character, one lower case and one digit. Ex:pwdRe4llyStrong"
                                   pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^ ]{6,30}$"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Confirm password <span style ="color:red;">*</span>:</td>
                        <td>
                            <input type="password" name="txtConfirm" required="true"/><br/>
                            <c:if test="${not empty errors.confirmErr}">
                                <font color="red">
                                ${errors.confirmErr}
                                </font>
                            </c:if>          
                        </td>
                    </tr>
                    <tr>
                        <td>First Name <span style ="color:red;">*</span>:</td>
                        <td>
                            <input type="text" name="txtFirstName" value="${param.txtFirstName}" 
                                   required="true" maxlength="15" title="First name must not be over 15 chars"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Middle Name:</td>
                        <td>
                            <input type="text" name="txtMidName" value="${param.txtMidName}" 
                                   maxlength="15" title="Middle Name must not be over 15 chars"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name <span style ="color:red;">*</span>:</td>
                        <td>
                            <input type="text" name="txtLastName" value="${param.txtLastName}" 
                                   required="true" maxlength="15" title="Last Name must not be over 15 chars"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Address <span style ="color:red;">*</span>:</td>
                        <td>
                            <textarea name="txtAddress" rows="5" cols="22" value="${param.txtAddress}" required="true"
                                      maxlength="250" title="Address must not be over 250 chars">
                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone <span style ="color:red;">*</span>:</td>
                        <td>
                            <input type="text" name="txtPhone" value="${param.txtPhone}" required="true" 
                                   pattern="\d{9,11}" title="Phone must be 9 to 11 numbers"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Register" name="action" />
                            <input type="reset" value="Reset" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <a href="login.GOTOJSP">Back to login</a>
    </body>
</html>
