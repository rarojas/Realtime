package com.energyview.realtime.services;

import java.util.List;

public interface IServiceBase<T> {

	public List<T> Get();
	
	public T Get(int id);
}
