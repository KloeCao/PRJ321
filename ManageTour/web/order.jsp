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
                                <p>WING - Let's fly away</p>
                            </div>
                        </div>
                        <form action="OrderMainController" method="POST">
                            <input type="hidden" name="prices" value="${requestScope.PRICES}"/>
                            <input type="hidden" name="akt" value="${requestScope.AKT}"/>
                            <div class="row animate-box">
                                <div class="col-md-6">
                                    <h3 class="section-title">Our Office</h3>
                                    <ul class="contact-info">
                                        <li><i class="icon-location-pin"></i>1103 Pastuer, District 1, HCM City</li>
                                        <li><i class="icon-phone2"></i>0977484556</li>
                                        <li><i class="icon-mail"></i><a href="#">infor@wing.com.vn</a></li>
                                        <li><i class="icon-globe2"></i><a href="index.jsp">www.wingtourist.com</a></li>
                                    </ul>
                                    <p style="color: red">${requestScope.CHECKOUT}</p>
                                    <p id="demo"></p>
                                </div>
                                <c:if test="${empty requestScope.CHECKOUT}">
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>ORDER ID</label>
                                                    <input type="text" class="form-control" name="orderID" value="${sessionScope.ORDER.orderID}" readonly="true">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>DATE CREATE</label>
                                                    <input type="text" class="form-control" name="dateCreate" value="${sessionScope.ORDER.dateCreate}" readonly="true">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>ORDER DETAILS</label>
                                                    <table class="col-md-12" style="text-align: center" class="form-control" id="" cols="30" rows="7">
                                                        <thead>
                                                            <tr>
                                                                <th>No.</th>
                                                                <th>Ticket</th>
                                                                <th>Quantity</th>
                                                                <th>Unit</th>
                                                                <th>Price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:if test="${sessionScope.ORDER.numOfAdult != 0}">
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td>Adult Ticket</td>
                                                                    <td>${sessionScope.ORDER.numOfAdult}</td>
                                                                    <c:forEach items="${requestScope.PRICES}" var="details" begin="0" end="0">
                                                                        <td><fmt:formatNumber type="number" pattern="###,###,###,###"  value="${details}" /></td>
                                                                    </c:forEach>
                                                                    <c:forTokens delims="-" var="detail" items="${requestScope.AKT}" begin="0" end="0">
                                                                        <td><fmt:formatNumber type="number" pattern="###,###,###,###"  value="${detail}" /></td>
                                                                    </c:forTokens>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${sessionScope.ORDER.numOfKid != 0}">
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td>Children Ticket</td>
                                                                    <td>${sessionScope.ORDER.numOfKid}</td>
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
                                                                    </c:forTokens>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <!--</div>-->
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <textarea class="col-md-12" style="width: 100%; height: 500px">
                                                I. GENERAL TERMS
                                                Prices for all services are calculated in dollar (Dollar - $). Service prices are clearly listed in the "Include" section in tours, car services, hotels, etc. Amega Travel is not obliged to pay any costs that are not included in the "Bao" section. including"
                                                II. PAY
                                                When registering, please provide sufficient information and pay a deposit to reserve your place. The deposit amount varies depending on the program you choose, the remaining amount will be paid before the departure date is 5 working days, there are 2 forms of payment:
                                                - Payment by cash at the company.
                                                - The payment is considered complete when WING Travel receives enough tickets before the departure date or according to the agreement between the two parties. Any late payment resulting in cancellation of service is not the responsibility of WING Travel.
                                                - WING Travel will not solve the case of the system automatically canceling the registration card if you do not comply with the above provisions.
                                                </textarea>
                                                <input type="checkbox" required="true"><span>I accept</span>
                                            </div>
                                            <div class="col-md-12">

                                                <div class="form-group">
                                                    <button type="submit" name="action" value="CheckOut" class="btn btn-primary">PAY</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>

                            </div>
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

