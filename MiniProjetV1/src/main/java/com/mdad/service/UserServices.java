package com.mdad.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mdad.dao.UserDao;
import com.mdad.model.User;

@Service
public class UserServices {
	@Autowired
	private UserDao repository;
	public boolean saveUser(String username,String password) {
		//User u=new User();
		if(repository.existsById(username)) return false;
		User u=new User(username,password);
		repository.save(u);
		return true;
	}
	

}
