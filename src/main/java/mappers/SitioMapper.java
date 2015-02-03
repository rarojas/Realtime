package mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.Sitio;

public class SitioMapper implements RowMapper<Sitio> {

	@Override
	public Sitio mapRow(ResultSet rs, int rowNo) throws SQLException {
		Sitio sitio = new Sitio();
		sitio.nombresitio = rs.getString("nombresitio");
		sitio.idsitio = rs.getString("idsitio");
		sitio.codigopostal = rs.getString("codigopostal");
		sitio.domicilio = rs.getString("domicilio");
		sitio.gpslatitud = rs.getString("gpslatitud");
		sitio.gpslongitud = rs.getString("gpslongitud");
		sitio.clasificacionsitio = rs.getString("clasificacionsitio");
		sitio.idcliente = rs.getString("idcliente");
		return sitio;
	}

}

