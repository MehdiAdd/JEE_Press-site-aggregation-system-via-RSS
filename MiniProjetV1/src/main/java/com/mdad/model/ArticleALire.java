package com.mdad.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;



@Entity
public class ArticleALire {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String Titre;
	private String link;
	@ManyToOne(cascade = CascadeType.DETACH)
	User user;
	
	
	
	
	
	public ArticleALire() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArticleALire(String titre, String link, User u) {
		super();
		Titre = titre;
		this.link = link;
		user=u;
	}
	public String getTitre() {
		return Titre;
	}
	public void setTitre(String titre) {
		Titre = titre;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
