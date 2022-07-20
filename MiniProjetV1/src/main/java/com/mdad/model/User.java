package com.mdad.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

		
	/*	private String nom;
		private String prenom;*/
		@Id
		
		private String username;
		private String password;
		private boolean enabled=true;
		
		

		public boolean isEnabled() {
			return enabled;
		}



		public void setEnabled(boolean enabled) {
			this.enabled = enabled;
		}



	/*	public User( String nom, String prenom, String username, String password) {
			super();
			
			this.nom = nom;
			this.prenom = prenom;
			this.username = username;
			this.password = password;
		}
*/

		public User( String username, String password) {
			super();
			
			this.username = username;
			this.password = password;
		}

		public User() {
			super();
			// TODO Auto-generated constructor stub
		}



		/*public String getNom() {
			return nom;
		}

		public void setNom(String nom) {
			this.nom = nom;
		}

		public String getPrenom() {
			return prenom;
		}

		public void setPrenom(String prenom) {
			this.prenom = prenom;
		}

*/

		public String getUsername() {
			return username;
		}



		public void setUsername(String username) {
			this.username = username;
		}



		public String getPassword() {
			return password;
		}



		public void setPassword(String password) {
			this.password = password;
		}

	
		
		
		
}
