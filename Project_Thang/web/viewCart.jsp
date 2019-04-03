<%-- 
    Document   : viewCart
    Author     : User
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
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
        <h1>Cart</h1>
        <c:set var="cart" value="${sessionScope.CART}" />
        <c:if test="${not empty cart}">
            <c:set var="list" value="${sessionScope.PRODUCT_BUY}" />
            <c:if test="${not empty list}">
                <form action="update">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Name</th>
                                <th>Brand Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="total" value="0" />
                            <c:forEach var="item" items="${list}" varStatus="number">
                                <tr>
                                    <td>
                                        ${number.count}
                                    </td>
                                    <td>
                                        ${item.name}
                                    </td>
                                    <td>
                                        ${item.brandName}
                                    </td>
                                    <td>
                                        <c:set var="quantityBuy" value="${item.quantityBuy}"/>
                                        <input type="text" name="txtQBuy" pattern="\d" 
                                               title="Must be a number" value="${item.quantityBuy}" />
                                    </td>
                                    <td>
                                        <c:set var="unitPrice" value="${item.price}"/>
                                        $<fmt:formatNumber type="number" pattern="###,###" value="${item.price}" />
                                    </td>
                                    <td>
                                        <c:set var="sum" value="${quantityBuy * unitPrice}" />
                                        $<fmt:formatNumber type="number" pattern="###,###" value="${sum}"/>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="isBuy" value="${item.watchID}" />
                                    </td>
                                </tr>
                            <input type="hidden" name="txtID" value="${item.watchID}" readonly="readonly" disabled="disabled" />
                            <c:set var="total" value="${total + sum}" />
                        </c:forEach>
                        </tbody>
                    </table>
                    <h3>Total: $<fmt:formatNumber type="number" pattern="###,###" value="${total}"/></h3><br/>

                    <a href="viewCheckOut">Check out</a>
                    <input type="submit" value="Update" name="action" />
                    <input type="submit" value="Remove" name="action" />
                </form>
            </c:if>
            <c:if test="${empty list}">
                <h2 style="text-align: center; color: red;">No any item in your cart.</h2>
            </c:if>
        </c:if>
        <c:if test="${empty cart}">
            <h2 style="text-align: center; color: red;">No cart exists.</h2>
        </c:if>
    </body>
</html>
