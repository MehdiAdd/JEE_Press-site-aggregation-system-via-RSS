package com.mdad.dao;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.mdad.model.UrlFeed;
import com.mdad.model.User;

public interface UserDao extends CrudRepository<User,String> {
	
	
	
}
