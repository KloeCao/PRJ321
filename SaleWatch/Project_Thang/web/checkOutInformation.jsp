<%-- 
    Document   : checkOutInformation
    Author     : User
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check out Information</title>
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
        <h1>Check out Information</h1>
        <c:set var="cusName" value="${requestScope.CUSNAME}"/>
        <c:set var="infoCus" value="${requestScope.INFOCUS}"/>
        <table border="0">
            <tbody>
                <tr>
                    <td><strong>Customer ID:</strong></td>
                    <td>${infoCus.custID}</td>
                </tr>
                <tr>
                    <td><strong>Customer Name:</strong></td>
                    <td>${cusName}</td>
                </tr>
                <tr>
                    <td><strong>Address:</strong></td>
                    <td>${infoCus.address}</td>
                </tr>
                <tr>
                    <td><strong>Phone:</strong></td>
                    <td>${infoCus.phone}</td>
                </tr>
            </tbody>
        </table>

        <c:set var="cart" value="${sessionScope.CART}" />
        <c:if test="${not empty cart}">
            <form action="checkOut">
                <c:set var="list" value="${sessionScope.PRODUCT_BUY}" />
                <c:if test="${not empty list}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Name</th>
                                <th>Brand Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="total" value="0" />
                            <c:set var="row" value="0"/>
                            <c:forEach var="item" items="${list}" varStatus="number">
                                <tr>
                                    <td>
                                        ${number.count}
                                        <c:set var="row" value="${row + 1}"/>
                                    </td>
                                    <td>
                                        <input type="text" name="txtName${number.count}" value="${item.name}" readonly="readonly" /> 
                                    </td>
                                    <td>
                                        <input type="text" name="txtBrandName${number.count}" value="${item.brandName}" readonly="readonly" /> 
                                    </td>
                                    <td>
                                        <c:set var="quantityBuy" value="${item.quantityBuy}"/>
                                        <input type="text" name="txtQBuy${number.count}" pattern="\d" 
                                               title="Must be a number" value="${item.quantityBuy}" />
                                    </td>
                                    <td>
                                        <c:set var="unitPrice" value="${item.price}"/>
                                        $<input type="text" name="txtPrice${number.count}" 
                                                value="<fmt:formatNumber type="number" pattern="###,###" value="${item.price}" />" 
                                                readonly="readonly" />
                                    </td>
                                    <td>
                                        <c:set var="sum" value="${quantityBuy * unitPrice}" />
                                        $<input type="text" name="txtTotal${number.count}" 
                                                value="<fmt:formatNumber type="number" pattern="###,###" value="${sum}"/>" 
                                                readonly="readonly" />
                                    </td>
                                </tr>
                            <input type="hidden" name="txtID${number.count}" value="${item.watchID}" readonly="readonly" />
                            <c:set var="total" value="${total + sum}" />
                        </c:forEach>
                        <input type="hidden" name="txtRow" value="${row}" readonly="readonly" />
                        </tbody>
                    </table>
                    <h3>Total:
                        $<fmt:formatNumber type="number" pattern="###,###" value="${total}"/></h3><br/>
                    <input type="hidden" name="txtTotal" value="${total}" readonly="readonly" />
                </c:if>
                Address Delivery:<br>
                <textarea name="txtDelivery" rows="5" cols="50"></textarea><br/>
                <input type="submit" value="Confirm" name="action" />
            </form>
        </c:if>
    </body>
</html>
