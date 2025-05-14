package com.dao;

import com.model.Planning;
import com.model.Creneau;
import com.idk.DataBaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlanningDAO {
    private com.dao.CreneauDAO creneauDAO = new com.dao.CreneauDAO();

    public void ajouterPlanning(Planning planning) throws SQLException {
        String sql = "INSERT INTO planning (dateDebut, dateFin) VALUES (?, ?)";
        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setDate(1, new java.sql.Date(planning.getDateDebut().getTime()));
            pstmt.setDate(2, new java.sql.Date(planning.getDateFin().getTime()));
            pstmt.executeUpdate();

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    planning.setIdPlanning(generatedKeys.getInt(1));
                }
            }
        }
    }

    public void modifierPlanning(Planning planning) throws SQLException {
        String sql = "UPDATE planning SET dateDebut = ?, dateFin = ? WHERE idPlanning = ?";
        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setDate(1, new java.sql.Date(planning.getDateDebut().getTime()));
            pstmt.setDate(2, new java.sql.Date(planning.getDateFin().getTime()));
            pstmt.setInt(3, planning.getIdPlanning());
            pstmt.executeUpdate();
        }
    }

    public void supprimerPlanning(int idPlanning) throws SQLException {
        String sql = "DELETE FROM planning WHERE id_planning = ?";
        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPlanning);
            pstmt.executeUpdate();
        }
    }

    public Planning getPlanningById(int idPlanning) throws SQLException {
        String sql = "SELECT * FROM planning WHERE idPlanning = ?";
        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPlanning);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Planning planning = extractPlanningFromResultSet(rs);
                    planning.setCreneaux(creneauDAO.getCreneauxByPlanningId(idPlanning));
                    return planning;
                }
            }
        }
        return null;
    }

    public List<Planning> getAllPlannings() throws SQLException {
        List<Planning> plannings = new ArrayList<>();
        String sql = "SELECT * FROM planning";
        try (Connection conn = DataBaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Planning planning = extractPlanningFromResultSet(rs);
                planning.setCreneaux(creneauDAO.getCreneauxByPlanningId(planning.getIdPlanning()));
                plannings.add(planning);
            }
        }
        return plannings;
    }

    private Planning extractPlanningFromResultSet(ResultSet rs) throws SQLException {
        return new Planning(
                rs.getInt("idPlanning"),
                rs.getDate("dateDebut"),
                rs.getDate("dateFin")
        );
    }
}
