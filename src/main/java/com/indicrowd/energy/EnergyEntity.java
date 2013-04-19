package com.indicrowd.energy;

public interface EnergyEntity {
	
	public void setEnergy(Long energy);
	public Long getEnergy();
	
	public EnergyEntity merge();

}
