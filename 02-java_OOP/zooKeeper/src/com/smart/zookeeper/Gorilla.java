package com.smart.zookeeper;

public class Gorilla extends Mammal {

	public void throwSomething(String something) {
		System.out.printf("The Gorilla has thrown a %s.\n", something);
		this.setEnergyLevel(this.getEnergyLevel() - 5);
	}

	public void eatBananas() {
		System.out.println("The Gorilla ate some bananas and is incredibly satisfied.");
		this.setEnergyLevel(this.getEnergyLevel() + 10);

	}

	public void climb() {
		System.out.println("The Gorilla has climbed a tree.");
		this.setEnergyLevel(this.getEnergyLevel() - 10);
	}
}
