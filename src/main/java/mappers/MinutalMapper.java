package mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.dto.Minutal;

public class MinutalMapper implements RowMapper<Minutal> {
	
	@Override
	public Minutal mapRow(ResultSet arg0, int arg1) throws SQLException {
		Minutal minutal = new Minutal();
		minutal.variable = arg0.getString("variable");
		minutal.componente = arg0.getString("componente");
		minutal.tagtimestamp = arg0.getTimestamp("tagtimestamp");		
		minutal.value = arg0.getDouble("avg");
		minutal.min = arg0.getDouble("min");
		minutal.max = arg0.getDouble("max");
		return minutal;
	}

}
