package com.energyview.realtime.services;

import java.util.List;

import com.energyview.realtime.model.dto.Equipo;
import com.energyview.realtime.model.dto.Planta;
import com.energyview.realtime.model.dto.PlantaMonitoreo;
import com.energyview.realtime.model.dto.SitioInfo;


public interface IPlantaServices extends IServiceBase<Planta> {

	List<PlantaMonitoreo> GetPlantaMonitoreo();

	Planta GetValues(String idequipo);
	
	SitioInfo GetSitioInfo(String idequipo);
	
	List<Equipo> GetEquipos();

}
