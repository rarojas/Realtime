package com.energyview.realtime.data;

import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.energyview.realtime.mappers.VariableMapper;
import com.energyview.realtime.minutal.mapper.PlantaMonitoreoMapper;
import com.energyview.realtime.model.Variable;
import com.energyview.realtime.model.dto.Equipo;
import com.energyview.realtime.model.dto.PlantaMonitoreo;
import com.energyview.realtime.model.dto.SitioInfo;
import com.energyview.realtime.model.dto.TablaLecturaDTO;

@Repository
public class PlantaData extends DataBase<Variable> implements IPlantaData {

	@Autowired
	Properties queryProps;

	public PlantaData() {
		this.dataMapper = VariableMapper.class;
	}

	public List<Variable> Get() {
		String sql = "SELECT *  FROM ext_cognos where cliente = 'COSTCO' and tipoequipo= 'PLANTA DE EMERGENCIA';";
		return GetList(sql);
	}

	public List<TablaLecturaDTO> Get(String idequipo) {
		String sql = "select tagvalue,tagname from tablalectura where tagname like '%"
				+ idequipo + "|%';";
		return informix.query(sql, new BeanPropertyRowMapper<TablaLecturaDTO>(
				TablaLecturaDTO.class));
	}

	public List<PlantaMonitoreo> GetPlantasMonitoreo() {
		String sql = queryProps.getProperty("PlantasMonitoreo");
		return this.informix.query(sql, new PlantaMonitoreoMapper());
	}

	public SitioInfo GetSitioInfo(String idequipo) {
		String sql = "select domicilio,nombresitio,gpslatitud,gpslongitud,codigopostal,zonaregion from ext_cognos where idequipo = '"
				+ idequipo + "' limit 1;";
		List<SitioInfo> results = informix.query(sql,
				new BeanPropertyRowMapper<SitioInfo>(SitioInfo.class));
		if (results.isEmpty())
			return null;
		return results.get(0);

	}

	@Override
	public List<Equipo> GetEquipos() {
		String sql = "SELECT * FROM TABLAEQUIPOS  WHERE TIPOEQUIPO =  'PLANTA DE EMERGENCIA'";
		List<Equipo> results = informix.query(sql,
				new BeanPropertyRowMapper<Equipo>(Equipo.class));
		return results;
	}

}
