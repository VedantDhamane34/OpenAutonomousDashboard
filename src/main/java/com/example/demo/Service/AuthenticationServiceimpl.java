package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Model.User;
import com.example.demo.Repository.AuthenticationRepository;
import com.example.demo.Servicei.Authenticationservicei;

@Service
public class AuthenticationServiceimpl implements Authenticationservicei{

	@Autowired
	AuthenticationRepository ar;
	
	@Override
	public void saveuser(User u) {
		
		ar.save(u);
		
	}

}
