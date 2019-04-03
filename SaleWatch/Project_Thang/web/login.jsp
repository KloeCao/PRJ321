<%-- 
    Document   : index
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login Page</h1>
        <form action="login" method="POST">
            Username: <input type="text" name="txtUsername" value="" required="true"/><br/>
            Password: <input type="password" name="txtPassword" value="" required="true"/><br/>
            <input type="submit" value="Login" name="action" />
            <input type="reset" value="Reset" />
        </form>
         Do not you have an account?
        <a href="register.GOTOJSP">Register now!</a>
    </body>
</html>
