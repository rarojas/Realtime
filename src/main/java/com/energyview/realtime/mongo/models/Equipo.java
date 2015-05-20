package com.energyview.realtime.mongo.models;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="equipos")
public class Equipo {

	@Id
	private ObjectId id;

	private String descripcion;


	@DBRef
	@CascadeSave
	private Sitio sitio;

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	/**
	 * @return the sitio
	 */
	public Sitio getSitio() {
		return sitio;
	}

	/**
	 * @param sitio the sitio to set
	 */
	public void setSitio(Sitio sitio) {
		this.sitio = sitio;
	}

}
