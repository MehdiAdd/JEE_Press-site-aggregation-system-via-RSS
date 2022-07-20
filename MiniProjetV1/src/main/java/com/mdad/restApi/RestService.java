package com.mdad.restApi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mdad.model.ArticleALire;
import com.mdad.model.Item;
import com.mdad.model.UrlFeed;
import com.mdad.model.User;
import com.mdad.service.UserServices;
import com.mdad.service.homeServices;
import com.sun.syndication.feed.synd.SyndCategoryImpl;
@RestController
public class RestService {

	@Autowired
	private homeServices service;
	@Autowired
	private UserServices userservice;
	@RequestMapping(method=RequestMethod.GET , value="/tendanceArticles")
	public List<Item> articlesTendance(@RequestParam String categorie) {
		return service.articlesTendance(categorie);
	}
	@RequestMapping(method=RequestMethod.GET , value="/homeArticles")
	public List<Item> itemsOfIn(@RequestParam String username,@RequestParam String categorie) {
		return service.itemsOfIn(username, categorie);
	}
	@RequestMapping(method=RequestMethod.GET , value="/homeCategories")
	public List<SyndCategoryImpl> CategoriesHome(@RequestParam String username) {
		return service.CategoriesHome(username);
	}
	@RequestMapping(method=RequestMethod.GET , value="/tendanceCategories")
	public List<SyndCategoryImpl> CategoriesTendance() {
		return service.CategoriesTendance();
	}
	@RequestMapping(method=RequestMethod.GET , value="/sitesCheck")
	public boolean checkSiteRss(@RequestParam  String site) {
		return service.checkSiteRss(site);
	}
	@RequestMapping(method=RequestMethod.POST , value="/sites")
	public void addSiteRss(@RequestBody UrlFeed site) {
		User u=site.getUser();
		 service.addSiteRss(site.getUrl(), u.getUsername());
	}
	@RequestMapping(method=RequestMethod.DELETE , value="/sites/{id}")
	public void removeSiteRss(@PathVariable int id) {
		service.removeSiteRss(id);
	}
	@RequestMapping(method=RequestMethod.GET , value="/sites/{username}")
	public List<UrlFeed> listSiteRssof(@PathVariable String username){
		return service.listSiteRssof(username);
	}
	@RequestMapping(method=RequestMethod.POST , value="/articles")
	public void aLire(@RequestBody ArticleALire article) {
		service.aLire(article.getTitre(), article.getLink(), article.getUser().getUsername());
	}
	@RequestMapping(method=RequestMethod.DELETE , value="/articles/{id}")
	public void removeALire(@PathVariable int id) {
		service.removeALire(id);
	}
	@RequestMapping(method=RequestMethod.GET , value="/articles/{username}")
	public List<ArticleALire> listALireof(@PathVariable String username ){
		return service.listALireof(username);
	}
	@RequestMapping(method=RequestMethod.POST , value="/users")
	public boolean saveUser(@RequestBody User u) {
		return userservice.saveUser(u.getUsername(), u.getPassword());
	}
}
