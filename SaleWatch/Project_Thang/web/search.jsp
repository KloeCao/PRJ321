<%-- 
    Document   : search
    Author     : User
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
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
        <h1>Search Watch</h1>
        <form action="search">
            Min Value: <input type="text" name="txtMinValue" value="${requestScope.MIN}" required="true" 
                              pattern="[0-9]*\.?[0-9]*" title="Price must be number. Ex: 100 or 100.0"/><br/>
            Max Value: <input type="text" name="txtMaxValue" value="${requestScope.MAX}" required="true" 
                              pattern="[0-9]*\.?[0-9]*" title="Price must be number. Ex: 100 or 100.0"/><br/>
            <input type="submit" value="Search" name="action" />
            <input type="reset" value="Reset" />
        </form>
        <a href="viewCart">View Cart</a>
        <c:if test="${not empty param.txtMinValue || not empty param.txtMaxValue}">
            <c:set var="result" value="${requestScope.LIST_SEARCH}"/>
            <c:if test="${not empty result}" var="search">
                <form action="addToCart" method="POST">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Name</th>
                                <th>Brand name</th>
                                <th>Quantity</th>
                                <th>Price </th>
                                <th>Description</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${result}" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${dto.name}</td>
                                    <td>${dto.brandName}</td>
                                    <td>${dto.quantity}</td>
                                    <td>
                                        $<fmt:formatNumber type="number" pattern="###,###" value="${dto.price}"/>
                                    </td>
                                    <td>${dto.description}</td>
                                    <td>
                                        <input type="checkbox" name="isBuy" value="${dto.watchID}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <input type="hidden" name="txtMinValue" value="${param.txtMinValue}"/>
                    <input type="hidden" name="txtMaxValue" value="${param.txtMaxValue}"/>
                    <input type="submit" value="Add Selected Items to Your Cart" name="action" />
                </form>
                <!--                <a href="viewCart">View Cart</a>-->
            </c:if>
            <c:if test="${!search}">
                <font color="red">
                <h2>No results. Try another price.</h2>
                </font>
            </c:if>
        </c:if>
    </body>
</html>
