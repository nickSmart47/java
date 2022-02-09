package com.smart.zookeeper;

public class Mammal {
	private int energyLevel;
	
	public Mammal() {
		this.setEnergyLevel(100);
	}
	
	public int displayEnergy() {
		System.out.printf("Current energy level: %s\n", getEnergyLevel());
		return getEnergyLevel();
	}

	public int getEnergyLevel() {
		return energyLevel;
	}

	public void setEnergyLevel(int energyLevel) {
		this.energyLevel = energyLevel;
	}
}
