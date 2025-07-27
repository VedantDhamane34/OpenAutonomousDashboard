package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Model.User;
import com.example.demo.Servicei.Authenticationservicei;

@Controller
public class AuthenticationController {

	@Autowired
	Authenticationservicei as;
	
	
	@GetMapping("/")
	public String prelogin() {
		return "Login";
	}
	@GetMapping("/opensignup")
	public String opensignup() {
		return "Signup";
	}
	@GetMapping("/openwastedashboard")
	public String openwastedashboard() {
		return "Wastemanagementdashboard";
	}
	@PostMapping("/signupsuccessfull")
	public String signupsuccessfull(@ModelAttribute User u) {
		as.saveuser(u);
		return "Personaldashboard";
	}
	@PostMapping("/loginsuccessfull")
	public String loginsuccessfull(@ModelAttribute User u) {
		if(u.getUsername().equals("WasteMH") && u.getPassword().equals("WasteMH")) {
			return "Wastemanagementdashboard";
		}
		else if(u.getUsername().equals("TrafficMH") && u.getPassword().equals("TrafficMH")) {
			return "Trafficlightdashboard";
		}
		else if(u.getUsername().equals("StreetlightsMH") && u.getPassword().equals("StreetlightsMH")) {
			return "Streetlightdashboard";
		}
		else if(u.getUsername().equals("USER123") && u.getPassword().equals("USER123")) {
			return "Personaldashboard";
		}
		else {
			return "Login";
		}
	}
	@PostMapping("/opencarmainpage")
	public String opencarmain(@RequestParam String modelNo,@RequestParam String vehicleId) {
		if(modelNo.equals("123abc") && vehicleId.equals("8323")) {
			return "Carmain";
		}
		return "Personaldashboard";
	}
	
	@RequestMapping("/openstats")
	public String openstats() {
		return "Carstats";
	}

	
	
	
}
