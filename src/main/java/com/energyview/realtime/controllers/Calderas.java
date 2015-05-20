package com.energyview.realtime.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyview.realtime.mappers.MinutalMapper;
import com.energyview.realtime.mappers.VariableMapper;
import com.energyview.realtime.model.Fase;
import com.energyview.realtime.model.SuministroCaldera;
import com.energyview.realtime.model.Variable;
import com.energyview.realtime.model.dto.CalderaValues;
import com.energyview.realtime.model.dto.FallaCB;
import com.energyview.realtime.model.dto.Minutal;
import com.energyview.realtime.model.dto.Secuencia;
import com.energyview.realtime.services.IRandomGenerator;

@Controller
public class Calderas {

	@Autowired
	@Qualifier("jdbctemplate")
	JdbcTemplate informix;

	@Autowired
	@Qualifier("jdbctemplateVertica")
	JdbcTemplate vertica;

	@Autowired
	Properties queryProps;

	@Autowired
	IRandomGenerator randomize;

	@RequestMapping(value = "Calderas")
	public void home() {
	}

	@RequestMapping(value = "/api/calderas/demanda/{idsitio}")
	@ResponseBody
	public List<Minutal> DemnadaElectrica(
			@PathVariable("idsitio") int idsitio) {
		String sql = "SELECT  *  FROM MINUTALES m INNER JOIN variables v on v.id = m.idvariable WHERE IDEQUIPO = 500005 AND IDSITIO = ? AND m.IDVARIABLE = 5 AND tagtimestamp >  timestampadd('hh',-12,NOW())  order by tagtimestamp";
		List<Minutal> minutales = vertica.query(sql,new Object[]{ idsitio}, new MinutalMapper());
		return minutales;
	}

	@RequestMapping(value = "/api/calderas/suministro/{idsitio}")
	@ResponseBody
	public SuministroCaldera Suministro(@PathVariable("idsitio") String idsitio) {
		String sql = queryProps.getProperty("SuministroCaldera");
		List<Variable> variables = informix.query(sql,
				new Object[] { idsitio }, new VariableMapper());
		SuministroCaldera suministro = new SuministroCaldera();
		Map<String, List<Variable>> variablebyComponente = new HashMap<String, List<Variable>>();
		for (Variable variable : variables) {
			String key = variable.getComponente();
			if (!variablebyComponente.containsKey(key)) {
				variablebyComponente.put(key, new ArrayList<Variable>());
			}
			variablebyComponente.get(key).add(variable);
		}
		for (Entry<String, List<Variable>> variable : variablebyComponente.entrySet()) {
			Fase fase = new Fase();
			for (Variable var : variable.getValue()) {
				switch (var.getVariable()) {
				case "VOLTAJE":
					fase.voltaje = var;
					break;
				case "CORRIENTE":
					fase.corriente = var;
					break;
				}
			}
			suministro.fases.add(fase);
			suministro.fp = randomize.Generate(0.9, 10d);
		}
		return suministro;
	}

	@RequestMapping(value = "/api/calderas/values")
	@ResponseBody
	public CalderaValues Values(){		com.energyview.realtime.model.dto.
		CalderaValues values  = new CalderaValues();
		values.setModulacion(randomize.Generate(80d, 10d));
		values.setEficiencia(randomize.Generate(80d, 10d));
		values.setOxigeno(randomize.Generate(80d, 10d));
		values.setDemanda(randomize.Generate(30d, 10d));
		values.setAgua(randomize.Generate(90d, 10d));
		values.setChimenea(randomize.Generate(90d, 10d));
		values.setHoras(1502d);
		values.setCiclos(18000d);
		values.setFlama(100d);
		values.setPurga(5.1);
		values.setPostpurga(10.3);
				
		return values;
	}
	
	
	@RequestMapping(value = "/api/calderas/fallas")
	@ResponseBody
	public FallaCB fallas(){
		FallaCB fallas = new FallaCB();
		fallas.setFalla1("NO FALLAS");
		fallas.setFalla2("NO FALLAS");
		return  fallas;
	}
	
	
	@RequestMapping(value = "/api/calderas/secuencia")
	@ResponseBody
	public Secuencia secuencia(){
		Secuencia secuencia = new Secuencia();		
		return  secuencia;
	}
}
