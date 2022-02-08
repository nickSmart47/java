package com.Smart.OrdersAndItems;

import java.util.ArrayList;

public class Order {
	
	private String name;
	
	private double total;
	
	private boolean ready;
	
	private ArrayList<Item> items;
	
	public Order() {
		
	}
	
	public Order(String name, double total, boolean ready, ArrayList<Item> items) {
		this.name = name;
		this.total = total;
		this.ready = ready;
		this.items = items;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public boolean isReady() {
		return ready;
	}

	public void setReady(boolean ready) {
		this.ready = ready;
	}

	public ArrayList<Item> getItems() {
//		ArrayList<String> itemsFormatted = new ArrayList<>();
		for (Item item: items) {
			System.out.println(item.getName());
			
		}
		return items;
	}

	public void setItems(ArrayList<Item> items) {
		this.items = items;
	}
	
	
}
