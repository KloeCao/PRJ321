<%-- 
    Document   : header
    Created on : Feb 28, 2019, 3:13:42 PM
    Author     : Kim Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="fh5co-header-section" class="sticky-banner">
    <div class="container">
        <div class="nav-header">
            <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
            <h1 id="fh5co-logo"><a href="TourMainController"><i class=""><img src="images/WING_logo.png" height="30" width="30" /></i>WING</a></h1>
            <!-- START #fh5co-menu-wrap -->
            <nav id="fh5co-menu-wrap" role="navigation">
                <ul class="sf-menu" id="fh5co-primary-menu">
                    <li class="active"><a href="TourMainController">HOME</a></li>
                    <li>
                        <a href="#" class="fh5co-sub-ddown">VIETNAM TOUR</a>
                        <ul class="fh5co-sub-menu">
                            <li>
                                <c:url value="TourMainController" var="searchLink">
                                    <c:param name="action" value="SearchTourByCategory"/>
                                    <c:param name="categoryID" value="SVN"/>
                                </c:url>
                                <a href="${searchLink}">South Vietnam</a>
                            </li>
                            <li>
                                <c:url value="TourMainController" var="searchLink">
                                    <c:param name="action" value="SearchTourByCategory"/>
                                    <c:param name="categoryID" value="MVN"/>
                                </c:url>
                                <a href="${searchLink}">Central Vietnam</a>
                            </li>
                            <li>
                                <c:url value="TourMainController" var="searchLink">
                                    <c:param name="action" value="SearchTourByCategory"/>
                                    <c:param name="categoryID" value="NVN"/>
                                </c:url>
                                <a href="${searchLink}">North Vietnam</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="fh5co-sub-ddown">ABROAD TOUR</a>
                        <ul class="fh5co-sub-menu">
                            <li>
                                <c:url value="TourMainController" var="searchLink">
                                    <c:param name="action" value="SearchTourByCategory"/>
                                    <c:param name="categoryID" value="ASIA"/>
                                </c:url>
                                <a href="${searchLink}">Asia</a>
                            </li>
                            <li>
                                <c:url value="TourMainController" var="searchLink">
                                    <c:param name="action" value="SearchTourByCategory"/>
                                    <c:param name="categoryID" value="EURO"/>
                                </c:url>
                                <a href="${searchLink}">Europe</a>
                            </li>
                            <li>
                                <c:url value="TourMainController" var="searchLink">
                                    <c:param name="action" value="SearchTourByCategory"/>
                                    <c:param name="categoryID" value="AFR"/>
                                </c:url>
                                <a href="${searchLink}">Africa</a>
                            </li>
                            <li>
                                <c:url value="TourMainController" var="searchLink">
                                    <c:param name="action" value="SearchTourByCategory"/>
                                    <c:param name="categoryID" value="AME"/>
                                </c:url>
                                <a href="${searchLink}">America</a>
                            </li>
                            <li>
                                <c:url value="TourMainController" var="searchLink">
                                    <c:param name="action" value="SearchTourByCategory"/>
                                    <c:param name="categoryID" value="AUS"/>
                                </c:url>
                                <a href="${searchLink}">Australia</a>
                            </li>
                        </ul>
                    </li>
                    <c:if test="${sessionScope.ROLE == 'admin'}">
                        <li>
                            <a href="#" class="fh5co-sub-ddown">TASK</a>
                            <ul class="fh5co-sub-menu">
                                <li>
                                    <c:url value="insertTour.jsp" var="insertTour">
                                    </c:url>
                                    <a href="${insertTour}">Insert New Tour</a>
                                </li>
                                <li>
                                    <c:url value="TourMainController" var="editTour">
                                        <c:param name="action" value="GetTourForUpdate"/>
                                    </c:url>
                                    <a href="${editTour}">Update Existed Tour</a>
                                </li>
                                <li>
                                    <c:url value="customerOrder.jsp" var="getOrder">
                                    </c:url>
                                    <a href="${getOrder}">Update Order</a>
                                </li>
                                <li>
                                    <c:url value="OrderMainController" var="getOverDateOrder">
                                        <c:param name="action" value="GetOverDateOrder"/>
                                    </c:url>
                                    <a href="${getOverDateOrder}">Cancel Order</a>
                                </li>
                                <li>
                                    <a href="accountManagement.jsp">Account Management</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>

                    <li>
                        <c:if test="${not empty sessionScope.USERNAME}" var="test">
                            <a href="#" class="fh5co-sub-ddown">${sessionScope.FULLNAME} </a>
                            <ul class="fh5co-sub-menu">
                                <c:if test="${sessionScope.ROLE == 'user'}">
                                    <li>
                                        <c:url value="OrderMainController" var="ViewOrder">
                                            <c:param name="action" value="ViewMyOrder"/>
                                        </c:url>
                                        <a href="${ViewOrder}">My Orders</a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.ROLE == 'guide'}">
                                    <li>
                                        <c:url value="TourMainController" var="ViewSchedule">
                                            <c:param name="action" value="SearchSchedule"/>
                                        </c:url>
                                        <a href="${ViewSchedule}">My Schedule</a>
                                    </li>
                                </c:if>
                                <li>
                                    <c:if test="${sessionScope.ROLE == 'user'}">
                                        <c:url value="CustomerMainController" var="ViewInfo">
                                            <c:param name="action" value="GetMyInformation"/>
                                        </c:url>
                                        <a href="${ViewInfo}">Personal Information</a>
                                    </c:if>
                                    <c:if test="${sessionScope.ROLE == 'admin'}">
                                        <c:url value="StaffMainController" var="ViewInfo">
                                            <c:param name="action" value="GetMyInformation"/>
                                        </c:url>
                                        <a href="${ViewInfo}">Personal Information</a>
                                    </c:if>
                                    <c:if test="${sessionScope.ROLE == 'guide'}">
                                        <c:url value="TourGuideMainController" var="ViewInfo">
                                            <c:param name="action" value="GetMyInformation"/>
                                        </c:url>
                                        <a href="${ViewInfo}">Personal Information</a>
                                    </c:if>
                                </li>
                                <li>
                                    <a href="changePassword.jsp">Change Password</a>
                                </li>
                                <li>
                                    <c:url value="AccountMainController" var="LogOut">
                                        <c:param name="action" value="LogOut"/>
                                    </c:url>
                                    <a href="${LogOut}">Log Out</a>
                                </li>
                            </ul>
                        </c:if>
                        <c:if test="${!test}">
                            <a href="login.jsp">LOGIN</a>
                        </c:if>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
