package com.energyview.realtime.model.dto;

import java.util.Date;

public class TablaLecturaDTO {
	
	public String tagname;
	public Double tagvalue;
	public Integer tagquality;
	public Date tagtimestamp;
	/**
	 * @return the tagname
	 */
	public String getTagname() {
		return tagname;
	}
	/**
	 * @param tagname the tagname to set
	 */
	public void setTagname(String tagname) {
		this.tagname = tagname;
	}
	/**
	 * @return the tagvalue
	 */
	public Double getTagvalue() {
		return tagvalue;
	}
	/**
	 * @param tagvalue the tagvalue to set
	 */
	public void setTagvalue(Double tagvalue) {
		this.tagvalue = tagvalue;
	}
	/**
	 * @return the tagquality
	 */
	public Integer getTagquality() {
		return tagquality;
	}
	/**
	 * @param tagquality the tagquality to set
	 */
	public void setTagquality(Integer tagquality) {
		this.tagquality = tagquality;
	}
	/**
	 * @return the tagtimestamp
	 */
	public Date getTagtimestamp() {
		return tagtimestamp;
	}
	/**
	 * @param tagtimestamp the tagtimestamp to set
	 */
	public void setTagtimestamp(Date tagtimestamp) {
		this.tagtimestamp = tagtimestamp;
	}
}