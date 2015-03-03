package com.energyview.realtime.minutal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.dto.Sitio;

public class SitioMapper implements RowMapper<Sitio>{

	@Override
	public Sitio mapRow(ResultSet arg0, int arg1) throws SQLException {
		Sitio sitio = new Sitio();
		sitio.id = arg0.getInt("id");
		sitio.sitio = arg0.getString("sitio");
		return sitio;
	}

}
