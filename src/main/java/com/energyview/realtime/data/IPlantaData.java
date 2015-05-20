package com.energyview.realtime.data;

import java.util.List;

import com.energyview.realtime.model.Variable;
import com.energyview.realtime.model.dto.Equipo;
import com.energyview.realtime.model.dto.PlantaMonitoreo;
import com.energyview.realtime.model.dto.SitioInfo;
import com.energyview.realtime.model.dto.TablaLecturaDTO;

public interface IPlantaData {

	List<Variable> Get();
	
	List<Equipo> GetEquipos();

	List<TablaLecturaDTO> Get(String idequipo);

	List<PlantaMonitoreo> GetPlantasMonitoreo();

	SitioInfo GetSitioInfo(String idequipo);
}
