package com.energyview.realtime.services;

import java.util.Random;

import org.springframework.stereotype.Service;

@Service
public class RandomGenerator implements IRandomGenerator{

	public Double Generate(Double value, Double variance) {		
		Random rnd = new Random();
		Double percent =  rnd.nextDouble();
		Integer signus = rnd.nextInt();
		variance *= percent;
		variance *= (signus == 0 ? 1:-1);
		value +=  value * variance * 0.01;
		return value;
	}

	
}
