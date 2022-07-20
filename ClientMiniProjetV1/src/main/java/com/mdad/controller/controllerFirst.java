package com.mdad.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mdad.model.Item;
import com.mdad.service.UserServices;
import com.mdad.service.homeServices;
import com.sun.syndication.feed.synd.SyndCategoryImpl;

@Controller
public class controllerFirst {
	@Autowired
	homeServices homeServ;
	@Autowired
	UserServices userServ;

	@RequestMapping(value="/home")
	public ModelAndView index(HttpServletRequest req, @RequestParam(name = "categorie",defaultValue = "") String categorie, @RequestParam(name = "page",defaultValue = "0") int page) {
		System.out.println(categorie);
		ModelAndView model=new ModelAndView("index");
		HttpSession session=req.getSession();
		List<Item> listItem;
		String username=req.getRemoteUser();
		model.addObject("username",username);
		if(session.getAttribute("listItem")==null && categorie.equals("")) {
		
		listItem=homeServ.itemsOfIn(username, categorie);
		session.setAttribute("listItem", listItem);
		}else if(categorie.equals("")){
			System.out.println("session deja cree");
			listItem=(List<Item>)session.getAttribute("listItem");
		}else {
			listItem=homeServ.itemsOfIn(username, categorie);
		}
		//pagination
		PageRequest pageRequest = PageRequest.of(page, 10);


		int total = listItem.size();
		if(total>0) {
		int start = Math.toIntExact(pageRequest.getOffset());
		int end = Math.min((start + pageRequest.getPageSize()), total);

		List<Item> output = new ArrayList<>();

		if (start <= end) {
		    output = listItem.subList(start, end);
		}

		Page p2=new PageImpl<>(
		    output,
		    pageRequest,
		    total
		);
		
		
		
		
		Page p=new PageImpl<Item>(listItem, PageRequest.of(page, 10), listItem.size());
		model.addObject("listItems",p2.getContent());
		model.addObject("totalPages",p2.getTotalPages()-1);
	System.out.println(p.getSize()+"  total"+p.getTotalPages());
		model.addObject("listCategories",homeServ.CategoriesHome(username));
		
		}
		return model;
	
	}
	
	
	@RequestMapping(value="/tendance")
	public ModelAndView tendance(HttpServletRequest req, @RequestParam(name = "categorie",defaultValue = "") String categorie, @RequestParam(name = "page",defaultValue = "0") int page) {
		
		
		String username=req.getRemoteUser();
		ModelAndView model=new ModelAndView("tendence");
		model.addObject("username",username);
		List<Item> listItem=homeServ.articlesTendance(categorie);
		Collections.shuffle(listItem);
		//pagination
		PageRequest pageRequest = PageRequest.of(page, 10);


		int total = listItem.size();
		if(total>0) {
		int start = Math.toIntExact(pageRequest.getOffset());
		int end = Math.min((start + pageRequest.getPageSize()), total);

		List<Item> output = new ArrayList<>();

		if (start <= end) {
		    output = listItem.subList(start, end);
		}

		Page p2=new PageImpl<>(
		    output,
		    pageRequest,
		    total
		);
		
		
		
		
		Page p=new PageImpl<Item>(listItem, PageRequest.of(page, 10), listItem.size());
		model.addObject("listItems",p2.getContent());
		model.addObject("totalPages",p.getTotalPages()-1);
	
		model.addObject("listCategories",homeServ.CategoriesTendance());
		}
		return model;
	
	}
	
	@RequestMapping(value="/siteFavoris")
	public String siteFavoris(HttpServletRequest req, Model m) {
		System.out.println("siteFavoris");
		m.addAttribute("listUrls", homeServ.listSiteRssof( req.getRemoteUser()));
		//ModelAndView m=new ModelAndView("forward:/addrssFinal");
		String username=req.getRemoteUser();
		m.addAttribute("username",username);
		return "AjouterSite";
	}
	
	@RequestMapping(value="/articleALire")
	public String articleALire(HttpServletRequest req, Model m) {
		String username=req.getRemoteUser();
		m.addAttribute("username",username);
		m.addAttribute("listUrls", homeServ.listALireof( req.getRemoteUser()));
		//ModelAndView m=new ModelAndView("forward:/addrssFinal");
		return "PlusTard";
	}
	
	@RequestMapping(value="/")
	public String test(HttpServletRequest req) {
		HttpSession session=req.getSession();
		session.setAttribute("listItem", null);
		return "forward:/home";
	}
	
	@RequestMapping(value="/addrss",method = RequestMethod.POST)
	public ModelAndView checkRss(HttpServletRequest req,RedirectAttributes redirectAttributes) {
		String url=req.getParameter("url");
		System.out.println(url);
		req.setAttribute("url", url);
		ModelAndView m=new ModelAndView("forward:/addrssFinal");
		ModelAndView m2=new ModelAndView("AjouterSite");
		String username=req.getRemoteUser();
		m2.addObject("username",username);
		m2.addObject("listUrls", homeServ.listSiteRssof( req.getRemoteUser()));
		m2.addObject("error", "le site n'est pas operationnel");
		boolean st=homeServ.checkSiteRss(url+"rss");
		if(st) return m;
		else return m2;
		
	}
	
	
	@RequestMapping(value="/addrssFinal")
	public ModelAndView addRss(HttpServletRequest req,Model model) {
		
		
		String url=(String) req.getAttribute("url");
		ModelAndView m=new ModelAndView("AjouterSite");
		homeServ.addSiteRss(url+"rss", req.getRemoteUser());
		m.addObject("confirm", "le site est bien ajoute");
		m.addObject("listUrls", homeServ.listSiteRssof( req.getRemoteUser()));
		String username=req.getRemoteUser();
		m.addObject("username",username);
		return m;
		
	}
	@RequestMapping(value="/ajoutRss",method = RequestMethod.POST)
	public ModelAndView ajoutRss(HttpServletRequest req,RedirectAttributes redirectAttributes) {
		String url=req.getParameter("url");
		System.out.println(url);
		req.setAttribute("url", url);
		ModelAndView m=new ModelAndView("forward:/ajoutRssStep2");
		ModelAndView m2=new ModelAndView("AjouterSite");
		m2.addObject("listUrls", homeServ.listSiteRssof( req.getRemoteUser()));
		m2.addObject("error", "le lien rss n'est pas operationnel");
		boolean st=homeServ.checkSiteRss(url);
		if(st) return m;
		else return m2;
		
	}
	@RequestMapping(value="/ajoutRssStep2")
	public ModelAndView ajoutRssStep2(HttpServletRequest req,Model model) {
		
		
		String url=(String) req.getAttribute("url");
		ModelAndView m=new ModelAndView("AjouterSite");
		homeServ.addSiteRss(url, req.getRemoteUser());
		String username=req.getRemoteUser();
		m.addObject("username",username);
		m.addObject("confirm", "le lien rss est bien ajoute");
		m.addObject("listUrls", homeServ.listSiteRssof( req.getRemoteUser()));
		return m;
		
	}
	
	@RequestMapping(value="/listSiteRss")
	public ModelAndView listSiteRss(HttpServletRequest req) {
		ModelAndView model=new ModelAndView("AjouterSite");
		String username=req.getRemoteUser();
		model.addObject("username",username);
		model.addObject("listUrls", homeServ.listSiteRssof( req.getRemoteUser()));
		return model;
		
	}
	
	@RequestMapping(value="/remSiteRss")
	public ModelAndView remSiteRss(HttpServletRequest req,int idArticle) {
		ModelAndView model=new ModelAndView("forward:/siteFavoris");
		model.addObject("supprime","Supprime");
		homeServ.removeSiteRss(idArticle);
		return model;
	}
	
	
	@RequestMapping(value="/aLire",method = RequestMethod.GET)
	public ModelAndView aLire(String titre, String link, HttpServletRequest req) {
		System.out.println("heart"+titre+"  "+link);
		ModelAndView model=new ModelAndView("page");
		String username=req.getRemoteUser();
		model.addObject("username",username);
		homeServ.aLire(titre, link, req.getRemoteUser());
		return model;
		
	}

	
	@RequestMapping(value="/listALire")
	public ModelAndView listALire( HttpServletRequest req) {
		ModelAndView model=new ModelAndView("listAlire");
		model.addObject("listALire", homeServ.listALireof(req.getRemoteUser()));
		String username=req.getRemoteUser();
		model.addObject("username",username);
		return model;
		
	}
	
	@RequestMapping(value="/remAlire")
	public ModelAndView remALire(HttpServletRequest req,int idArticle) {
		ModelAndView model=new ModelAndView("forward:/articleALire");
		model.addObject("supprime","Supprime");
		homeServ.removeALire(idArticle);
		String username=req.getRemoteUser();
		model.addObject("username",username);
		return model;
	}
	
	  @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	    public String loginPage() {
	       /* ModelAndView mv = new ModelAndView();
	        mv.setViewName("login");*/

	        return "login";
	    }
	  
	/*	@RequestMapping(value="/registerAction" ,method = RequestMethod.POST)
		public String register(HttpServletRequest req) {
			System.out.println("registerr");
			if (userServ.saveUser(req.getParameter("username"), req.getParameter("password"))) return "register?success"; 
			else return "register?echec";
			
		}*/
	  
	  @RequestMapping(value="/registerAction" ,method = RequestMethod.POST)
		public ModelAndView register(HttpServletRequest req) {
			ModelAndView model=new ModelAndView("register");
			String username=req.getRemoteUser();
			model.addObject("username",username);
			System.out.println("username "+req.getParameter("username")+" pass "+req.getParameter("loginPassword") );
			if (userServ.saveUser(req.getParameter("username"), req.getParameter("loginPassword"))) 
			{
				model.addObject("success","success");
				return model; 
			}
			else { 
				model.addObject("echec","echec");
				return model;}
			
		}
		@RequestMapping(value="/registerPage")
		public String registerPage(HttpServletRequest req) {
			
			 return "register";
			
		}
		
}
