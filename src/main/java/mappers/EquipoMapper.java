package mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.Equipo;

public class EquipoMapper implements RowMapper<Equipo>{

	@Override
	public Equipo mapRow(ResultSet rs, int rowNum) throws SQLException {
		Equipo equipo = new Equipo();
		equipo.idequipo =  rs.getString("idequipo");
		equipo.tipoquipo =  rs.getString("tipoequipo");
		equipo.nombreequipo =  rs.getString("nombreequipo");		
		return equipo;
	}

	
}
	