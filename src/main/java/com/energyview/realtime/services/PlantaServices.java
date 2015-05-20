/**
 * 
 */
package com.energyview.realtime.services;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyview.realtime.data.IPlantaData;
import com.energyview.realtime.model.Variable;
import com.energyview.realtime.model.dto.Equipo;
import com.energyview.realtime.model.dto.Planta;
import com.energyview.realtime.model.dto.PlantaMonitoreo;
import com.energyview.realtime.model.dto.SitioInfo;
import com.energyview.realtime.model.dto.TablaLecturaDTO;

/**
 * @author ricardo
 *
 */
@Service
public class PlantaServices implements IPlantaServices {

	@Autowired
	IPlantaData plantadao;

	@Override
	public List<Planta> Get() {
		List<Variable> variables = plantadao.Get();
		Planta planta = new Planta();
		planta.setId(1);
		planta.setVoltajeBateria(14.2);
		List<Planta> result = new ArrayList<Planta>();
		for (Variable var : variables)
			result.add(planta);
		return result;
	}

	@Override
	public Planta Get(int id) {
		Planta result = new Planta();
		return result;
	}

	@Override
	public List<PlantaMonitoreo> GetPlantaMonitoreo() {
		return plantadao.GetPlantasMonitoreo();
	}

	@Override
	public Planta GetValues(String idequipo) {
		Planta planta = new Planta();
		List<TablaLecturaDTO> variables = plantadao.Get(idequipo);
		Field[] fields;
		fields = Planta.class.getFields();
		for (Field field : fields) {
			Description description = field.getAnnotation(Description.class);
			if (description != null) {
				for (TablaLecturaDTO r : variables) {
					if (r.getTagname().contains(description.value())) {
						try {
							Class<?> type = field.getType();							
							if (type.equals(Boolean.class)) {
								field.set(planta, r.getTagvalue() != 0);
							} else {
								field.set(planta, r.getTagvalue());
							}
						} catch (IllegalArgumentException
								| IllegalAccessException ex) {
							Logger.getLogger(PlantaServices.class.getName())
									.log(Level.SEVERE, null, ex);
						}
					}
				}
			}
		}
		return planta;
	}

	@Override
	public SitioInfo GetSitioInfo(String idequipo) {
		return plantadao.GetSitioInfo(idequipo);
	}

	@Override
	public List<Equipo> GetEquipos() {
		return plantadao.GetEquipos();
	}
}
