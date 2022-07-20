package com.mdad.service;


import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.mdad.model.User;

@Service
public class UserServices {
	
	private static final String POST_users= "http://localhost:8080/users";

	private RestTemplate restTemplate = new RestTemplate();

	public boolean saveUser(String username,String password) {
		User u=new User(username,password);
		Boolean b=restTemplate.postForObject(POST_users, u, Boolean.class);
		boolean bl=b.booleanValue();
		return bl;
		
	}
	

}
