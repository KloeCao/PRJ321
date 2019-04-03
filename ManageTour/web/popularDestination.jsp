<%-- 
    Document   : populardestination
    Created on : Feb 28, 2019, 4:49:51 PM
    Author     : Kim Anh
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="fh5co-destination">
                    <div class="tour-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <ul id="fh5co-destination-list" class="animate-box">
                                    <li class="one-forth text-center" style="background-image: url(images/AFR1/NamPhi_Table_Mountain.jpg); ">
                                        <c:url value="TourMainController" var="Search">
                                            <c:param name="action" value="SearchByDestination"/>
                                            <c:param name="destination" value="Africa"/>
                                            <c:param name="startDate" value=""/>
                                            <c:param name="endDate" value=""/>
                                        </c:url>
                                        <a href="${Search}">
                                            <div class="case-studies-summary">
                                                <h2>Africa</h2>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="one-forth text-center" style="background-image: url(images/AME2/Independence-Hall-Philadelphia_276721367.jpg); ">
                                        <c:url value="TourMainController" var="Search">
                                            <c:param name="action" value="SearchByDestination"/>
                                            <c:param name="destination" value="America"/>
                                            <c:param name="startDate" value=""/>
                                            <c:param name="endDate" value=""/>
                                        </c:url>
                                        <a href="${Search}">
                                            <div class="case-studies-summary">
                                                <h2>USA</h2>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="one-forth text-center" style="background-image: url(images/ASIA3/Oshino-Hakkai_646775065.jpg); ">
                                        <c:url value="TourMainController" var="Search">
                                            <c:param name="action" value="SearchByDestination"/>
                                            <c:param name="destination" value="Japan"/>
                                            <c:param name="startDate" value=""/>
                                            <c:param name="endDate" value=""/>
                                        </c:url>
                                        <a href="${Search}">
                                            <div class="case-studies-summary">
                                                <h2>Japan</h2>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="one-forth text-center" style="background-image: url(images/AUS2/Dandenong-Ranges_1007971966.jpg); ">
                                        <c:url value="TourMainController" var="Search">
                                            <c:param name="action" value="SearchByDestination"/>
                                            <c:param name="destination" value="Australia"/>
                                            <c:param name="startDate" value=""/>
                                            <c:param name="endDate" value=""/>
                                        </c:url>
                                        <a href="${Search}">
                                            <div class="case-studies-summary">
                                                <h2>Australia</h2>
                                            </div>
                                        </a>
                                    </li>

                                    <li class="one-forth text-center" style="background-image: url(images/EURO3/Clock-in-Gastown-Vancouver_737977453.jpg); ">
                                        <c:url value="TourMainController" var="Search">
                                            <c:param name="action" value="SearchByDestination"/>
                                            <c:param name="destination" value="France"/>
                                            <c:param name="startDate" value=""/>
                                            <c:param name="endDate" value=""/>
                                        </c:url>
                                        <a href="${Search}">
                                            <div class="case-studies-summary">
                                                <h2>France</h2>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="one-half text-center">
                                        <div class="title-bg">
                                            <div class="case-studies-summary">
                                                <h2>THE MOST POPULAR DESTINATION</h2>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="one-forth text-center" style="background-image: url(images/MVN1/thanh-pho-da-lat.jpg); ">
                                        <c:url value="TourMainController" var="Search">
                                            <c:param name="action" value="SearchByDestination"/>
                                            <c:param name="destination" value="Da Lat"/>
                                            <c:param name="startDate" value=""/>
                                            <c:param name="endDate" value=""/>
                                        </c:url>
                                        <a href="${Search}">
                                            <div class="case-studies-summary">
                                                <h2>Da Lat</h2>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="one-forth text-center" style="background-image: url(images/NVN2/kinh-nghiem-du-lich-phuot-quang-ninh.jpg); ">
                                        <c:url value="TourMainController" var="Search">
                                            <c:param name="action" value="SearchByDestination"/>
                                            <c:param name="destination" value="Quang Ninh"/>
                                            <c:param name="startDate" value=""/>
                                            <c:param name="endDate" value=""/>
                                        </c:url>
                                        <a href="${Search}">
                                            <div class="case-studies-summary">
                                                <h2>Quang Ninh</h2>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="one-forth text-center" style="background-image: url(images/SVN5/du-lich-dao-Nam-Du.jpg); ">
                                        <c:url value="TourMainController" var="Search">
                                            <c:param name="action" value="SearchByDestination"/>
                                            <c:param name="destination" value="Nam Du"/>
                                            <c:param name="startDate" value=""/>
                                            <c:param name="endDate" value=""/>
                                        </c:url>
                                        <a href="${Search}">
                                            <div class="case-studies-summary">
                                                <h2>Nam Du</h2>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="one-forth text-center" style="background-image: url(images/SVN1/phu-quoc.jpg); ">
                                        <c:url value="TourMainController" var="Search">
                                            <c:param name="action" value="SearchByDestination"/>
                                            <c:param name="destination" value="Phu Quoc"/>
                                            <c:param name="startDate" value=""/>
                                            <c:param name="endDate" value=""/>
                                        </c:url>
                                        <a href="${Search}">
                                            <div class="case-studies-summary">
                                                <h2>Phu Quoc</h2>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="one-forth text-center" style="background-image: url(images/ASIA5/Yongduam-Rock-Dragon-Head-Rock-in-Jeju-island-Korea_542418949.jpg); ">
                                        <c:url value="TourMainController" var="Search">
                                            <c:param name="action" value="SearchByDestination"/>
                                            <c:param name="destination" value="Korea"/>
                                            <c:param name="startDate" value=""/>
                                            <c:param name="endDate" value=""/>
                                        </c:url>
                                        <a href="${Search}">
                                            <div class="case-studies-summary">
                                                <h2>Korea</h2>
                                            </div>
                                        </a>
                                    </li>
                                </ul>		
                            </div>
                        </div>
                    </div>
                </div>