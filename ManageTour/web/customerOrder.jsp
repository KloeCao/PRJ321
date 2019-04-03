
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

        <script>
            function preventBack() {
            <c:if test="${empty sessionScope}">
                //window.history.forward(); 
                history.pushState(null, null, location.href);
                window.onpopstate = function () {
                    history.go(1);
                };
            </c:if>
            }
        </script>
    </head>
    <body onload="preventBack()" onpageshow="if (event.persited) preventBack()" onunload="" >
        <div id="fh5co-wrapper">
            <div id="fh5co-page">

                <%@include file="header.jsp" %>
                <%@include file="mainSearchForm.jsp" %>

                <div id="fh5co-tours" class="fh5co-section-gray">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                                <form action="OrderMainController" method="POST">
                                    <input type="text" name="orderID" value="${param.orderID}"/>
                                    <button type="submit" name="action" value="SearchOrder" class="btn btn-primary">SEARCH</button>
                                </form>                           
                            </div>
                        </div>
                        <div class="row" style="color: black">
                            <c:if test="${not empty requestScope.PAY_ORDER}">
                                <h3 style="color: green">${requestScope.PAY_ORDER}</h3>
                            </c:if>
                            <c:if test="${not empty requestScope.ORDER_DETAILS}" var="testOrder">
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
                                                <thead style="text-align: center">
                                                    <tr>
                                                        <th colspan="5"><h3 style="color: orange">${requestScope.TOUR_NAME}</h3></th>
                                                    </tr>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Ticket</th>
                                                        <th>Quantity</th>
                                                        <th>Unit</th>
                                                        <th>Price</th>
                                                    </tr>
                                                </thead>
                                                <tbody style="text-align: center">
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
                                    <form action="OrderMainController" method="POST">
                                        <input type="hidden" name="orderID" value="${requestScope.ORDER_DETAILS.orderID}"/>
                                        <input type="hidden" name="orderStt" value="${requestScope.ORDER_DETAILS.orderStatus}"/>
                                        <c:if test="${requestScope.ORDER_DETAILS.orderStatus == 1 or requestScope.ORDER_DETAILS.orderStatus == 0}" var="orderStt">
                                            <c:if test="${requestScope.ORDER_DETAILS.orderStatus == 0}">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <button type="submit" name="action" value="PayOrder" class="btn btn-primary">PAY</button>
                                                        <button type="submit" name="action" value="CancelOrder" class="btn btn-primary">DESTROY</button>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${requestScope.ORDER_DETAILS.orderStatus == 1}">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <button type="submit" name="action" value="CancelOrder" class="btn btn-primary">DESTROY</button>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${!orderStt}">
                                            <div class="col-md-12">
                                                <h1 style="color: red">This order is destroyed</h1>
                                                <div class="form-group">
                                                    <button type="submit" name="action" value="ReturnMoney" class="btn btn-primary">RETURN FEE</button>
                                                </div>
                                            </div>
                                        </c:if>
                                    </form>

                                </div>
                            </c:if>
                        </div>
                        <div class="row">
                            <h4 style="color: orangered">${requestScope.RETURN_MONEY}</h4>
                        </div>
                        <div class="row" style="color: black">
                            <c:if test="${not empty requestScope.LIST_PASSENGER_IN_ORDER}" var="testPassenger">
                                <table class="row" style="color: black; text-align: center; width: 100%">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Full-name</th>
                                            <th>Birthday</th>
                                            <th>Phone</th>
                                            <th>Ticket</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.LIST_PASSENGER_IN_ORDER}" var="passenger" varStatus="number">
                                            <tr>
                                                <td>
                                                    ${number.count}
                                                    <input type="hidden" name="passengerID" value="${passenger.passengerID}"/>
                                                </td>
                                                <td>
                                                    <input type="text" name="fullname" value="${passenger.fullname}"/>
                                                </td>
                                                <td>
                                                    <input type="date" pattern="yyyy-MM-dd" name="birthday" value="${passenger.birthday}"/>
                                                </td>
                                                <td>
                                                    <input type="text" name="phone" value="${passenger.phone}"/>
                                                </td>
                                                <td>
                                                    <c:if test="${passenger.isAdult}">
                                                        <select name="isAdult">
                                                            <option value="true" selected="true">Adult Ticket</option>
                                                            <option value="false">Children Ticket</option>
                                                        </select>
                                                    </c:if>
                                                    <c:if test="${!passenger.isAdult}">
                                                        <select name="isAdult">
                                                            <option value="true">Adult Ticket</option>
                                                            <option value="false" selected="true">Children ticket</option>
                                                        </select>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </c:if>
                            <c:if test="${!testPassenger}">
                                <h2></h2>
                            </c:if>
                        </div>
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

        <!-- Main JS -->
        <script src="js/main.js"></script>

    </body>
</html>

