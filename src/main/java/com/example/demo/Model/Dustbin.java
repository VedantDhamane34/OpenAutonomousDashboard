package com.example.demo.Model;

public class Dustbin {
    private String placeName;
    private double longitude;
    private double latitude;
    private double fillLevel;
    private boolean working;

    public Dustbin(String placeName, double longitude, double latitude, double fillLevel, boolean working) {
        this.placeName = placeName;
        this.longitude = longitude;
        this.latitude = latitude;
        this.fillLevel = fillLevel;
        this.working = working;
    }

    public String getPlaceName() {
        return placeName;
    }

    public double getLongitude() {
        return longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public double getFillLevel() {
        return fillLevel;
    }

    public boolean isWorking() {
        return working;
    }

    public void setFillLevel(double fillLevel) {
        this.fillLevel = fillLevel;
    }
}
