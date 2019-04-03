<%-- 
    Document   : index
    Created on : Jan 28, 2019, 12:30:40 PM
    Author     : Kim Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <html>
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

                            <c:if test="${requestScope.LISTTOUR != null}">
                                <c:if test="${not empty requestScope.LISTTOUR}" var="testList">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                                            <c:if test="${param.categoryID == 'SVN'}">
                                                <h3>VIETNAM TOUR</h3>
                                                <p>South Vietnam</p>
                                            </c:if>
                                            <c:if test="${param.categoryID == 'NVN'}">
                                                <h3>VIETNAM TOUR</h3>
                                                <p>North Vietnam</p>
                                            </c:if>
                                            <c:if test="${param.categoryID == 'MVN'}">
                                                <h3>VIETNAM TOUR</h3>
                                                <p>Central Vietnam</p>
                                            </c:if>
                                            <c:if test="${param.categoryID == 'ASIA'}">
                                                <h3>ABROAD TOUR</h3>
                                                <p>Asia</p>
                                            </c:if>
                                            <c:if test="${param.categoryID == 'EURO'}">
                                                <h3>ABROAD TOUR</h3>
                                                <p>Euro</p>
                                            </c:if>
                                            <c:if test="${param.categoryID == 'AME'}">
                                                <h3>ABROAD TOUR</h3>
                                                <p>America</p>
                                            </c:if>
                                            <c:if test="${param.categoryID == 'AFR'}">
                                                <h3>ABROAD TOUR</h3>
                                                <p>Africa</p>
                                            </c:if>
                                            <c:if test="${param.categoryID == 'AUS'}">
                                                <h3>ABROAD TOUR</h3>
                                                <p>Australia</p>
                                            </c:if>
                                            <c:if test="${param.categoryID == null}">
                                                <h3>DESTINATION</h3>
                                                <p>Let's fly away</p>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <c:forEach items="${requestScope.LISTTOUR}" var="tour">
                                            <div class="col-md-4 col-sm-6 fh5co-tours animate-box" data-animate-effect="fadeIn">
                                                <div href="#">
                                                    <img src="${tour.picture}" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive" style="width: 500px; height: 300px;">
                                                    <div class="desc">
                                                        <span></span>
                                                        <h3>${tour.journey}</h3>
                                                        <span>${tour.timeLiving}</span>
                                                        <span class="price"><fmt:formatNumber type="number" pattern="###,###,###,###"  value="${tour.priceForAdult}" />$</span>
                                                        <c:url value="TourMainController" var="view">
                                                            <c:param name="action" value="ViewTourDetails"/>
                                                            <c:param name="tourID" value="${tour.tourID}"/>
                                                        </c:url>
                                                        <a class="btn btn-primary btn-outline" href="${view}">View More<i class="icon-arrow-right22"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <c:if test="${testList == false}">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                                            <h3>NO TOUR FOR THIS DESTINATION</h3>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>
                        </div>
                    </div>

                    <%@include file="others.jsp" %>   
                    <%@include file="popularDestination.jsp" %>
                    <%@include file="blog.jsp" %>
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


