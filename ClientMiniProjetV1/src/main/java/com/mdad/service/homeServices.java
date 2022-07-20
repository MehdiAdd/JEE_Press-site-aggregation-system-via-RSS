package com.mdad.service;



import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.mdad.model.ArticleALire;
import com.mdad.model.Item;
import com.mdad.model.UrlAndCounts;
import com.mdad.model.UrlFeed;
import com.mdad.model.User;
import com.sun.syndication.feed.synd.SyndCategoryImpl;

@Service
public class homeServices {
	private static final String GET_tendanceArticles= "http://localhost:8080/tendanceArticles";
	private static final String GET_homeArticles= "http://localhost:8080/homeArticles";
	private static final String GET_homeCategories= "http://localhost:8080/homeCategories";
	private static final String GET_tendanceCategories= "http://localhost:8080/tendanceCategories";
	private static final String GET_sites= "http://localhost:8080/sites";
	private static final String GET_artciles= "http://localhost:8080/articles";
	
	
	private static final String POST_sites= "http://localhost:8080/sites";
	private static final String POST_artciles= "http://localhost:8080/articles";
	private static final String POST_users= "http://localhost:8080/users";
	
	private static final String GET_Check= "http://localhost:8080/sitesCheck";

	
	private static final String DELETE_sites= "http://localhost:8080/sites";
	private static final String DELETE_articles= "http://localhost:8080/articles";

	private RestTemplate restTemplate = new RestTemplate();
	
	
	
	public List<Item> articlesTendance(String categorie) {
		Item[] tab=restTemplate.getForObject(GET_tendanceArticles+"?categorie="+categorie, Item[].class);
		List<Item> list = new ArrayList();
		  Collections.addAll(list, tab);
		return list;
				
	}
	
	public List<Item> itemsOfIn(String username, String categorie) {
		Item[] tab=restTemplate.getForObject(GET_homeArticles+"?username="+username+"&categorie="+categorie, Item[].class);
		List<Item> list = new ArrayList();
		  Collections.addAll(list, tab);
		return list;
	
	}
	
	
	
	public List<SyndCategoryImpl> CategoriesHome(String username) {
		SyndCategoryImpl[] tab=restTemplate.getForObject(GET_homeCategories+"?username="+username, SyndCategoryImpl[].class);
		List<SyndCategoryImpl> list = new ArrayList();
		  Collections.addAll(list, tab);
		return list;
	}
	
	public List<SyndCategoryImpl> CategoriesTendance() {
		SyndCategoryImpl[] tab=restTemplate.getForObject(GET_tendanceCategories, SyndCategoryImpl[].class);
		List<SyndCategoryImpl> list = new ArrayList();
		  Collections.addAll(list, tab);
		return list;
	}

	
	public boolean checkSiteRss(String site) {
	String b=restTemplate.getForObject(GET_Check+"?site="+site,String.class);
	boolean bl=Boolean.parseBoolean(b);
	return bl;
	
	
	}
	
	public void addSiteRss(String site,String username) {
		UrlFeed u=new UrlFeed();
		u.setUrl(site);
		User usr=new User();
		usr.setUsername(username);
		u.setUser(usr);
		restTemplate.postForObject(POST_sites, u, UrlFeed.class);
	}
	
	public void removeSiteRss(int id) {
		restTemplate.delete(DELETE_sites+"/"+id);
	}
	
	public List<UrlFeed> listSiteRssof(String username){
		UrlFeed[] tab=restTemplate.getForObject(GET_sites+"/"+username, UrlFeed[].class);
		List<UrlFeed> list = new ArrayList();
		  Collections.addAll(list, tab);
		return list;
	}
	
	

	public void aLire(String titre, String link,String username) {
		ArticleALire u=new ArticleALire();
		u.setTitre(titre);
		u.setLink(link);
		User usr=new User();
		usr.setUsername(username);
		u.setUser(usr);
		restTemplate.postForObject(POST_artciles, u, UrlFeed.class);
	}
	
	public void removeALire(int id) {
		restTemplate.delete(DELETE_articles+"/"+id);
	}
	
	public List<ArticleALire> listALireof(String username ){
		ArticleALire[] tab=restTemplate.getForObject(GET_artciles+"/"+username, ArticleALire[].class);
		List<ArticleALire> list = new ArrayList();
		  Collections.addAll(list, tab);
		return list;
	}

}
