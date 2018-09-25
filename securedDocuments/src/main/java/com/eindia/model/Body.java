package com.eindia.model;

import java.util.ArrayList;
import java.util.List;

public class Body<T> {

	private String status;

	private List<T> dataList = new ArrayList<T>();

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

}
