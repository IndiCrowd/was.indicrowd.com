package com.indicrowd.energy;

import org.springframework.stereotype.Service;

@Service
public class EnergyService {

	public boolean give(EnergyEntity from, EnergyEntity to, long energy) {

		if (from == null || from.getEnergy() >= energy) {

			if (from != null) {
				from.setEnergy(from.getEnergy() - energy);
				from.merge();
			}
			
			if (to != null) {
				to.setEnergy(to.getEnergy() + energy);
				to.merge();
			}
			
			return true;
		}

		return false;
	}

}
