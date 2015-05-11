package com.energyview.realtime.model;

public class Variable {

	public Integer tagid;
	public String idequipo;
	public String tipoequipo;
	public String nombreequipo;
	private String variable;
	private String componente;
	public String unidadmedicion;
	public Double tagvalue;
	public Double umbral01;
	public Double umbral02;
	public Double umbral03;
	public Double umbral04;
	public Double umbral05;
	/**
	 * @return the componente
	 */
	public String getComponente() {
		return componente;
	}
	/**
	 * @param componente the componente to set
	 */
	public void setComponente(String componente) {
		this.componente = componente;
	}
	/**
	 * @return the variable
	 */
	public String getVariable() {
		return variable;
	}
	/**
	 * @param variable the variable to set
	 */
	public void setVariable(String variable) {
		this.variable = variable;
	}
}
