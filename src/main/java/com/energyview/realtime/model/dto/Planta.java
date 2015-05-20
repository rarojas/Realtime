package com.energyview.realtime.model.dto;

import com.energyview.realtime.services.Description;

public class Planta extends Motor {

	public int id;

	public String idequipo;

	@Description("CFE FASE 1")
	public Double CFEF1;
	@Description("CFE FASE 2")
	public Double CFEF2;
	@Description("CFE FASE 2")
	public Double CFEF3;

	@Description("CFE|FRECUENCIA")
	public Double CFEHZ;
	
	@Description("GENERADOR|FRECUENCIA")
	public Double HZ;
	
	@Description("GENERADOR|FP")
	public Double FP;
	
	@Description("HRS OPERACION")
	public Double HORAS;
	
	@Description("GENERADOR F1|VOLTAJE")
	public Double VF1;
	@Description("GENERADOR F2|VOLTAJE")
	public Double VF2;
	@Description("GENERADOR F3|VOLTAJE")
	public Double VF3;

	@Description("GENERADOR F1|CORRIENTE")
	public Double IF1;
	@Description("GENERADOR F2|CORRIENTE")
	public Double IF2;
	@Description("GENERADOR F3|CORRIENTE")
	public Double IF3;

	@Description("ON/OFF")
	public Boolean on;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isOn() {
		return on;
	}

	public void setOn(boolean on) {
		this.on = on;
	}

	/**
	 * @return the idequipo
	 */
	public String getIdequipo() {
		return idequipo;
	}

	/**
	 * @param idequipo
	 *            the idequipo to set
	 */
	public void setIdequipo(String idequipo) {
		this.idequipo = idequipo;
	}
}
