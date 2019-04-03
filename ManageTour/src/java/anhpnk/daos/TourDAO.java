/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.daos;

import anhpnk.conn.MyConnection;
import anhpnk.dtos.TourDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Kim Anh
 */
public class TourDAO {

    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    public TourDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public TourDTO searchTourByID(String tourID) throws Exception {
        TourDTO result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select tourID, journey, description, agenda, departure, timeBegin, timeLiving, picture, priceForAdult, priceForKid, quantityPassenger, vehicle, tourGuideID "
                    + "From Tour Where tourID=?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourID);
            rs = preStm.executeQuery();
            String journey, description, agenda, departure, timeLiving, picture, vehicle, tourGuideID;
            Date timeBegin;
            float priceForAdult, priceForKid;
            int quantity;
            if (rs.next()) {
                journey = rs.getString("journey");
                description = rs.getString("description");
                agenda = rs.getString("agenda");
                departure = rs.getString("departure");
                timeBegin = rs.getDate("timeBegin");
                timeLiving = rs.getString("timeLiving");
                picture = rs.getString("picture");
                priceForAdult = rs.getFloat("priceForAdult");
                priceForKid = rs.getFloat("priceForKid");
                quantity = rs.getInt("quantityPassenger");
                vehicle = rs.getString("vehicle");
                tourGuideID = rs.getString("tourGuideID");
                result = new TourDTO(tourID, journey, description, agenda, departure, timeBegin, timeLiving, picture, priceForAdult, priceForKid, quantity, vehicle, tourGuideID);

            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> searchTourByCategory(String categoryID) throws Exception {
        List<TourDTO> result = null;
        try {
            long date = System.currentTimeMillis();
            Date today = new Date(date);
            conn = MyConnection.getMyConnection();
            String sql = "Select tourID, journey, timeLiving, priceForAdult, picture From Tour Where tourCategoryID = ? and timeBegin > ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, categoryID);
            preStm.setDate(2, today);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            String tourID, journey, timeLiving, picture;
            float priceForAdult;
            while (rs.next()) {
                tourID = rs.getString("tourID");
                journey = rs.getString("journey");
                timeLiving = rs.getString("timeLiving");
                priceForAdult = rs.getFloat("priceForAdult");
                picture = rs.getString("picture");
                TourDTO dto = new TourDTO(tourID, journey, timeLiving, priceForAdult);
                dto.setPicture(picture);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> searchTourByDestination(String destination) throws Exception {
        List<TourDTO> result = null;
        try {
            long date = System.currentTimeMillis();
            Date today = new Date(date);
            conn = MyConnection.getMyConnection();
            String sql = "Select tourID, journey, timeLiving, priceForAdult, picture From Tour Where journey Like ? and timeBegin > ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + destination + "%");
            preStm.setDate(2, today);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            String tourID, journey, timeLiving, picture;
            float priceForAdult;
            while (rs.next()) {
                tourID = rs.getString("tourID");
                journey = rs.getString("journey");
                timeLiving = rs.getString("timeLiving");
                priceForAdult = rs.getFloat("priceForAdult");
                picture = rs.getString("picture");
                TourDTO dto = new TourDTO(tourID, journey, timeLiving, priceForAdult);
                dto.setPicture(picture);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public float[] getPriceOfTour(String tourID) throws Exception {
        float[] result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select priceForAdult, priceForKid From Tour Where tourID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourID);
            rs = preStm.executeQuery();
            result = new float[2];
            if (rs.next()) {
                result[0] = rs.getFloat("priceForAdult");
                result[1] = rs.getFloat("priceForKid");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getTourNameByTourID(String tourID) throws Exception {
        String result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select journey From Tour Where tourID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("journey");
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> searchTourByTime(Date startDate, Date endDate) throws Exception {
        List<TourDTO> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select tourID, journey, timeLiving, priceForAdult, picture From Tour Where timeBegin > ? and timeEnd < ?";
            preStm = conn.prepareStatement(sql);
            preStm.setDate(1, startDate);
            preStm.setDate(2, endDate);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            String tourID, journey, timeLiving, picture;
            float priceForAdult;
            while (rs.next()) {
                tourID = rs.getString("tourID");
                journey = rs.getString("journey");
                timeLiving = rs.getString("timeLiving");
                priceForAdult = rs.getFloat("priceForAdult");
                picture = rs.getString("picture");
                TourDTO dto = new TourDTO(tourID, journey, timeLiving, priceForAdult);
                dto.setPicture(picture);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> getNearestTour(Date today) throws Exception {
        List<TourDTO> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select tourID, journey, timeLiving, priceForAdult, picture From Tour Where timeBegin > ? and timeBegin < DATEADD(day, 15, ?)";
            preStm = conn.prepareStatement(sql);
            preStm.setDate(1, today);
            preStm.setDate(2, today);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            String tourID, journey, timeLiving, picture;
            float priceForAdult;
            while (rs.next()) {
                tourID = rs.getString("tourID");
                journey = rs.getString("journey");
                timeLiving = rs.getString("timeLiving");
                priceForAdult = rs.getFloat("priceForAdult");
                picture = rs.getString("picture");
                TourDTO dto = new TourDTO(tourID, journey, timeLiving, priceForAdult);
                dto.setPicture(picture);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> searchByDateAndName(Date startDate, Date endDate, String name) throws Exception {
        List<TourDTO> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select tourID, journey, timeLiving, priceForAdult, picture From Tour Where timeBegin > ? and timeEnd < ? and journey Like ?";
            preStm = conn.prepareStatement(sql);
            preStm.setDate(1, startDate);
            preStm.setDate(2, endDate);
            preStm.setString(3, "%" + name + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            String tourID, journey, timeLiving, picture;
            float priceForAdult;
            while (rs.next()) {
                tourID = rs.getString("tourID");
                journey = rs.getString("journey");
                timeLiving = rs.getString("timeLiving");
                priceForAdult = rs.getFloat("priceForAdult");
                picture = rs.getString("picture");
                TourDTO dto = new TourDTO(tourID, journey, timeLiving, priceForAdult);
                dto.setPicture(picture);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> searchByTimeBegin(String name, Date startDate) throws Exception {
        List<TourDTO> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select tourID, journey, timeLiving, priceForAdult, picture From Tour Where timeBegin >= ? and  journey Like ?";
            preStm = conn.prepareStatement(sql);
            preStm.setDate(1, startDate);
            preStm.setString(2, "%" + name + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            String tourID, journey, timeLiving, picture;
            float priceForAdult;
            while (rs.next()) {
                tourID = rs.getString("tourID");
                journey = rs.getString("journey");
                timeLiving = rs.getString("timeLiving");
                priceForAdult = rs.getFloat("priceForAdult");
                picture = rs.getString("picture");
                TourDTO dto = new TourDTO(tourID, journey, timeLiving, priceForAdult);
                dto.setPicture(picture);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> searchByTimeEnd(String name, Date endDate) throws Exception {
        List<TourDTO> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select tourID, journey, timeLiving, priceForAdult, picture From Tour Where timeEnd <= ? and  journey Like ?";
            preStm = conn.prepareStatement(sql);
            preStm.setDate(1, endDate);
            preStm.setString(2, "%" + name + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            String tourID, journey, timeLiving, picture;
            float priceForAdult;
            while (rs.next()) {
                tourID = rs.getString("tourID");
                journey = rs.getString("journey");
                timeLiving = rs.getString("timeLiving");
                priceForAdult = rs.getFloat("priceForAdult");
                picture = rs.getString("picture");
                TourDTO dto = new TourDTO(tourID, journey, timeLiving, priceForAdult);
                dto.setPicture(picture);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getRemainDays(String tourID) throws Exception {
        int result = -1;
        try {
            long date = System.currentTimeMillis();
            Date today = new Date(date);
            conn = MyConnection.getMyConnection();
            String sql = "select DATEDIFF(day, ?, timeBegin) as numOfDays From TourManagement.dbo.Tour where tourID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setDate(1, today);
            preStm.setString(2, tourID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("numOfDays");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> getTourOfGuide(String tourGuideID) throws Exception {
        List<TourDTO> result = null;
        try {
            long date = System.currentTimeMillis();
            Date today = new Date(date);
            conn = MyConnection.getMyConnection();
            String sql = "Select tourID, journey, picture, timeBegin, timeEnd, timeLiving From Tour Where tourGuideID = ? and timeBegin > ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourGuideID);
            preStm.setDate(2, today);
            rs = preStm.executeQuery();
            String tourID, journey, picture, timeLiving;
            Date timeBegin, timeEnd;
            TourDTO tour = null;
            result = new ArrayList<>();
            while (rs.next()) {
                tourID = rs.getString("tourID");
                journey = rs.getString("journey");
                picture = rs.getString("picture");
                timeBegin = rs.getDate("timeBegin");
                timeEnd = rs.getDate("timeEnd");
                timeLiving = rs.getString("timeLiving");
                tour = new TourDTO(tourID, journey, timeBegin, timeEnd, timeLiving, picture);
                result.add(tour);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<String> getTourGuideNotFree(Date timeBegin, Date timeEnd) throws Exception {
        List<String> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select Distinct T.tourGuideID "
                    + "From Tour T "
                    + "Join Account AC on T.tourGuideID = AC.username "
                    + "Where timeBegin >= ? And timeEnd <= ? And AC.status = 1";
            preStm = conn.prepareStatement(sql);
            preStm.setDate(1, timeBegin);
            preStm.setDate(2, timeEnd);
            rs = preStm.executeQuery();
            String id;
            result = new ArrayList<>();
            while (rs.next()) {
                id = rs.getString("tourGuideID");
                result.add(id);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insert(TourDTO tour) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert Into "
                    + "Tour(tourID, tourCategoryID, journey, description, agenda, departure, timeBegin, timeEnd, timeLiving, picture, priceForAdult, priceForKid, quantityPassenger, vehicle, tourGuideID) "
                    + "Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tour.getTourID());
            preStm.setString(2, tour.getTourCategoryID());
            preStm.setString(3, tour.getJourney());
            preStm.setString(4, tour.getDescription());
            preStm.setString(5, tour.getAgenda());
            preStm.setString(6, tour.getDeparture());
            preStm.setDate(7, tour.getTimeBegin());
            preStm.setDate(8, tour.getTimeEnd());
            preStm.setString(9, tour.getTimeLiving());
            preStm.setString(10, tour.getPicture());
            preStm.setFloat(11, tour.getPriceForAdult());
            preStm.setFloat(12, tour.getPriceForKid());
            preStm.setInt(13, tour.getQuantity());
            preStm.setString(14, tour.getVehicle());
            preStm.setString(15, tour.getTourGuideID());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumOfTourByCategory(String categoryID) throws Exception {
        int result = -1;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select Count(tourID) as quantity From Tour Where tourCategoryID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, categoryID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("quantity");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public HashMap<String, String> getTourForUpdate() throws Exception {
        HashMap<String, String> result = null;
        try {
            conn = MyConnection.getMyConnection();
            long date = System.currentTimeMillis();
            Date today = new Date(date);
            String sql = "Select tourID, journey From Tour Where timeBegin > ?";
            preStm = conn.prepareStatement(sql);
            preStm.setDate(1, today);
            rs = preStm.executeQuery();
            result = new HashMap<>();
            String tourID, journey;
            while (rs.next()) {
                tourID = rs.getString("tourID");
                journey = rs.getString("journey");
                result.put(tourID, journey);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public TourDTO getTourDetails(String tourID) throws Exception {
        TourDTO result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select tourID, tourCategoryID, journey, description, agenda, departure, timeBegin, timeEnd, timeLiving, priceForAdult, priceForKid, quantityPassenger, vehicle, tourGuideID "
                    + "From Tour Where tourID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourID);
            rs = preStm.executeQuery();
            String tourCategoryID, journey, description, agenda, departure, timeLiving, vehicle, tourGuideID;
            Date timeBegin, timeEnd;
            float priceForAdult, priceForKid;
            int quantityPassenger;
            while (rs.next()) {
                tourCategoryID = rs.getString("tourCategoryID");
                journey = rs.getString("journey");
                description = rs.getString("description");
                agenda = rs.getString("agenda");
                departure = rs.getString("departure");
                timeLiving = rs.getString("timeLiving");
                vehicle = rs.getString("vehicle");
                tourGuideID = rs.getString("tourGuideID");
                timeBegin = rs.getDate("timeBegin");
                timeEnd = rs.getDate("timeEnd");
                priceForAdult = rs.getFloat("priceForAdult");
                priceForKid = rs.getFloat("priceForKid");
                quantityPassenger = rs.getInt("quantityPassenger");
                result = new TourDTO(tourID, tourCategoryID, journey, description, agenda, departure, timeBegin, timeEnd, timeLiving, priceForAdult, priceForKid, quantityPassenger, vehicle, tourGuideID);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean updatePicture(String tourID, String picture) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Tour Set picture = ? Where tourID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, picture);
            preStm.setString(2, tourID);
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean update(TourDTO tour) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Tour Set "
                    + "tourCategoryID = ?, "
                    + "journey = ?, "
                    + "description = ?, "
                    + "agenda = ?, "
                    + "departure = ?, "
                    + "timeBegin = ?, "
                    + "timeEnd = ?, "
                    + "timeLiving = ?, "
                    + "priceForAdult = ?, "
                    + "priceForKid = ?, "
                    + "quantityPassenger = ?, "
                    + "vehicle = ?, "
                    + "tourguideID = ? "
                    + "Where tourID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tour.getTourCategoryID());
            preStm.setString(2, tour.getJourney());
            preStm.setString(3, tour.getDescription());
            preStm.setString(4, tour.getAgenda());
            preStm.setString(5, tour.getDeparture());
            preStm.setDate(6, tour.getTimeBegin());
            preStm.setDate(7, tour.getTimeEnd());
            preStm.setString(8, tour.getTimeLiving());
            preStm.setFloat(9, tour.getPriceForAdult());
            preStm.setFloat(10, tour.getPriceForKid());
            preStm.setInt(11, tour.getQuantity());
            preStm.setString(12, tour.getVehicle());
            preStm.setString(13, tour.getTourGuideID());
            preStm.setString(14, tour.getTourID());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
}
