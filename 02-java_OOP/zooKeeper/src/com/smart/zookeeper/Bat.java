package com.smart.zookeeper;

public class Bat extends Mammal {
	
	public Bat() {
		this.setEnergyLevel(300);
	}
	
	public void fly() {
		System.out.println("REEEEEEEEEAEAEAEEAEEAEA");
		this.setEnergyLevel(this.getEnergyLevel() - 50);
	}
	public void eatHumans() {
		this.setEnergyLevel(this.getEnergyLevel() + 25);
	}
	public void attackTown() {
		System.out.println("KKKKKKKRKCKRKARJKRKKRKARKCKA");
		this.setEnergyLevel(this.getEnergyLevel() - 100);
	}

}
