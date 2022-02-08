package com.Smart.baristaChallenge;

import java.util.ArrayList;

//Here we're creating a new data type called Order
public class Order {
 
 // MEMBER VARIABLES
 private String name; // default value of null
 private boolean ready; // default value false
 private ArrayList<Item> items; // defaults to null
 
 // CONSTRUCTOR
 // No arguments, sets name to "Guest", initializes items as an empty list.
 public Order() {
	 this.name = "Guest";
	 this.ready = false;
	 ArrayList<Item> items = new ArrayList<Item>();
	 this.items = items;
 }
 
 // OVERLOADED CONSTRUCTOR
 // Takes a name as an argument, sets name to this custom name.
 // Initializes items as an empty list.
 public Order(String name) {
	 this.name = name;
	 this.ready = false;
	 ArrayList<Item> items = new ArrayList<Item>();
	 this.items = items;
 }

 
 // ORDER METHODS
 
 	public void addItem(String name, double price) {
 	 Item item = new Item(name, price);
	 this.items.add(item);
 }
 	public String getStatusMessage() {
 		if (this.isReady()) {
 			return "\nYour order is ready!";
 		}
 		else {
 			return "\nThank you for waiting. Your order will be ready soon";
 		}
 		
 	}
 	
 	public double getOrderTotal(ArrayList<Item> items) {
 		double sum = 0;
 		for (Item item: items) {
 			sum += item.getPrice();
 		}
 		return sum;
 	}
 	
 	public void display() {
 		System.out.printf("Customer name: %s ", this.getName());
 		for (Item item: items) {
 			System.out.printf("\n%s - $%s", item.getName(), item.getPrice());
 		}
 		System.out.printf("\nTotal: %s", this.getOrderTotal(items));
 	}
 	
 
 
 // GETTERS & SETTERS
 
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isReady() {
		return ready;
	}

	public void setReady(boolean ready) {
		this.ready = ready;
	}

	public ArrayList<Item> getItems() {
		return items;
	}

	public void setItems(ArrayList<Item> items) {
		this.items = items;
	}
 
 
}

