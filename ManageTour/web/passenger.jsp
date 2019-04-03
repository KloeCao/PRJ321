
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!--*****************************************************************************************************************************************************-->
        <!-- Icons font CSS-->
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Vendor CSS-->
        <link href="vendor/select2/select2Reg.min.css" rel="stylesheet" media="all">
        <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/mainReg.css" rel="stylesheet" media="all">
        <!--*****************************************************************************************************************************************************-->

    </head>
    <body>
        <div id="fh5co-wrapper">
            <div id="fh5co-page">

                <%@include file="header.jsp" %>
                <%@include file="mainSearchForm.jsp" %>

                <!--*********************************************************************************************************************************************************-->
                <!-- Jquery JS-->
                <script src="vendor/jquery/jquery.min.js"></script>
                <!-- Vendor JS-->
                <script src="vendor/select2/select2Reg.min.js"></script>
                <script src="vendor/datepicker/moment.min.js"></script>
                <script src="vendor/datepicker/daterangepicker.js"></script>

                <!-- Main JS-->
                <script src="js/global.js"></script>
                <!--*********************************************************************************************************************************************************-->		


                <div id="fh5co-car" class="fh5co-section-gray">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                                <h3>Thông tin hành khách</h3>
                                <c:if test="${not empty requestScope.INVALID_BIRTHDAY}">
                                    <p style="color: red">${requestScope.INVALID_BIRTHDAY}</p>
                                    <p style="color: orangered">Children Ticket - Birthday must be after ${requestScope.CONFIRM_YEAR}</p>
                                    <p style="color: orangered">Adult Ticket - Birthday must be before ${requestScope.CONFIRM_YEAR}</p>
                                </c:if>

                            </div>
                        </div>
                        <div class="row row-bottom-padded-md">
                            <form action="PassengerMainController" method="POST">
                                <input type="hidden" name="tourID" value="${param.tourID}"/>
                                <input type="hidden" name="numOfKid" value="${requestScope.NUM_OF_KID}"/>
                                <input type="hidden" name="numOfKid" value="${param.numOfKid}"/>
                                <input type="hidden" name="numOfAdult" value="${param.numOfAdult}"/>

                                <c:if test="${not empty sessionScope.LIST_PASSENGERS}" var="testList">
                                    <c:forEach items="${sessionScope.LIST_PASSENGERS}" varStatus="number" var="passenger">
                                        <c:if test="${passenger.isAdult}" var="test">
                                            <div class="col-md-6 animate-box" style="">
                                                <div class="car" style="width: 100%;">
                                                    <h3 style="color: orange; text-align: center; width: 100%;">Adult #${number.count}</h3>
                                                </div>
                                                <div class="car">
                                                    <div class="row row-space">
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Full-name</label>
                                                                <input type="text" class="form-control" id="from-place" name="fullname${number.count}" value="${passenger.fullname}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Phone Number</label>
                                                                <input type="text" pattern="\d{8..11}" class="form-control" id="from-place" name="phone${number.count}" value="${passenger.phone}" required="true"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row row-space">
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Birthday</label>
                                                                <input type="date" max="${requestScope.VALID_ADULT_BIRTHDAY}" class="form-control" id="from-place" name="birthday${number.count}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Ticket</label>
                                                                <input type="text" class="form-control" id="from-place" name="typeOfTicket${number.count}" readonly="true" value="Adult Ticket" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:if>
                                        <c:if test="${!test}">
                                            <div class="col-md-6 animate-box" style="">
                                                <div class="car" style="width: 100%;">
                                                    <h3 style="color: orange; text-align: center; width: 100%">Children #${number.count}</h3>
                                                </div>
                                                <div class="car">
                                                    <div class="row row-space">
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Full-name</label>
                                                                <input type="text" class="form-control" id="from-place" name="fullname${number.count}" value="${passenger.fullname}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Phone Number</label>
                                                                <input type="text" pattern="\d{8..11}" class="form-control" id="from-place" name="phone${number.count}" value="${passenger.phone}" required="true"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row row-space">
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Birthday</label>
                                                                <input type="date" min="${requestScope.VALID_KID_BIRTHDAY}" class="form-control" id="from-place" name="birthday${number.count}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Ticket</label>
                                                                <input type="text" class="form-control" id="from-place" name="typeOfTicket${number.count}" readonly="true" value="Children Ticket" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:if>    
                                    </c:forEach>
                                </c:if>
                                <c:if test="${!testList}">
                                    <c:forEach begin="1" end="${param.numOfKid + param.numOfAdult}" varStatus="number">
                                        <c:if test="${number.count le param.numOfAdult}" var="test">
                                            <div class="col-md-6 animate-box" style="">
                                                <div class="car" style="width: 100%;">
                                                    <h3 style="color: orange; text-align: center; width: 100%;">Adult #${number.count}</h3>
                                                </div>
                                                <div class="car">
                                                    <div class="row row-space">
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Full-name</label>
                                                                <input type="text" class="form-control" id="from-place" name="fullname${number.count}" value="${param.fullname}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Phone Number</label>
                                                                <input type="text" pattern="\d{8..11}" class="form-control" id="from-place" name="phone${number.count}" value="${param.phone}" required="true"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row row-space">
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Birthday<small style="color: red">${requestScope.INVALID_ADULT_DATE}</small></label>
                                                                <input type="date" max="${requestScope.VALID_ADULT_BIRTHDAY}" class="form-control" id="from-place" name="birthday${number.count}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Ticket</label>
                                                                <input type="text" class="form-control" id="from-place" name="typeOfTicket${number.count}" readonly="true" value="Adult Ticket" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:if>
                                        <c:if test="${!test}">
                                            <div class="col-md-6 animate-box" style="">
                                                <div class="car" style="width: 100%;">
                                                    <h3 style="color: orange; text-align: center; width: 100%">Children #${number.count - param.numOfAdult}</h3>
                                                </div>
                                                <div class="car">
                                                    <div class="row row-space">
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Full-name</label>
                                                                <input type="text" class="form-control" id="from-place" name="fullname${number.count}" value="${param.fullname}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Phone Number</label>
                                                                <input type="text" pattern="\d{8..11}" class="form-control" id="from-place" name="phone${number.count}" value="${param.phone}" required="true"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row row-space">
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Birthday<small style="color: red">${requestScope.INVALID_KID_DATE}</small></label>
                                                                <input type="date" min="${requestScope.VALID_KID_BIRTHDAY}" class="form-control" id="from-place" name="birthday${number.count}" required="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="input-group">
                                                                <label class="label">Ticket</label>
                                                                <input type="text" class="form-control" id="from-place" name="typeOfTicket${number.count}" readonly="true" value="Children Ticket" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:if>    
                                    </c:forEach>
                                </c:if>

                                <div class="col-xs-12">
                                    <button type="submit" class="btn btn-primary btn-block" name="action" value="GetListPassengers">NEXT</button>
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

            <!-- Main JS -->
            <script src="js/main.js"></script>

    </body>
</html>

