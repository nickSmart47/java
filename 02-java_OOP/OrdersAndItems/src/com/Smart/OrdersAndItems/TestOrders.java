package com.Smart.OrdersAndItems;
import java.util.ArrayList;

public class TestOrders {
	public static void main(String[] args) {
	    
        // Menu items
		Item item1 = new Item("Grilled Cheese", 5.5);
		Item item2 = new Item("Sweet Potato Sushi Roll", 8.99);
		Item item3 = new Item("Veggie Burger", 11.25);
		Item item4 = new Item("Arugula & Spinach Salad", 6.75);
		
		ArrayList<Item> order1Items = new ArrayList<>();
		ArrayList<Item> order2Items = new ArrayList<>();
		ArrayList<Item> order3Items = new ArrayList<>();
		ArrayList<Item> order4Items = new ArrayList<>();
		
		
        // Order variables -- order1, order2 etc.
		Order order1 = new Order("Dave", 0, true, order1Items);
		Order order2 = new Order("Joshua", 0, false, order2Items);
		Order order3 = new Order("Cynthia", 0, false, order3Items);
		Order order4 = new Order("Anais", 0, false, order4Items);
    
        // Application Simulations
        // Use this example code to test various orders' updates
        System.out.printf("Name: %s\n", order1.getName());
        System.out.printf("Total: %s\n", order1.getTotal());
        System.out.printf("Ready: %s\n", order1.isReady());
        System.out.printf("Items: %s\n", order1.getItems());
        
        order2Items.add(item1);
		order2.setTotal(order2.getTotal() + item2.getPrice());
		
		System.out.printf("Name: %s\n", order2.getName());
        System.out.printf("Total: %s\n", order2.getTotal());
        System.out.printf("Ready: %s\n", order2.isReady());
        System.out.printf("Items: %s\n", order2.getItems());
		
		order3Items.add(item4);
		order3.setTotal(item4.getPrice());
		
		System.out.printf("Name: %s\n", order3.getName());
        System.out.printf("Total: %s\n", order3.getTotal());
        System.out.printf("Ready: %s\n", order3.isReady());
        System.out.printf("Items: %s\n", order3.getItems());
        
		order4Items.add(item1);
		order4.setTotal(order4.getTotal() + item1.getPrice());
		
		System.out.printf("Name: %s\n", order4.getName());
        System.out.printf("Total: %s\n", order4.getTotal());
        System.out.printf("Ready: %s\n", order4.isReady());
        System.out.printf("Items: %s\n", order4.getItems());
		
		order1.setReady(true);
		
		order2Items.add(item2);
		order2.setTotal(order2.getTotal() + item2.getPrice());
		order2Items.add(item2);
		order2.setTotal(order2.getTotal() + item2.getPrice());
		
		System.out.printf("Name: %s\n", order2.getName());
        System.out.printf("Total: %s\n", order2.getTotal());
        System.out.printf("Ready: %s\n", order2.isReady());
        System.out.printf("Items: %s\n", order2.getItems());
        
        order3.setReady(true);
        
        System.out.printf("Name: %s\n", order3.getName());
        System.out.printf("Total: %s\n", order3.getTotal());
        System.out.printf("Ready: %s\n", order3.isReady());
        System.out.printf("Items: %s\n", order3.getItems());
        
		
    }
}
