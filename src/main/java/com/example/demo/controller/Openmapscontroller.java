package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Model.Dustbin;
import com.example.demo.Model.Place;

@Controller
public class Openmapscontroller {
	
	@PostMapping("/openmaptraffic")
	public String opentrafficlightmap(@RequestParam String city,Model model) {
		System.out.println(city);
		List<Place> places = new ArrayList<>();

        // Adding traffic lights for Pune
        // For simplicity, let's assume the data for places is provided as arrays of longitude, latitude, and names
        String[] placeNames = {"Traffic Light 1", "Traffic Light 2", "Traffic Light 3", "Traffic Light 4",
                                "Traffic Light 5", "Traffic Light 6", "Traffic Light 7", "Traffic Light 8",
                                "Traffic Light 9", "Traffic Light 10", "Traffic Light 11", "Traffic Light 12"};
        double[] longitudes = {73.82683301, 73.83434972, 73.88455099, 73.87547989, 73.87901979, 73.85838929,
                                73.8459287, 73.89872058, 73.91291568, 73.88326905, 73.86185156, 73.8641295};
        double[] latitudes = {18.50133188, 18.50993577, 18.50640089, 18.50187321, 18.5027049, 18.49658763, 
                                18.50112205, 18.50646447, 18.50625335, 18.539819, 18.47854843, 18.468995};

        
        String[] working= {"Working","Working","Not Working","Working","Working","Not Working",
        		"Working","Working","Not Working","Working","Working","Not Working"};
        // Creating traffic lights for Pune
        for (int i = 0; i < 12; i++) {
            
            places.add(new Place(placeNames[i], latitudes[i], longitudes[i], working[i]));
        }

        model.addAttribute("places", places);
        return "Trafficlightmap";
    }
	@PostMapping("/openstreetmap")
	public String openstreetmap(@RequestParam String city,Model model) {
		System.out.println(city);
		List<Place> places = new ArrayList<>();

        // Adding traffic lights for Pune
        // For simplicity, let's assume the data for places is provided as arrays of longitude, latitude, and names
        String[] placeNames = {"Street Light 1", "Street Light 2", "Street Light 3", "Street Light 4",
                                "Street Light 5", "Street Light 6", "Street Light 7", "Street Light 8",
                                "Street Light 9", "Street Light 10", "Street Light 11", "Street Light 12"};
        double[] longitudes = {73.82683301, 73.83434972, 73.88455099, 73.87547989, 73.87901979, 73.85838929,
                                73.8459287, 73.89872058, 73.91291568, 73.88326905, 73.86185156, 73.8641295};
        double[] latitudes = {18.50133188, 18.50993577, 18.50640089, 18.50187321, 18.5027049, 18.49658763, 
                                18.50112205, 18.50646447, 18.50625335, 18.539819, 18.47854843, 18.468995};

        
        String[] working= {"Working","Working","Not Working","Working","Working","Not Working",
        		"Working","Working","Not Working","Working","Working","Not Working"};
        // Creating traffic lights for Pune
        for (int i = 0; i < 12; i++) {
            
            places.add(new Place(placeNames[i], latitudes[i], longitudes[i], working[i]));
        }

        model.addAttribute("places", places);
        return "Streetlightmap";
	}
	
	@PostMapping("/openwastemanagementmap")
	public String openwastemanagementmap(@RequestParam String city,Model model) {
		System.out.println(city);
		List<Place> places = new ArrayList<>();

        // Adding traffic lights for Pune
        // For simplicity, let's assume the data for places is provided as arrays of longitude, latitude, and names
        String[] placeNames = {"Smart Dustbin 1", "Smart Dustbin 2", "Smart Dustbin 3", "Smart Dustbin 4",
                                "Smart Dustbin 5", "Smart Dustbin 6", "Smart Dustbin 7", "Smart Dustbin 8",
                                "Smart Dustbin 9", "Smart Dustbin 10", "Smart Dustbin 11", "Smart Dustbin 12"};
        double[] longitudes = {73.82683301, 73.83434972, 73.88455099, 73.87547989, 73.87901979, 73.85838929,
                                73.8459287, 73.89872058, 73.91291568, 73.88326905, 73.86185156, 73.8641295};
        double[] latitudes = {18.50133188, 18.50993577, 18.50640089, 18.50187321, 18.5027049, 18.49658763, 
                                18.50112205, 18.50646447, 18.50625335, 18.539819, 18.47854843, 18.468995};

        
        String[] working= {"Working","Working","Working","Working","Working","Working",
        		"Working","Working","Working","Working","Working","Working"};
        // Creating traffic lights for Pune
        for (int i = 0; i < 12; i++) {
            
            places.add(new Place(placeNames[i], latitudes[i], longitudes[i], working[i]));
        }

        model.addAttribute("places", places);
        return "Wastemanagementmap";
	}
	
	@PostMapping("/findoptimalpath")
	public String openoptimalpathmap(Model m) {
		Qlearningservice optimizer = new Qlearningservice();

        List<Dustbin> dustbins = new ArrayList<>();
        dustbins.add(new Dustbin("Smart Dustbin 1", 73.82683301, 18.50133188, 20, true));
        dustbins.add(new Dustbin("Smart Dustbin 2", 73.83434972, 18.50993577, 50, true));
        dustbins.add(new Dustbin("Smart Dustbin 3", 73.88455099, 18.50640089, 70, true));
        dustbins.add(new Dustbin("Smart Dustbin 4", 73.87547989, 18.50187321, 40, true));
        dustbins.add(new Dustbin("Smart Dustbin 5", 73.87901979, 18.5027049, 30, true));
        dustbins.add(new Dustbin("Smart Dustbin 6", 73.85838929, 18.49658763, 10, true));
        dustbins.add(new Dustbin("Smart Dustbin 7", 73.8459287, 18.50112205, 60, true));
        dustbins.add(new Dustbin("Smart Dustbin 8", 73.89872058, 18.50646447, 80, true));
        dustbins.add(new Dustbin("Smart Dustbin 9", 73.91291568, 18.50625335, 90, true));
        dustbins.add(new Dustbin("Smart Dustbin 10", 73.88326905, 18.539819, 20, true));
        dustbins.add(new Dustbin("Smart Dustbin 11", 73.86185156, 18.47854843, 30, true));
        dustbins.add(new Dustbin("Smart Dustbin 12", 73.8641295, 18.468995, 40, true));
		List<Dustbin> optimizedPath = optimizer.optimizePath(dustbins);
		m.addAttribute("dustbins", optimizedPath);
		
		return "Optimalpathmap";
	}
	
	
}
	

