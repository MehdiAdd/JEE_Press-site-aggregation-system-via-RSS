package com.mdad.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.text.StringEscapeUtils;

import com.sun.syndication.feed.synd.SyndCategoryImpl;

public class Item {

		private String auteur;
		private String description;
		private List<String> categories;  
		private String link;

		private String titre;
		private Date publishedDate;
	
		private int id;
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getTitre() {
			return titre;
		}
		public void setTitre(String titre) {
			this.titre = titre;
		}
		public Date getPublishedDate() {
			return publishedDate;
		}
		public void setPublishedDate(Date publishedDate) {
			this.publishedDate = publishedDate;
		}
		public String getAuteur() {
			return auteur;
		}
		public void setAuteur(String auteur) {
			this.auteur = auteur;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			//this.description = StringEscapeUtils.escapeHtml4(description);  
			this.description=description;
			
		}
		public List<String> getCategories() {
			return categories;
		}
		public void setCategories(List<String> categories) {
			this.categories=categories;
			}
			
			
			
		
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		public Item(int id,String auteur, String description, String link, String titre,
				Date publishedDate) {
			super();
			this.id=id;
			this.auteur = auteur;
			this.description = StringEscapeUtils.escapeHtml4(description); 
			this.categories = new ArrayList<>();
			this.link = link;
			this.titre = titre;
			this.publishedDate = publishedDate;
		}

		public Item() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Item(String auteur, String description, List<String> categories, String link, String titre,
				Date publishedDate, int id) {
			super();
			this.auteur = auteur;
			this.description = description;
			this.categories = categories;
			this.link = link;
			this.titre = titre;
			this.publishedDate = publishedDate;
			this.id = id;
		}
		
		
}
