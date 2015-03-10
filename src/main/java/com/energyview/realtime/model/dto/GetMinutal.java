package com.energyview.realtime.model.dto;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.ser.std.DateSerializer;

public class GetMinutal {
	public int sitio;
	public int equipo;
	public int variable;
	@JsonSerialize(using = DateSerializer.class)
	public Date inicio;
	@JsonSerialize(using = DateSerializer.class)
	public Date fin;
}
