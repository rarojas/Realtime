package com.energyview.realtime.controllers;

import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.energyview.realtime.minutal.mapper.ConsumoByMonthMapper;
import com.energyview.realtime.model.dto.ConsumoByMonth;

@Controller
public class Resumen {

	@Autowired
	@Qualifier("jdbctemplateVertica")
	JdbcTemplate vertica;

	@Autowired
	Properties queryProps;

	@RequestMapping("Resumen")
	public ModelAndView resumen() {
		ModelAndView modelAndView = new ModelAndView();
		String sql = queryProps.getProperty("ConsumoByMonth");
//		modelAndView.addObject("resumen", vertica.query(sql, new Object[] { 2015, 2 }, new ConsumoByMonthMapper()));
		return modelAndView;
	}

	@RequestMapping("/api/ConsumosByMonth/{month}/{year}")
	@ResponseBody
	public List<ConsumoByMonth> ConsumosByMonth(@PathVariable Integer month,
			@PathVariable Integer year) {
		String sql = queryProps.getProperty("ConsumoByMonth");
		return vertica.query(sql, new Object[] { year, month }, new ConsumoByMonthMapper());
	}

	@RequestMapping("/api/FPByMonth/{month}/{year}")
	@ResponseBody
	public List<ConsumoByMonth> FPByMonth(@PathVariable Integer month,
			@PathVariable Integer year) {
		String sql = queryProps.getProperty("FPByMonth");
		return vertica.query(sql, new Object[] { year, month },
				new ConsumoByMonthMapper());
	}
}
