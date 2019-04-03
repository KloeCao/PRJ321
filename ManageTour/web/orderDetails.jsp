<%-- 
    Document   : order
    Created on : Feb 20, 2019, 5:58:16 PM
    Author     : Kim Anh
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>WING Tourist - Let's fly away</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
        <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
        <meta name="author" content="FREEHTML5.CO" />

        <!-- 
              //////////////////////////////////////////////////////
      
              FREE HTML5 TEMPLATE 
              DESIGNED & DEVELOPED by FREEHTML5.CO
                      
              Website: 		http://freehtml5.co/
              Email: 			info@freehtml5.co
              Twitter: 		http://twitter.com/fh5co
              Facebook: 		https://www.facebook.com/fh5co
      
              //////////////////////////////////////////////////////
        -->

        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico">

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Superfish -->
        <link rel="stylesheet" href="css/superfish.css">
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.css">
        <!-- Date Picker -->
        <link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
        <!-- CS Select -->
        <link rel="stylesheet" href="css/cs-select.css">
        <link rel="stylesheet" href="css/cs-skin-border.css">

        <link rel="stylesheet" href="css/style.css">


        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <div id="fh5co-wrapper">
            <div id="fh5co-page">

                <%@include file="header.jsp" %>
                <%@include file="mainSearchForm.jsp" %>

                <div id="fh5co-contact" class="fh5co-section-gray">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                                <h3>ORDER DETAILS</h3>
                                <p>WING Tourist</p>
                            </div>
                        </div>
                        <form action="OrderMainController" method="POST">
                            <div class="row animate-box">
                                <c:forEach items="${requestScope.LIST_PASSENGER_IN_ORDER}" var="passenger" varStatus="number">
                                    <div class="col-md-6 animate-box">
                                        <div class="car" style="width: 100%;">
                                            <h3 style="color: orange; text-align: center; width: 100%;">Passenger #${number.count}</h3>
                                        </div>
                                        <div class="car">
                                            <div class="row row-space">
                                                <div class="col-2">
                                                    <div class="input-group">
                                                        <label class="label" style="color: black; font-size: 20px">Full-name</label>
                                                        <input type="text" class="form-control" id="from-place" value="${passenger.fullname}" readonly="true"/>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="input-group">
                                                        <label class="label" style="color: black; font-size: 20px">Phone Number</label>
                                                        <input type="text" class="form-control" id="from-place" value="${passenger.phone}" readonly="true"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row row-space">
                                                <div class="col-2">
                                                    <div class="input-group">
                                                        <label class="label" style="color: black; font-size: 20px">Birthday</label>
                                                        <input type="text" class="form-control" id="from-place" value="${passenger.birthday}" readonly="true"/>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="input-group" style="color: black; font-size: 20px">
                                                        <label class="label" style="color: black; font-size: 20px">Ticket</label>
                                                        <c:if test="${passenger.isAdult}" var="isAdult">
                                                            <input type="text" class="form-control" id="from-place" readonly="true" value="Adult Ticket" />
                                                        </c:if>
                                                        <c:if test="${!isAdult}">
                                                            <input type="text" class="form-control" id="from-place" readonly="true" value="Children Ticket" />
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="row">
                                <!--<label style="color: orangered">ORDER</label>-->
                                <hr style="line-height: 30px; color: orange"/>
                            </div>
                            <div class="row animate-box" style="text-align: center; width: 200%;">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>ORDER ID</label>
                                                <input type="text" class="form-control" name="orderID" value="${requestScope.ORDER_DETAILS.orderID}" readonly="true">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>DATE CREATE</label>
                                                <input type="text" class="form-control" value="${requestScope.ORDER_DETAILS.dateCreate}" readonly="true">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>ORDER DETAILS</label>
                                                <!--<div name="" class="form-control" id="" cols="30" rows="7" placeholder="Message">-->
                                                <table class="col-md-12" style="text-align: center" class="form-control" id="" cols="30" rows="7">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="5"><h3 style="color: orange; text-align: center">${requestScope.TOUR_NAME}</h3></th>
                                                        </tr>
                                                        <tr style="text-align: center">
                                                            <th style="text-align: center">No.</th>
                                                            <th style="text-align: center">Ticket</th>
                                                            <th style="text-align: center">Quantity</th>
                                                            <th style="text-align: center">Unit</th>
                                                            <th style="text-align: center">Price</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${requestScope.ORDER_DETAILS.numOfAdult != 0}">
                                                            <tr>
                                                                <td>1</td>
                                                                <td>Adult Ticket</td>
                                                                <td>${requestScope.ORDER_DETAILS.numOfAdult}</td>
                                                                <c:forEach items="${requestScope.PRICES}" var="details" begin="0" end="0">
                                                                    <td><fmt:formatNumber type="number" pattern="###,###,###,###"  value="${details}" /></td>
                                                                </c:forEach>
                                                                <c:forTokens delims="-" var="detail" items="${requestScope.AKT}" begin="0" end="0">
                                                                    <td><fmt:formatNumber type="number" pattern="###,###,###,###"  value="${detail}" /></td>
                                                                </c:forTokens>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${requestScope.ORDER_DETAILS.numOfKid != 0}">
                                                            <tr>
                                                                <td>2</td>
                                                                <td>Children Ticket</td>
                                                                <td>${requestScope.ORDER_DETAILS.numOfKid}</td>
                                                                <c:forEach items="${requestScope.PRICES}" var="details" begin="1" end="1">
                                                                    <td><fmt:formatNumber type="number" pattern="###,###,###,###"  value="${details}" /></td>
                                                                </c:forEach>
                                                                <c:forTokens delims="-" var="detail" items="${requestScope.AKT}" begin="1" end="1">
                                                                    <td><fmt:formatNumber type="number" pattern="###,###,###,###"  value="${detail}" /></td>
                                                                </c:forTokens>
                                                            </tr>
                                                        </c:if>
                                                        <tr>
                                                            <td colspan="4" style="text-align: right"><h2>TOTAL</h2></td>
                                                            <c:forTokens delims="-" var="detail" items="${requestScope.AKT}" begin="2" end="2">
                                                                <td><h2 style="color: orange"><fmt:formatNumber type="number" pattern="###,###,###,###"  value="${detail}" /></h2></td>
                                                        <input type="hidden" name="total" value="${detail}"/>
                                                    </c:forTokens>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                <!--</div>-->
                                            </div>
                                        </div>
                                        <c:if test="${requestScope.ORDER_DETAILS.orderStatus == 1 or requestScope.ORDER_DETAILS.orderStatus == 0}" var="orderStt">
                                            <div class="col-md-12">
                                                <textarea class="col-md-12" style="width: 100%; height: 500px" readonly="true">
                                                I. GENERAL TERMS
                                                Prices for all services are calculated in dollar (Dollar - $). Service prices are clearly listed in the "Include" section in tours, car services, hotels, etc. Amega Travel is not obliged to pay any costs that are not included in the "Bao" section. including"
                                                II. PAY
                                                When registering, please provide sufficient information and pay a deposit to reserve your place. The deposit amount varies depending on the program you choose, the remaining amount will be paid before the departure date is 5 working days, there are 2 forms of payment:
                                                - Payment by cash at the company.
                                                - The payment is considered complete when WING Travel receives enough tickets before the departure date or according to the agreement between the two parties. Any late payment resulting in cancellation of service is not the responsibility of WING Travel.
                                                - WING Travel will not solve the case of the system automatically canceling the registration card if you do not comply with the above provisions.
                                                </textarea>
                                                <input type="checkbox" required="true"><span>I have read and agree to the above terms</span>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <button type="submit" name="action" value="CancelOrder" class="btn btn-primary">DESTROY</button>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${!orderStt}">
                                            <div class="col-md-12">
                                                <h1 style="color: red">This Order is canceled</h1>
                                                <span style="color: red">${requestScope.RETURN}</span>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="tourID" value="${requestScope.ORDER_DETAILS.tourID}"/>
                            <input type="hidden" name="orderStt" value="${requestScope.ORDER_DETAILS.orderStatus}"/>
                        </form>
                    </div>
                </div>

                <%@include file="happyClient.jsp" %>
                <%@include file="footer.jsp" %>

            </div>
            <!-- END fh5co-page -->

        </div>
        <!-- END fh5co-wrapper -->

        <!-- jQuery -->


        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/sticky.js"></script>

        <!-- Stellar -->
        <script src="js/jquery.stellar.min.js"></script>
        <!-- Superfish -->
        <script src="js/hoverIntent.js"></script>
        <script src="js/superfish.js"></script>
        <!-- Magnific Popup -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>
        <!-- Date Picker -->
        <script src="js/bootstrap-datepicker.min.js"></script>
        <!-- CS Select -->
        <script src="js/classie.js"></script>
        <script src="js/selectFx.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
        <script src="js/google_map.js"></script>

        <!-- Main JS -->
        <script src="js/main.js"></script>

    </body>
</html>

