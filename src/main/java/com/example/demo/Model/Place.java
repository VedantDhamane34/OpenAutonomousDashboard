package com.example.demo.Model;

public class Place {
    
    private String Name;
    private double latitude;
    private double longitude;
    private String working;

    public String getName() {
		return Name;
	}

	public double getLatitude() {
		return latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public String getWorking() {
		return working;
	}

	public Place( String Name, double latitude, double longitude, String working) {        
        this.Name = Name;
        this.latitude = latitude;
        this.longitude = longitude;
        this.working = working;
    }

    

    
}
