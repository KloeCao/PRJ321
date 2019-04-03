
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
                                <h3>ACCOUNT MANAGEMENT</h3>
                            </div>
                        </div>
                        <div class="row">
                            <form action="AccountMainController" method="POST">
                                <input type="text" class="form-control" id="from-place" name="fullname" value="${param.fullname}" placeholder="Enter full-name"/>
                                <select name="role" class="form-control" id="from-place">
                                    <option value="user">Customer</option>
                                    <option value="admin">Staff</option>
                                    <option value="guide">Tourguide</option>
                                </select>
                                <button type="submit" name="action" value="SearchAccount" class="btn btn-primary">SEARCH</button>
                            </form>
                        </div>
                        <div class="row">
                            <a href="createaccount.jsp">Create An Account</a>
                        </div>
                        <div class="row">
                            <c:if test="${not empty requestScope.LIST}">
                                <table class="row" style="width: 100%; border: 1px double orange">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Full-name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>More</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.LIST}" var="account" varStatus="number">
                                            <tr>
                                                <td>${number.count}</td>
                                                <td>${account.fullname}</td>
                                                <td>${account.email}</td>
                                                <td>${account.phone}</td>
                                                <td>
                                                    <c:if test="${param.role eq 'user'}">
                                                        <c:url value="AccountMainController" var="ViewDetails">
                                                            <c:param name="action" value="ViewAccountInformation"/>
                                                            <c:param name="username" value="${account.username}"/>
                                                            <c:param name="role" value="${param.role}"/>
                                                        </c:url>
                                                        <a href="${ViewDetails}">More</a>
                                                    </c:if>
                                                    <c:if test="${param.role eq 'admin'}">
                                                        <c:url value="AccountMainController" var="ViewDetails">
                                                            <c:param name="action" value="ViewAccountInformation"/>
                                                            <c:param name="username" value="${account.username}"/>
                                                            <c:param name="role" value="${param.role}"/>
                                                        </c:url>
                                                        <a href="${ViewDetails}">More</a>
                                                    </c:if>
                                                    <c:if test="${param.role eq 'guide'}">
                                                        <c:url value="AccountMainController" var="ViewDetails">
                                                            <c:param name="action" value="ViewAccountInformation"/>
                                                            <c:param name="username" value="${account.tourGuideID}"/>
                                                            <c:param name="role" value="${param.role}"/>
                                                        </c:url>
                                                        <a href="${ViewDetails}">More</a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                    </div>
                </div>

                <c:if test="${not empty requestScope.ACCOUNT}">
                    <div id="fh5co-tours" class="fh5co-section-gray">
                        <div class="row">
                            <form action="" method="POST">

                            </form>
                        </div>
                    </div>
                </c:if>                

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

