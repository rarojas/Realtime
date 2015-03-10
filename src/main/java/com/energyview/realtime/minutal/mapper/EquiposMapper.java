package com.energyview.realtime.minutal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.dto.Equipo;

public class EquiposMapper implements RowMapper<Equipo>{

	@Override
	public Equipo mapRow(ResultSet arg0, int arg1) throws SQLException {
		Equipo e = new Equipo();
		e.nombre =  arg0.getString("equipo");
		e.id =  arg0.getInt("id");
		return e;
	}

}
