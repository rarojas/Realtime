package com.energyview.realtime.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyview.realtime.model.dto.Planta;
import com.energyview.realtime.model.dto.PlantaMonitoreo;
import com.energyview.realtime.model.dto.SitioInfo;
import com.energyview.realtime.mongo.models.Equipo;
import com.energyview.realtime.services.EquipoRepository;
import com.energyview.realtime.services.IPlantaServices;

@Controller
public class PlantasController {

	@Autowired
	IPlantaServices plantaService;

	@Autowired
	EquipoRepository equipoRepository;

	@RequestMapping("Plantas")
	public void Plantas() {
	}

	@RequestMapping("api/Plantas")
	@ResponseBody
	public List<PlantaMonitoreo> Get() {
		return  plantaService.GetPlantaMonitoreo();
	}

	@RequestMapping("api/Plantas/{id}")
	@ResponseBody
	public Planta Get(@PathVariable Integer id) {
		Planta planta = plantaService.Get(id);
		return planta;
	}

	@RequestMapping("api/Plantas/GetValues/{idequipo}")
	@ResponseBody
	public Planta GetValues(@PathVariable String idequipo) {
		return plantaService.GetValues(idequipo);
	}
	
	@RequestMapping("api/Plantas/Sitio/{idequipo}")
	@ResponseBody
	public SitioInfo Sitio(@PathVariable String idequipo) {
		return plantaService.GetSitioInfo(idequipo);
	}
	
	@RequestMapping("api/Plantas/Equipos")
	@ResponseBody
	public List<Equipo> Equipos() {
		return equipoRepository.findAll();
	}
	
	@RequestMapping("api/Plantas/CFE/{idequipo}")
	@ResponseBody
	public void Equipos(@PathVariable String idequipo) {
		
	}

}
