package com.energyview.realtime.controllers;

import java.sql.Types;
import java.util.List;

import mappers.MinutalMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyview.realtime.model.dto.Equipo;
import com.energyview.realtime.model.dto.GetMinutal;
import com.energyview.realtime.model.dto.Sitio;
import com.energyview.realtime.model.dto.Variable;
import com.energyview.realtime.minutal.mapper.EquiposMapper;
import com.energyview.realtime.minutal.mapper.SitioMapper;
import com.energyview.realtime.minutal.mapper.VariableMapper;
import com.energyview.realtime.model.dto.Minutal;

@Controller
public class Minutales {

	@Autowired
	@Qualifier("jdbctemplateVertica")
	JdbcTemplate vertica;

	@RequestMapping("Minutales")
	public void minutales() {
	}

	@RequestMapping(value = "api/Minutal", method = RequestMethod.POST)
	@ResponseBody
	public List<Minutal> Get(@RequestBody GetMinutal minutal) {
		MapSqlParameterSource sqlParams = new MapSqlParameterSource();
		sqlParams.addValue("inicio", minutal.inicio, Types.DATE);
		sqlParams.addValue("fin", minutal.fin, Types.DATE);
		sqlParams.addValue("variable", minutal.variable, Types.INTEGER);
		sqlParams.addValue("sitio", minutal.sitio, Types.INTEGER);
		String sql = "SELECT * FROM minutales m INNER JOIN variables v on v.id = m.idvariable WHERE idsitio = ? AND idvariable = ? AND tagtimestamp between ? and ? AND idequipo = ?  order by tagtimestamp";
		List<Minutal> minutales = vertica.query(sql, new Object[] {
				minutal.sitio, minutal.variable, minutal.inicio, minutal.fin,
				minutal.equipo }, new MinutalMapper());
		return minutales;
	}

	@RequestMapping("api/Minutal/Sitios")
	@ResponseBody
	public List<Sitio> GetSitios() {
		String sql = "SELECT * FROM sitios";
		List<Sitio> sitios = vertica.query(sql, new SitioMapper());
		return sitios;
	}

	@RequestMapping("api/Minutal/variables")
	@ResponseBody
	public List<Variable> GetVariables() {
		String sql = "SELECT * FROM variables";
		List<Variable> sitios = vertica.query(sql, new VariableMapper());
		return sitios;
	}

	@RequestMapping("api/Minutal/equipos")
	@ResponseBody
	public List<Equipo> GetEquipos() {
		String sql = "SELECT * FROM equipos";
		List<Equipo> equipos = vertica.query(sql, new EquiposMapper());
		return equipos;
	}
}
