package com.energyview.realtime.minutal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.dto.Variable;

public class VariableMapper implements RowMapper<Variable> {

	@Override
	public Variable mapRow(ResultSet arg0, int arg1) throws SQLException {
		Variable variable = new Variable();
		variable.id = arg0.getInt("id");
		variable.componente = arg0.getString("componente");
		variable.variable = arg0.getString("componente") +"-" +  arg0.getString("variable");
		return variable;
	}

}
