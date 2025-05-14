package com.model;

public class Encadrer {
    private int idAnimateur;
    private int idPlanning;

    // Constructeur
    public Encadrer(int idAnimateur, int idPlanning) {
        this.idAnimateur = idAnimateur;
        this.idPlanning = idPlanning;
    }

    // Getters et setters
    public int getIdAnimateur() {
        return idAnimateur;
    }

    public void setIdAnimateur(int idAnimateur) {
        this.idAnimateur = idAnimateur;
    }

    public int getIdPlanning() {
        return idPlanning;
    }

    public void setIdPlanning(int idPlanning) {
        this.idPlanning = idPlanning;
    }
}