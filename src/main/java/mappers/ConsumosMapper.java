package mappers;

import java.sql.ResultSet;
import java.sql.SQLException;
	


import org.joda.time.DateTime;
import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.Consumo;

public class ConsumosMapper implements RowMapper<Consumo>{

	@Override
	public Consumo mapRow(ResultSet rs, int rowNo) throws SQLException {
		Consumo consumo = new Consumo();
		consumo.consumo = rs.getDouble("consumo");
		consumo.hora = new DateTime(rs.getTimestamp("hora"));
		return consumo;
	}

	
}
