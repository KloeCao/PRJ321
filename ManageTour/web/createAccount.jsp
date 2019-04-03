
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
            function checkOrder() {
            <c:if test="${not empty requestScope.CHECKOUT}">
                alert(${requestScope.CHECKOUT});
            </c:if>
            }
        </script>
    </head>
    <body onload="preventBack(); checkOrder()" onpageshow="if (event.persited) preventBack()" onunload="" onre >
        <div id="fh5co-wrapper">
            <div id="fh5co-page">
                <%@include file="header.jsp" %>
                <%@include file="mainSearchForm.jsp" %>

                <div id="fh5co-tours" class="fh5co-section-gray">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                                <h3>CREATE AN ACCOUNT</h3>
                                <p>Let's fly away</p>
                            </div>
                        </div>
                        <div class="row">
                            <form action="AccountMainController" method="POST">
                                <div class="col-xxs-12 col-xs-12 mt">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Username</label>
                                        <input type="text" class="form-control" id="from-place" name="username" value="${param.username}" required="true"/>
                                    </div>
                                </div>
                                <div class="col-xxs-12 col-xs-12 mt">
                                    <div class="input-field">
                                        <label class="label" style="color: black; font-size: 20px">Role</label>
                                        <select name="role" class="form-control" id="from-place">
                                            <option value="user">Customer</option>
                                            <option value="admin">Staff</option>
                                            <option value="guide">Tourguide</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <c:if test="${empty param.role}">
                                        <button type="submit" class="btn btn-primary btn-block" value="CreateAccount" name="action">CREATE</button>
                                    </c:if>

                                </div> 
                            </form>
                        </div>

                        <c:if test="${not empty requestScope.ACCOUNT}">
                            <c:set var="username" value="${requestScope.ACCOUNT}"/>
                            <c:set var="role" value="${param.role}"/>
                            <c:if test="${role == 'user'}">
                                <form action="CustomerMainController" method="POST">
                                    <div class="col-xxs-12 col-xs-12 mt">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Full-name</label>
                                            <input type="text" class="form-control" id="from-place" name="fullname" value="${param.fullname}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Email</label>
                                            <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" id="from-place" name="email" value="${param.email}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Phone</label>
                                            <input type="text" pattern="\d{9,11}" class="form-control" id="from-place" name="phone" value="${param.phone}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <input type="hidden" name="username" value="${username}"/>
                                        <button type="submit" class="btn btn-primary btn-block" value="InsertCustomerByAdmin" name="action">SAVE</button>
                                    </div>
                                </form>
                            </c:if>
                            <c:if test="${role == 'admin'}">
                                <form action="StaffMainController" method="POST">
                                    <div class="col-xxs-12 col-xs-12 mt">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Full-name</label>
                                            <input type="text" class="form-control" id="from-place" name="fullname" value="${param.fullname}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Address</label>
                                            <input type="text" class="form-control" id="from-place" name="address" value="${param.address}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Birthday</label>
                                            <input type="date" pattern="yyyy-MM-dd" max="${requestScope.VALID_BIRTHDAY}" class="form-control" id="from-place" name="birthday" value="${param.birthday}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Email</label>
                                            <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" id="from-place" name="email" value="${param.email}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Phone</label>
                                            <input type="text" pattern="\d{8..11}" class="form-control" id="from-place" name="phone" value="${param.phone}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <input type="hidden" name="username" value="${username}"/>
                                        <button type="submit" class="btn btn-primary btn-block" value="InsertStaffByAdmin" name="action">SAVE</button>
                                    </div>
                                </form>
                            </c:if>
                            <c:if test="${role == 'guide'}">
                                <form action="TourGuideMainController" method="POST">
                                    <div class="col-xxs-12 col-xs-12 mt">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Full-name</label>
                                            <input type="text" class="form-control" id="from-place" name="fullname" value="${param.fullname}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Address</label>
                                            <input type="text" class="form-control" id="from-place" name="address" value="${param.address}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Birthday</label>
                                            <input type="date" pattern="yyyy-MM-dd" max="${requestScope.VALID_BIRTHDAY}" class="form-control" id="from-place" name="birthday" value="${param.birthday}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Email</label>
                                            <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" id="from-place" name="email" value="${param.email}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label class="label" style="color: black; font-size: 20px">Phone</label>
                                            <input type="text" pattern="\d{8..11}" class="form-control" id="from-place" name="phone" value="${param.phone}" required="true"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <input type="hidden" name="username" value="${username}"/>
                                        <button type="submit" class="btn btn-primary btn-block" value="InsertTouguideByAdmin" name="action">SAVE</button>
                                    </div>
                                </form>
                            </c:if>
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

