package com.energyview.realtime.model.dto;

public class Variable {
	public Integer id;
	private String componente;
	private String variable;
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

}
