<%-- 
    Document   : tourdetails
    Created on : Feb 12, 2019, 5:03:33 PM
    Author     : Kim Anh
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
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



        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            .mySlides {display:none;}
        </style>





    </head>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Nunito&subset=vietnamese');
    </style>
    <body>
        <div id="fh5co-wrapper">
            <div id="fh5co-page">

                <%@include file="header.jsp" %>
                <%@include file="mainSearchForm.jsp" %>

                <div id="fh5co-tours" class="fh5co-section-gray">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
                                <c:set var="tour" value="${requestScope.TOURDETAILS}"/>
                                <h3 style="font-family: 'Nunito', sans-serif">${tour.journey}</h3>
                                <c:forTokens delims="//" items="${tour.description}" var="des">
                                    <p style="font-family: 'Nunito', sans-serif">${des}</p>
                                </c:forTokens>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 animate-box">
                                <h2 class="heading-title" style="margin-left: 10%;">AGENDA</h2>
                            </div>
                            <div class="col-md-6 animate-box">
                                <c:forTokens items="${tour.agenda}" delims="//" var="agenda">
                                    <p style="font-family: 'Nunito', sans-serif">${agenda}</p>
                                </c:forTokens>
                                <!--<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Pellentesque habitant morbi tristique senectus et netus ett mauada fames ac turpis egestas. Etiam euismod tempor leo, in suscipit urna condimentum sed. Vivamus augue enim, consectetur ac interdum a, pulvinar ac massa. Nullam malesuada congue </p>
                                <p>Pellentesque habitant morbi tristique senectus et netus ett mauada fames ac turpis egestas. Etiam euismod tempor leo, in suscipit urna condimentum sed. Vivamus augue enim, consectetur ac interdum a, pulvinar ac massa. Nullam malesuada congue </p>
                                <a href="#">Read More <i class="icon-arrow-right22"></i></a>-->
                            </div>
                            <div class="col-md-6 animate-box">

                                <div class="row">
                                    <div class="w3-content w3-section" style="max-width:500px; margin-left: 5%; margin-bottom: 75px;">
                                        <c:forEach items="${requestScope.LINKS}" var="link">
                                            <!--<p></p>-->
                                            <img class="mySlides" src="${link}" style="width:100%; height: 450px" />
                                        </c:forEach>
                                    </div>
                                    <script>
                                        var myIndex = 0;
                                        carousel();

                                        function carousel() {
                                            var i;
                                            var x = document.getElementsByClassName("mySlides");
                                            for (i = 0; i < x.length; i++) {
                                                x[i].style.display = "none";
                                            }
                                            myIndex++;
                                            if (myIndex > x.length) {
                                                myIndex = 1
                                            }
                                            x[myIndex - 1].style.display = "block";
                                            setTimeout(carousel, 2000); // Change image every 2 seconds
                                        }
                                    </script>
                                </div>

                                <div class="row">
                                    <c:if test="${not empty requestScope.OUT_OF_QUANTITY}" var="test">
                                        <h4 style="color: red">${requestScope.OUT_OF_QUANTITY}</h4>
                                    </c:if>
                                    <c:if test="${!test}">
                                        <h4 style="color: red">${requestScope.INVALID}</h4>
                                        <h4 style="color: orange; text-align: center">Only have: ${sessionScope.VALID_QUANTITY} slots</h4>
                                    </c:if>

                                </div>


                                <div class="row">
                                    <div class="col-xxs-12 col-xs-12 mt">
                                        <div class="input-field">
                                            <label for="from">Date</label>
                                            <span class="form-control" id="from-place">${tour.timeBegin}</span>
                                            <!--<input type="text" class="form-control" id="from-place" value="${tour.timeBegin}" readonly="true"/>-->
                                        </div>
                                    </div>
                                    <div class="col-sm-12 mt">
                                        <section>
                                            <label for="class">During</label>
                                            <span class="form-control" id="from-place">${tour.timeLiving}</span>
                                            <!--<input type="text" class="form-control" id="from-place" value="${tour.timeLiving}" readonly="true"/>-->
                                        </section>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label for="date-start">Adult Price</label>
                                            <span class="form-control"><fmt:formatNumber type="number" pattern="###,###,###,###"  value="${tour.priceForAdult}" /></span>
                                            <!--<input type="text" class="form-control" value="${tour.priceForAdult}" readonly="true"/>-->
                                        </div>
                                    </div>
                                    <div class="col-xxs-12 col-xs-6 mt alternate">
                                        <div class="input-field">
                                            <label for="date-end">Children Price</label>
                                            <span class="form-control"><fmt:formatNumber type="number" pattern="###,###,###,###"  value="${tour.priceForKid}" /></span>
                                        </div>
                                    </div>
                                    <form action="AccountMainController" method="POST">
                                        <input type="hidden" name="tourID" value="${tour.tourID}"/>
                                        <div class="col-xxs-12 col-xs-6 mt">
                                            <section>
                                                <label for="class">Adult Quantity</label>
                                                <input type="number" min="1" max="${sessionScope.VALID_QUANTITY}" class="form-control" name="numOfAdult" value="1" />
                                            </section>
                                        </div>
                                        <div class="col-xxs-12 col-xs-6 mt">
                                            <section>
                                                <label for="class">Children Quantity</label>
                                                <input type="number" min="0" max="${sessionScope.VALID_QUANTITY - 1}" class="form-control" name="numOfKid" value="0" />
                                            </section>
                                        </div>


                                        <c:if test="${sessionScope.ROLE == 'user' or empty sessionScope.ROLE}">
                                            <div class="col-xs-12">
                                                <button type="submit" class="btn btn-primary btn-block" name="action" value="CheckLogin">BOOK</button>
                                            </div>
                                        </c:if>

                                    </form>
                                </div>
                            </div>
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


