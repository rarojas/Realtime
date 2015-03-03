package mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.ConsumoMonth;

public class ConsumoMonthMapper  implements RowMapper<ConsumoMonth>{

	@Override
	public ConsumoMonth mapRow(ResultSet rs, int rowNo) throws SQLException {
		ConsumoMonth consumo = new ConsumoMonth();
		consumo.consumo = rs.getDouble("consumo");
		consumo.inicio = rs.getDate("inicio");
		consumo.now = rs.getDate("now");
		return consumo;
	}

	
}