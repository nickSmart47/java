package com.Smart.baristaChallenge;

public class TestBarista {

	public static void main(String[] args) {
		
		Order order1 = new Order();
		Order order2 = new Order();
		
//		order1.display();
		
		Order order3 = new Order("Dave");
		Order order4 = new Order("Madison");
		Order order5 = new Order("Sarah");
		
		order3.addItem("cheez its", 2.22);
		order3.addItem("wheat thins", 3.54);
		order3.display();
		System.out.println(order3.getStatusMessage());
		
		order2.addItem("cheez its", 2.22);
		order2.addItem("wheat thins", 3.54);
		order2.addItem("bread", 3.22);
		order2.addItem("water", 5.55);
		order2.display();
		order2.setReady(true);
		System.out.println(order2.getStatusMessage());
	}
}
