<%-- 
    Document   : error
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <!--Menu-->
        <a href="search">Search</a>
        <a href="viewCart">Cart</a>
        <!-------------->
                <br/>

        <font color="blue">
        Welcome, ${sessionScope.NAME} 
        </font>
        <h1>ERROR</h1>
        If you have a trouble, <a href="contact.GOTOJSP">contact</a> us!
    </body>
</html>
