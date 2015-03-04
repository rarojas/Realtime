package com.energyview.realtime.minutal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.dto.ConsumoByMonth;

public class ConsumoByMonthMapper implements RowMapper<ConsumoByMonth> {

	@Override
	public ConsumoByMonth mapRow(ResultSet arg0, int arg1) throws SQLException {
		ConsumoByMonth obj = new ConsumoByMonth();
		obj.setSitio(arg0.getString("sitio"));
		obj.setConsumo(arg0.getDouble("consumo"));
		obj.setFp(arg0.getDouble("fp"));
		obj.setCliente(arg0.getString("cliente"));
		return obj;
	}

}
