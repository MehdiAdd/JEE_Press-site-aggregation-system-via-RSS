package com.mdad.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;


import com.mdad.model.UrlAndCounts;
import com.mdad.model.UrlFeed;
import com.mdad.model.User;

public interface UrlFeedDao extends CrudRepository<UrlFeed, Integer> {

	@Query(value = "SELECT u FROM UrlFeed u WHERE u.user= :username ")
			List<UrlFeed> getListUrlByUser(@Param("username") User u);
	
	@Query(value = "SELECT u.url as url ,count(u.url) as count FROM UrlFeed u  group by u.url HAVING count >2 order by count desc   LIMIT 3  " , nativeQuery = true)
	List<UrlAndCounts> getUrlAndCount();
}
