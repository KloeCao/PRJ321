/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Kim Anh
 */
public class TourDTO implements Serializable {
    private String tourID, tourCategoryID, journey, description, agenda, departure;
    private Date timeBegin, timeEnd;
    private String timeLiving, picture;
    private float priceForAdult, priceForKid;
    private int quantity;
    private String vehicle, tourGuideID;

    public TourDTO() {
    }

    public TourDTO(String tourID, String journey, String timeLiving, float priceForAdult) {
        this.tourID = tourID;
        this.journey = journey;
        this.timeLiving = timeLiving;
        this.priceForAdult = priceForAdult;
    }

    public TourDTO(String tourID, String journey, Date timeBegin, Date timeEnd, String timeLiving, String picture) {
        this.tourID = tourID;
        this.journey = journey;
        this.timeBegin = timeBegin;
        this.timeEnd = timeEnd;
        this.timeLiving = timeLiving;
        this.picture = picture;
    }

    public TourDTO(String tourID, String tourCategoryID, String journey, String description, String agenda, String departure, Date timeBegin, Date timeEnd, String timeLiving, float priceForAdult, float priceForKid, int quantity, String vehicle, String tourGuideID) {
        this.tourID = tourID;
        this.tourCategoryID = tourCategoryID;
        this.journey = journey;
        this.description = description;
        this.agenda = agenda;
        this.departure = departure;
        this.timeBegin = timeBegin;
        this.timeEnd = timeEnd;
        this.timeLiving = timeLiving;
        this.priceForAdult = priceForAdult;
        this.priceForKid = priceForKid;
        this.quantity = quantity;
        this.vehicle = vehicle;
        this.tourGuideID = tourGuideID;
    }

    public TourDTO(String tourID, String tourCategoryID, String journey, String description, String agenda, String departure, Date timeBegin, Date timeEnd, String timeLiving, String picture, float priceForAdult, float priceForKid, int quantity, String vehicle, String tourGuideID) {
        this.tourID = tourID;
        this.tourCategoryID = tourCategoryID;
        this.journey = journey;
        this.description = description;
        this.agenda = agenda;
        this.departure = departure;
        this.timeBegin = timeBegin;
        this.timeEnd = timeEnd;
        this.timeLiving = timeLiving;
        this.picture = picture;
        this.priceForAdult = priceForAdult;
        this.priceForKid = priceForKid;
        this.quantity = quantity;
        this.vehicle = vehicle;
        this.tourGuideID = tourGuideID;
    }



    public TourDTO(String tourID, String journey, String description, String agenda, String departure, Date timeBegin, String timeLiving, String picture, float priceForAdult, float priceForKid, int quantity, String vehicle, String tourGuideID) {
        this.tourID = tourID;
        this.journey = journey;
        this.description = description;
        this.agenda = agenda;
        this.departure = departure;
        this.timeBegin = timeBegin;
        this.timeLiving = timeLiving;
        this.picture = picture;
        this.priceForAdult = priceForAdult;
        this.priceForKid = priceForKid;
        this.quantity = quantity;
        this.vehicle = vehicle;
        this.tourGuideID = tourGuideID;
    }

    public TourDTO(String tourID, String tourCategoryID, String journey, String description, String agenda, String departure, Date timeBegin, String timeLiving, String picture, float priceForAdult, float priceForKid, int quantity, String vehicle, String tourGuideID) {
        this.tourID = tourID;
        this.tourCategoryID = tourCategoryID;
        this.journey = journey;
        this.description = description;
        this.agenda = agenda;
        this.departure = departure;
        this.timeBegin = timeBegin;
        this.timeLiving = timeLiving;
        this.picture = picture;
        this.priceForAdult = priceForAdult;
        this.priceForKid = priceForKid;
        this.quantity = quantity;
        this.vehicle = vehicle;
        this.tourGuideID = tourGuideID;
    }

    public String getTourID() {
        return tourID;
    }

    public void setTourID(String tourID) {
        this.tourID = tourID;
    }

    public String getTourCategoryID() {
        return tourCategoryID;
    }

    public void setTourCategoryID(String tourCategoryID) {
        this.tourCategoryID = tourCategoryID;
    }

    public String getJourney() {
        return journey;
    }

    public void setJourney(String journey) {
        this.journey = journey;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAgenda() {
        return agenda;
    }

    public void setAgenda(String agenda) {
        this.agenda = agenda;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public Date getTimeBegin() {
        return timeBegin;
    }

    public void setTimeBegin(Date timeBegin) {
        this.timeBegin = timeBegin;
    }

    public String getTimeLiving() {
        return timeLiving;
    }

    public void setTimeLiving(String timeLiving) {
        this.timeLiving = timeLiving;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public float getPriceForAdult() {
        return priceForAdult;
    }

    public void setPriceForAdult(float priceForAdult) {
        this.priceForAdult = priceForAdult;
    }

    public float getPriceForKid() {
        return priceForKid;
    }

    public void setPriceForKid(float priceForKid) {
        this.priceForKid = priceForKid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getVehicle() {
        return vehicle;
    }

    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }

    public String getTourGuideID() {
        return tourGuideID;
    }

    public void setTourGuideID(String tourGuideID) {
        this.tourGuideID = tourGuideID;
    }

    public Date getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Date timeEnd) {
        this.timeEnd = timeEnd;
    }
    
}
