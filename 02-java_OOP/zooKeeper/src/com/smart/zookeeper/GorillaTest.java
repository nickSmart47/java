package com.smart.zookeeper;

public class GorillaTest {

	public static void main(String[] args) {
		
		Gorilla fred = new Gorilla();
		
		fred.throwSomething("rock");
		fred.throwSomething("tree branch");
		fred.throwSomething("bee hive");
		
		fred.displayEnergy();
		
		fred.eatBananas();
		fred.eatBananas();
		
		fred.displayEnergy();
		
		fred.climb();
		
		fred.displayEnergy();
	}
}
