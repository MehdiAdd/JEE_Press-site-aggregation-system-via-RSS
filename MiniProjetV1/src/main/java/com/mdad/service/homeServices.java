package com.mdad.service;



import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.hibernate.service.spi.InjectService;
import org.jdom.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.mdad.dao.ArticleALireDao;
import com.mdad.dao.UrlFeedDao;
import com.mdad.dao.UserDao;
import com.mdad.model.ArticleALire;
import com.mdad.model.Flux;
import com.mdad.model.Item;
import com.mdad.model.UrlAndCounts;
import com.mdad.model.UrlFeed;
import com.mdad.model.User;
import com.sun.syndication.feed.synd.SyndCategoryImpl;
import com.sun.syndication.feed.synd.SyndEnclosure;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

@Service
public class homeServices {
	static int id=1;
	@Autowired
	UrlFeedDao urlRepo;
	@Autowired
	UserDao usrRepo;
	@Autowired
	ArticleALireDao aLireRepo;
	@InjectService
	public List<Item> articlesTendance(String categorie) {

		URL feedSource;
		List<UrlAndCounts> urlfeed = urlRepo.getUrlAndCount();
		Flux flux = new Flux();
		List<String> categories=new ArrayList<>();
		int count;
		for (UrlAndCounts u : urlfeed) {
			
			try {
				feedSource = new URL(u.getUrl() );
				SyndFeedInput input = new SyndFeedInput();
				XmlReader xml = new XmlReader(feedSource);
				SyndFeed feed = input.build(xml);
				
				List<SyndEntry> list1 = (List<SyndEntry>) feed.getEntries();
				for (SyndEntry e : list1) {
					count=0;
					Item i = new Item(id++,e.getAuthor(), e.getDescription().getValue(),  e.getLink(),e.getTitle(),e.getPublishedDate());
					i.setCategories(e.getCategories());
                      for(String cat:i.getCategories())
                      {
                    	  if(categories.contains(cat)) count++;
                      }
                     // System.out.println("\n"+i.getCategories().size()+" count "+count);
                      
					if(count<i.getCategories().size()) {
					if (categorie.equals("")) {
						flux.addItem(i);
						categories.addAll(i.getCategories());
						
					} else if (i.getCategories().contains(categorie)) {
						
							flux.addItem(i);
							categories.addAll(i.getCategories());
					}
					}
				}

			} catch (IOException | IllegalArgumentException | FeedException e1) {
				System.out.println("URL not FOUND"+e1.getMessage()+"  "+e1.getCause());
			}

		}
		
		
		return flux.getItems();
	}
	
	
	public List<Item> itemsOfIn(String username, String categorie) {
		
		URL feedSource;
		Optional<User> us = usrRepo.findById(username);
		User usr = us.get();
		
		List<UrlFeed> urlfeed = urlRepo.getListUrlByUser(usr);
		Flux flux = new Flux();
		
		List<String> categories=new ArrayList<>();
		int count;
		for (UrlFeed u : urlfeed) {
			
			try {
				feedSource = new URL(u.getUrl() );
				SyndFeedInput input = new SyndFeedInput();
				XmlReader xml = new XmlReader(feedSource);
				SyndFeed feed = input.build(xml);
				
				List<SyndEntry> list1 = (List<SyndEntry>) feed.getEntries();
				for (SyndEntry e : list1) {
					count=0;
					Item i = new Item(id++,e.getAuthor(), e.getDescription().getValue(),  e.getLink(),e.getTitle(),e.getPublishedDate());
					i.setCategories(e.getCategories());
                      for(String cat:i.getCategories())
                      {
                    	  if(categories.contains(cat)) count++;
                      }
                     // System.out.println("\n"+i.getCategories().size()+" count "+count);
                      
					if(count<i.getCategories().size()) {
					if (categorie.equals("")) {
						flux.addItem(i);
						categories.addAll(i.getCategories());
						
					} else if (i.getCategories().contains(categorie)) {
						
							flux.addItem(i);
							categories.addAll(i.getCategories());
					}
					}
				}

			} catch (IOException | IllegalArgumentException | FeedException e1) {
				System.out.println("URL not FOUND"+e1.getMessage()+"  "+e1.getCause());
			}

		}
		
		
		return flux.getItems();
	}
	
	
	
	public List<SyndCategoryImpl> CategoriesHome(String username) {

		URL feedSource;
		List<SyndCategoryImpl> categories=new ArrayList<>();
		Optional<User> us = usrRepo.findById(username);
		User usr = us.get();
		
	
		List<UrlFeed> urlfeed = urlRepo.getListUrlByUser(usr);;
		Flux flux = new Flux();
	
		for (UrlFeed u : urlfeed) {
			try {
				feedSource = new URL(u.getUrl());
				SyndFeedInput input = new SyndFeedInput();
				XmlReader xml = new XmlReader(feedSource);
				SyndFeed feed = input.build(xml);
				List<SyndEntry> list1 = (List<SyndEntry>) feed.getEntries();
				for (SyndEntry e : list1) {
					SyndCategoryImpl sc= new SyndCategoryImpl();
					
					List<SyndCategoryImpl> listCat=e.getCategories();
						for (SyndCategoryImpl cat:listCat) {
							if(!categories.contains(cat)) 
								{categories.add(cat);
								//System.out.println("\n name="+cat.getName());
								}
						}
			
				}

			} catch (IOException | IllegalArgumentException | FeedException e1) {
				System.out.println("URL not FOUND"+e1.getMessage()+"  "+e1.getCause());
			}

		}
		return categories;
	}
	
	public List<SyndCategoryImpl> CategoriesTendance() {

		URL feedSource;
		List<SyndCategoryImpl> categories=new ArrayList<>();
		List<UrlAndCounts> urlfeed = urlRepo.getUrlAndCount();
		Flux flux = new Flux();
	
		for (UrlAndCounts u : urlfeed) {
			try {
				feedSource = new URL(u.getUrl());
				SyndFeedInput input = new SyndFeedInput();
				XmlReader xml = new XmlReader(feedSource);
				SyndFeed feed = input.build(xml);
				List<SyndEntry> list1 = (List<SyndEntry>) feed.getEntries();
				for (SyndEntry e : list1) {
					SyndCategoryImpl sc= new SyndCategoryImpl();
					
					List<SyndCategoryImpl> listCat=e.getCategories();
						for (SyndCategoryImpl cat:listCat) {
							if(!categories.contains(cat)) 
								{categories.add(cat);
								//System.out.println("\n name="+cat.getName());
								}
						}
			
				}

			} catch (IOException | IllegalArgumentException | FeedException e1) {
				System.out.println("URL not FOUND"+e1.getMessage()+"  "+e1.getCause());
			}

		}
		return categories;
	}

	
	public boolean checkSiteRss(String site) {
		boolean status=false;
		URL feedSource;
		try {
			feedSource = new URL(site );
			SyndFeedInput input = new SyndFeedInput();
			XmlReader xml = new XmlReader(feedSource);
			SyndFeed feed = input.build(xml);
			List<SyndEntry> list1 = (List<SyndEntry>) feed.getEntries();
			if(list1.size()==0) return false;
		} catch (IOException | IllegalArgumentException | FeedException e) {
			// TODO Auto-generated catch block
			return false;
		}
		return true;
	}
	
	public void addSiteRss(String site,String username) {
		Optional<User> us = usrRepo.findById(username);
		User usr = us.get();
		UrlFeed url=new UrlFeed(site,usr);
		urlRepo.save(url);
	}
	
	public void removeSiteRss(int id) {
		urlRepo.deleteById(id);
	}
	
	public List<UrlFeed> listSiteRssof(String username){
		Optional<User> us = usrRepo.findById(username);
		User usr = us.get();
		return urlRepo.getListUrlByUser(usr);
	}
	
	
/*	public List<UrlAndCounts> UrlAndCount(){
	
		
		return urlRepo.getUrlAndCount();
	}*/
	
	public void aLire(String titre, String link,String username) {
		Optional<User> us = usrRepo.findById(username);
		User usr = us.get();
		ArticleALire article=new ArticleALire(titre,link,usr);
		aLireRepo.save(article);
	}
	
	public void removeALire(int id) {
		aLireRepo.deleteById(id);
	}
	
	public List<ArticleALire> listALireof(String username ){
		Optional<User> us = usrRepo.findById(username);
		User usr = us.get();
		return aLireRepo.getArticleALireByUser(usr);
	}
}
