package com.energyview.realtime.controllers;

import java.util.List;

import mappers.DisponibilidadMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyview.realtime.model.Sitio;



@Controller
public class Disponibilidad {

	@Autowired
	@Qualifier("jdbctemplate")
	JdbcTemplate informix;
	
	@RequestMapping("Disponibilidad")
	public void disponibilidad(){		
	}
	
	@RequestMapping(value = "api/disponibilidad/sitios/{idcliente}", method = RequestMethod.GET)
	@ResponseBody
	public List<Sitio> Sitios(@PathVariable("idcliente") String idcliente) {
		List<Sitio> sitios = informix.query(
				"Select * From ext_cognos Where variable = 'DISPONIBILIDAD' and componente = 'RTU' and idcliente = ?",
				new Object[] { idcliente }, new DisponibilidadMapper());
		return sitios;
	}
	
}
