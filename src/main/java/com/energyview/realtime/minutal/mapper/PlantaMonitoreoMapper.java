package com.energyview.realtime.minutal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.dto.PlantaMonitoreo;

public class PlantaMonitoreoMapper implements RowMapper<PlantaMonitoreo> {

	@Override
	public PlantaMonitoreo mapRow(ResultSet rs, int row) throws SQLException {
		PlantaMonitoreo planta = new PlantaMonitoreo();
		planta.setCp(rs.getString("codigopostal"));
		planta.setDomicilio(rs.getString("domicilio"));
		planta.setIdequipo(rs.getString("idequipo"));
		planta.setLat(rs.getString("gpslatitud"));
		planta.setLog(rs.getString("gpslongitud"));
		planta.setRegion(rs.getString("zonaregion"));
		planta.setSitio(rs.getString("nombresitio"));
		planta.setEquipo(rs.getString("nombreequipo"));
		return planta;
	}

}
