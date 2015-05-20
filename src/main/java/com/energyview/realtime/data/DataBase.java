package com.energyview.realtime.data;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class DataBase<T> {

	@Autowired
	@Qualifier("jdbctemplate")
	JdbcTemplate informix;

	protected Class<?> dataMapper;

	@SuppressWarnings("unchecked")
	public List<T> GetList(String sql){
		List<T> result = null;
		try {
			result = informix.query(sql, (RowMapper<T>) dataMapper
					.getDeclaredConstructors()[0].newInstance());
		} catch (DataAccessException | InstantiationException
				| IllegalAccessException | IllegalArgumentException
				| InvocationTargetException | SecurityException e) { 
			e.printStackTrace();
		}
		return result;
	}

}
