package com.smart.zookeeper;

public class BatTest {

	public static void main(String[] args) {
		
		Bat deathIncarnate = new Bat();
		
		deathIncarnate.attackTown();
		deathIncarnate.attackTown();
		deathIncarnate.attackTown();
		
		System.out.println("Energy level after attacking three towns.");
		deathIncarnate.displayEnergy();
		
		deathIncarnate.eatHumans();
		deathIncarnate.eatHumans();
		
		System.out.println("Energy level after eating two humans.");
		deathIncarnate.displayEnergy();
		
		deathIncarnate.fly();
		deathIncarnate.fly();
		System.out.println("Energy level after flying twice.");
		deathIncarnate.displayEnergy();
	}
}
