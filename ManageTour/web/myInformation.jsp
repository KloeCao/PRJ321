
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
                    <c:set var="role" value="${sessionScope.ROLE}"/>
                    <c:set var="me" value="${requestScope.MY_INFORMATION}"/>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                                <h3>PERSONAL INFORMATION</h3>
                                <p>Wing Tourist</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                                <h3>${requestScope.UPDATE_INFOR}</h3>
                            </div>
                        </div>
                        <c:if test="${role == 'user'}">
                            <form action="CustomerMainController" method="POST">
                                <div class="col-xxs-12 col-xs-12 mt">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Full-name</label>
                                        <input type="text" class="form-control" id="from-place" name="fullname" value="${me.fullname}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Email</label>
                                        <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" id="from-place" name="email" value="${me.email}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Phone</label>
                                        <input type="text" pattern="\d{9,11}" class="form-control" id="from-place" name="phone" value="${me.phone}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <button type="submit" class="btn btn-primary btn-block" value="UpdateCustomerInformation" name="action">CHANGE</button>
                                </div>
                            </form>
                        </c:if>
                        <c:if test="${role == 'admin'}">
                            <form action="StaffMainController" method="POST">
                                <div class="col-xxs-12 col-xs-12 mt">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Full-name</label>
                                        <input type="text" class="form-control" id="from-place" name="fullname" value="${me.fullname}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Address</label>
                                        <input type="text" class="form-control" id="from-place" name="address" value="${me.address}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Ngày sinh</label>
                                        <input type="date" pattern="yyyy-MM-dd" class="form-control" id="from-place" name="birthday" value="${me.birthday}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Email</label>
                                        <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" id="from-place" name="email" value="${me.email}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Phone</label>
                                        <input type="text" pattern="\d{8..11}" class="form-control" id="from-place" name="phone" value="${me.phone}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <button type="submit" class="btn btn-primary btn-block" value="UpdateStaffInformation" name="action">CHANGE</button>
                                </div>
                            </form>
                        </c:if>
                        <c:if test="${role == 'guide'}">
                            <form action="TourGuideMainController" method="POST">
                                <div class="col-xxs-12 col-xs-12 mt">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Full-name</label>
                                        <input type="text" class="form-control" id="from-place" name="fullname" value="${me.fullname}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Address</label>
                                        <input type="text" class="form-control" id="from-place" name="address" value="${me.address}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Birthday</label>
                                        <input type="date" pattern="yyyy-MM-dd" class="form-control" id="from-place" name="birthday" value="${me.birthday}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Email</label>
                                        <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" id="from-place" name="email" value="${me.email}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-6 mt alternate">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Phone</label>
                                        <input type="text" pattern="\d{8..11}" class="form-control" id="from-place" name="phone" value="${me.phone}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <button type="submit" class="btn btn-primary btn-block" value="UpdateTourGuideInformation" name="action">CHANGE</button>
                                </div>
                            </form>
                        </c:if>

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

