
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

    </head>
    <body>
        <div id="fh5co-wrapper">
            <div id="fh5co-page">
                <%@include file="header.jsp" %>
                <%@include file="mainSearchForm.jsp" %>

                <div id="fh5co-tours" class="fh5co-section-gray">
                    <div class="container">
                        <div class="row">
                            <h2 style="color: orangered">${requestScope.INSERT_TOUR}</h2>
                        </div>
                        <div class="row">
                            <form action="TourMainController" method="POST">
                                <div class="col-xxs-12 col-xs-12 mt">
                                    <div class="input-field">
                                        <label for="from">Tour Name - Journey</label>
                                        <input type="text" name="journey" value="${param.journey}" class="form-control" id="from-place" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-12 mt">
                                    <div class="input-field">
                                        <label for="from">Area</label>
                                        <c:set var="c" value="${param.categoryID}"/>
                                        <select class="form-control" name="categoryID">
                                            <option value="NVN" selected="${c == 'NVN'}">North Vietnam</option>
                                            <option value="SVN" selected="${c == 'SVN'}">South Vietnam</option>
                                            <option value="MVN" selected="${c == 'MVN'}">Central Vietnam</option>
                                            <option value="ASIA" selected="${c == 'ASIA'}">Asia</option>
                                            <option value="EURO" selected="${c == 'EURO'}">Europe</option>
                                            <option value="AFR" selected="${c == 'AFR'}">Africa</option>
                                            <option value="AME" selected="${c == 'AME'}">America</option>
                                            <option value="AUS" selected="${c == 'AUS'}">Australia</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label for="date-start">From</label><small style="color: red">${requestScope.INVALID_DAY}</small>
                                        <input type="date" class="form-control" pattern="yyyy-MM-dd" name="timeBegin" value="${param.timeBegin}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label for="date-end">To</label><small style="color: red">${requestScope.INVALID_DAY}</small>
                                        <input type="date" class="form-control" pattern="yyyy-MM-dd" name="timeEnd" value="${param.timeEnd}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt">
                                    <label for="class">Days</label>
                                    <input type="number" min="1" class="form-control" id="from-place" name="days" value="${param.days}" required="true"/>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt">
                                    <label for="class">Nights</label>
                                    <input type="number" min="0" max="${param.days}" class="form-control" id="from-place" name="nights" value="${param.nights}" required="true"></input>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label for="class">Description</label>
                                        <textarea style="height: 300px;" class="form-control" id="from-place" name="description" required="true">${param.description}</textarea>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label for="class">Agenda</label>
                                        <textarea style="height: 300px;" class="form-control" id="from-place" name="agenda" required="true">${param.agenda}</textarea>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label for="class">Departure</label>
                                        <input type="text" class="form-control" id="from-place" name="departure" value="${param.departure}" required="true"></input>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label for="class">Vehicle</label>
                                        <input type="text" class="form-control" id="from-place" name="vehicle" value="${param.vehicle}" required="true"></input>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label for="class">Adult Price</label>
                                        <input type="number" min="100" class="form-control" id="from-place" name="priceForAdult" value="${param.priceForAdult}" required="true"></input>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label for="class">Children Price</label>
                                        <input type="number" min="100" class="form-control" id="from-place" name="priceForKid" value="${param.priceForKid}" required="true"></input>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label for="class">Passenger Quantity</label>
                                        <input type="number" min="15" max="50" class="form-control" id="from-place" name="quantity" value="${param.quantity}" required="true"></input>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                </div>
                                <c:if test="${not empty requestScope.AVAILABLE_TOURGUIDE}" var="tourguideTest">
                                    <div class="col-xxs-12 col-xs-6 mt">
                                        <section>
                                            <label for="class">Tourguide</label>
                                            <select class="form-control" name="tourGuideID">
                                                <c:forEach items="${requestScope.AVAILABLE_TOURGUIDE}" var="tourguide">
                                                    <option value="${tourguide.key}">${tourguide.value}</option>
                                                </c:forEach>

                                            </select>
                                        </section>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label for="class"></label>
                                            <button type="submit" class="btn btn-primary btn-block" id="from-place" disabled="true">CHOOSE TOURGUIDE</button>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <button type="submit" class="btn btn-primary btn-block" value="InsertTour" name="action">SAVE</button>
                                    </div>
                                </c:if>
                                <c:if test="${!tourguideTest}">
                                    <div class="col-xxs-12 col-xs-6 mt">
                                        <section>
                                            <label for="class">Tourguide</label>
                                            <select class="form-control" disabled="true">
                                                <c:forEach items="${requestScope.AVAILABLE_TOURGUIDE}" var="tourguide">
                                                </c:forEach>

                                            </select>
                                        </section>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label for="class"></label>
                                            <button type="submit" name="action" value="GetValidTourGuideForInsert" class="btn btn-primary btn-block" id="from-place">
                                                CHOOSE TOURGUIDE
                                            </button>

                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <button type="submit" class="btn btn-primary btn-block" value="" name="action" disabled="true">SAVE</button>
                                    </div>
                                </c:if>
                                <input type="hidden" name="viewPage" value="insert"/>
                            </form>
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

