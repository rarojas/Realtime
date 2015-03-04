package com.energyview.realtime.model.dto;

public class ConsumoByMonth {

	private String cliente;
	public String sitio;
	public Double consumo;
	private Double fp;
	
	public String getSitio() {
		return sitio;
	}

	public void setSitio(String sitio) {
		this.sitio = sitio;
	}

	public Double getConsumo() {
		return consumo;
	}

	public void setConsumo(Double consumo) {
		this.consumo = consumo;
	}

	public Double getFp() {
		return fp;
	}

	public void setFp(Double fp) {
		this.fp = fp;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

}
