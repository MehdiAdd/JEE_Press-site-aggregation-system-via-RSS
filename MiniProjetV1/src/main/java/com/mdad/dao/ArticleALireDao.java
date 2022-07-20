package com.mdad.dao;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.mdad.model.ArticleALire;
import com.mdad.model.User;

public interface ArticleALireDao extends CrudRepository<ArticleALire, Integer> {

	@Query(value = "SELECT * FROM ArticleALire u WHERE u.user= :username")
	List<ArticleALire> getArticleALireByUser(@Param("username") User u);
}
