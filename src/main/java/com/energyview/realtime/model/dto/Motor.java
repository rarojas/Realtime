package com.energyview.realtime.model.dto;

import com.energyview.realtime.services.Description;

public class Motor {

	@Description("RPM")
	public Double RPM;

	@Description("PRESION ACEITE")
	public Double presionAceite;
	
	@Description("MOTOR|VOLTAJE")
	public Double voltajeBateria;
	
	@Description("MOTOR|TEMPERATURA")
	public Double temperaturaRefigerante;

	@Description("TANQUE COMBUSTI")
	public Double combustible;
	
	/**
	 * @return the RPM
	 */
	public Double getRPM() {
		return RPM;
	}

	/**
	 * @param RPM the RPM to set
	 */
	public void setRPM(Double RPM) {
		this.RPM = RPM;
	}

	/**
	 * @return the presionAceite
	 */
	public Double getPresionAceite() {
		return presionAceite;
	}


	/**
	 * @param presionAceite the presionAceite to set
	 */
	public void setPresionAceite(Double presionAceite) {
		this.presionAceite = presionAceite;
	}

	/**
	 * @return the voltajeBateria
	 */
	public Double getVoltajeBateria() {
		return voltajeBateria;
	}

	/**
	 * @param voltajeBateria the voltajeBateria to set
	 */
	public void setVoltajeBateria(Double voltajeBateria) {
		this.voltajeBateria = voltajeBateria;
	}

	/**
	 * @return the temperaturaRefigerante
	 */
	public Double getTemperaturaRefigerante() {
		return temperaturaRefigerante;
	}

	/**
	 * @param temperaturaRefigerante the temperaturaRefigerante to set
	 */
	public void setTemperaturaRefigerante(Double temperaturaRefigerante) {
		this.temperaturaRefigerante = temperaturaRefigerante;
	}
}
