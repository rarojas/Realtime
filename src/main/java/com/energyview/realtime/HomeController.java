package com.energyview.realtime;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import mappers.ClienteMapper;
import mappers.ConsumoMonthMapper;
import mappers.ConsumosMapper;
import mappers.DatosGeneralesMapper;
import mappers.EquipoMapper;
import mappers.SitioMapper;
import mappers.VariableMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyview.realtime.model.Cliente;
import com.energyview.realtime.model.Consumo;
import com.energyview.realtime.model.ConsumoMonth;
import com.energyview.realtime.model.Equipo;
import com.energyview.realtime.model.Sitio;
import com.energyview.realtime.model.Variable;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	@Qualifier("jdbctemplate")
	JdbcTemplate informix;

	@Autowired
	@Qualifier("jdbctemplateMySQL")
	JdbcTemplate mysql;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "home";
	}

	@RequestMapping(value = "/Sitios", method = RequestMethod.GET)
	public String Sitios(Locale locale, Model model) {
		return "Sitios";
	}

	@RequestMapping(value = "/Equipos", method = RequestMethod.GET)
	@ResponseBody
	public List<Equipo> Equipo() {
		List<Equipo> equipos = informix.query("Select * from tablaequipos",
				new EquipoMapper());
		return equipos;
	}

	@RequestMapping(value = "/Clientes", method = RequestMethod.GET)
	@ResponseBody
	public List<Cliente> Clientes() {
		List<Cliente> clientes = informix.query("Select * from tablaclientes",
				new ClienteMapper());
		return clientes;
	}

	@RequestMapping(value = "/sitios/{idcliente}", method = RequestMethod.GET)
	@ResponseBody
	public List<Sitio> Sitios(@PathVariable("idcliente") String idcliente) {
		List<Sitio> sitios = informix.query(
				"Select * from tablasitios where idcliente = ?",
				new Object[] { idcliente }, new SitioMapper());
		return sitios;
	}

	@RequestMapping(value = "/sitios", method = RequestMethod.GET)
	@ResponseBody
	public List<Sitio> Sitios() {
		List<Sitio> sitios = informix.query("Select * from tablasitios",
				new SitioMapper());
		return sitios;
	}

	@Transactional(value = "transactionManagerInformix", readOnly = true, isolation = Isolation.READ_UNCOMMITTED, propagation = Propagation.REQUIRED)
	@RequestMapping(value = "/sitios/Equipos/{idsitio}", method = RequestMethod.GET)
	@ResponseBody
	public List<Variable> SitioEquipos(@PathVariable String idsitio) {
		List<Variable> variables = informix.query(
				"Select * from ext_cognos where idsitio = ? and flagtr = 't' order by  componente, variable desc",
				new Object[] { idsitio }, new VariableMapper());
		return variables;
	}

	@RequestMapping(value = "/sitio/consumo/{nombresitio}", method = RequestMethod.GET)
	@ResponseBody
	public ConsumoMonth ConsumoSitio(@PathVariable String nombresitio) {
		Date d = new Date();
		ConsumoMonth consumo = new ConsumoMonth();
		@SuppressWarnings("deprecation")
		String sql = String
				.format("SELECT SUM(valor) as consumo, NOW() AS now,CAST(CONCAT(ANO,'-', MES,'-1') AS DATE) AS inicio  FROM 5minutales where  tipoequipo = 'ACOMETIDA'  "
						+ "and variable = 'CONSUMO' and sitio = '%s' and mes = %d and ano =  %d group by sitio",
						nombresitio, d.getMonth() + 1, d.getYear() + 1900);
	 consumo = mysql.queryForObject(sql, new ConsumoMonthMapper());		
		return consumo;
	}
	
	@RequestMapping(value = "/sitio/demandas/{nombresitio}", method = RequestMethod.GET)
	@ResponseBody
	public Consumo Demandas(@PathVariable String nombresitio) {		
		Consumo consumo = new Consumo();
		String sql = String.format("");
		consumo.consumo = informix.queryForObject(sql, Double.class);
		return consumo;
	}
	
	
	@RequestMapping(value = "/sitio/consumolast12/{nombresitio}", method = RequestMethod.GET)
	@ResponseBody
	public List<Consumo> ConsumoSitioLast12(@PathVariable String nombresitio) {		
		String sql = String.format("SELECT SUM(valor) as consumo,SUBDATE(cast((CONCAT(ANO,'-',MES,'-',DIA,' ',HORA,':00:00')) AS DATETIME), INTERVAL 6 HOUR) as 'hora' FROM 5minutales where  tipoequipo = 'ACOMETIDA' and variable = 'CONSUMO' and sitio = '%s' AND tagtimestamp >  SUBDATE(NOW(), INTERVAL 12 HOUR) group by sitio,hora order by 2",nombresitio);
		List<Consumo> consumos = mysql.query(sql, new  ConsumosMapper());		
		return consumos;
	}
	
	@RequestMapping(value = "/sitio/DatosGenerales/{idsitio}", method = RequestMethod.GET)
	@ResponseBody
	public List<com.energyview.realtime.model.DatosGenerales> DatosGenerales(@PathVariable String idsitio) {		
		String sql = String.format("select LIMIT 1 cliente,zonaregion,nombresitio,iprouter, nombrecontacto,telefono,puesto,correo,gpslongitud,gpslatitud "
				+ " from ext_cognos where idsitio = '%s';",idsitio);
		List<com.energyview.realtime.model.DatosGenerales> datos = informix.query(sql, new  DatosGeneralesMapper());		
		return datos;
	}

	
}
