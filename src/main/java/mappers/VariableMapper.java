package mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.Variable;

public class VariableMapper implements RowMapper<Variable>{

	@Override
	public Variable mapRow(ResultSet rs, int rowNo) throws SQLException {
		Variable variable = new Variable();
		variable.tagid = rs.getInt("tagid");
		variable.idequipo = rs.getString("idequipo").trim();
		variable.nombreequipo = rs.getString("nombreequipo").trim();
		variable.variable = rs.getString("variable").trim();
		variable.tagvalue = rs.getDouble("tagvalue");
		variable.umbral01 = rs.getDouble("umbral01");
		variable.umbral02 = rs.getDouble("umbral02");
		variable.umbral03 = rs.getDouble("umbral03");
		variable.umbral04 = rs.getDouble("umbral04");
		variable.umbral05 = rs.getDouble("umbral05");
		variable.componente = rs.getString("componente");
		variable.unidadmedicion = rs.getString("unidadmedicion");
		return variable;
	}

}
