<%-- 
    Document   : mainsearchform
    Created on : Feb 28, 2019, 3:48:30 PM
    Author     : Kim Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="fh5co-hero">
                    <div class="fh5co-overlay"></div>
                    <div class="fh5co-cover" data-stellar-background-ratio="0.5" style="background-image: url(images/backgroundHomePage.jpg);">
                        <div class="desc">
                            <div class="container" >
                                <div class="row">
                                    <div class="col-sm-5 col-md-5">
                                        <div class="tabulation animate-box">
                                            <div class="tab-content">

                                                <div role="tabpanel" class="tab-pane active" id="packages">
                                                    <div class="row">
                                                        <form action="TourMainController" method="POST">
                                                            <div class="col-xxs-12 col-xs-12 mt">
                                                                <div class="input-field">
                                                                    <label for="from">Destination</label>
                                                                    <input type="text" class="form-control" id="from-place" placeholder="Where do you want to go?" name="destination"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-xxs-12 col-xs-6 mt alternate">
                                                                <div class="input-field">
                                                                    <label for="date-start">FROM</label>
                                                                    <input type="text" class="form-control" id="date-start" placeholder="mm/dd/yyyy" name="startDate"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-xxs-12 col-xs-6 mt alternate">
                                                                <div class="input-field">
                                                                    <label for="date-end">TO</label>
                                                                    <input type="text" class="form-control" id="date-end" placeholder="mm/dd/yyyy" name="endDate"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12">
                                                                <button type="submit" class="btn btn-primary btn-block" value="SearchByDestination" name="action">SEARCH</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="desc2 animate-box">
                                        <div class="col-sm-7 col-sm-push-1 col-md-7 col-md-push-1">
                                            <p>Vietnam Tour</p>
                                            <h2>TRIP FOR SUMMER HOLIDAY</h2>
                                            <h3>Explore the most beautiful place</h3>
                                            <span class="price">Only 4.000$</span>
                                            <!-- <p><a class="btn btn-primary btn-lg" href="#">Get Started</a></p> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
