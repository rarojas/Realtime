package com.energyview.realtime.model;

import java.util.ArrayList;
import java.util.List;

public class SuministroCaldera {
	
	public List<Fase> fases = new ArrayList<Fase>();
	
	public Double fp;
	
	private Double hz;

	/**
	 * @return the hz
	 */
	public Double getHz() {
		return hz;
	}

	/**
	 * @param hz the hz to set
	 */
	public void setHz(Double hz) {
		this.hz = hz;
	}
}
