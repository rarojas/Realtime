package mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.energyview.realtime.model.DatosGenerales;


public class DatosGeneralesMapper implements RowMapper<DatosGenerales>{

	@Override
	public DatosGenerales mapRow(ResultSet rs, int rowNum) throws SQLException {
		DatosGenerales datos = new DatosGenerales();
		datos.cliente =  rs.getString("cliente");
		datos.zonaregion =  rs.getString("zonaregion");
		datos.nombresitio =  rs.getString("nombresitio");		
		datos.nombrecontacto =  rs.getString("nombrecontacto");
		datos.telefono =  rs.getString("telefono");
		datos.correo =  rs.getString("correo");
		datos.puesto =  rs.getString("puesto");
		datos.iprouter =  rs.getString("iprouter");		
		datos.log =  rs.getString("gpslongitud");
		datos.lat =  rs.getString("gpslatitud");	
		return datos;
	}

	
}