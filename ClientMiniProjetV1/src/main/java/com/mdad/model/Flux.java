package com.mdad.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Flux {
	
	private List<Item> liste;

	public Flux() {
		super();
		liste=new ArrayList();
	}
		
	public void addItem(Item i) {
		liste.add(i);
	}
	public List<Item> getItems(){
		Collections.shuffle(liste);
		return liste;
	}
	
	
}
