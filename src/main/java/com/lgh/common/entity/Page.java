package com.lgh.common.entity;

import java.io.Serializable;
import java.math.BigInteger;

public class Page implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1562470197329501363L;
	
	private BigInteger currPage;
	private BigInteger pageSize;
	
	public BigInteger getCurrPage() {
		return currPage;
	}
	public void setCurrPage(BigInteger currPage) {
		this.currPage = currPage;
	}
	public BigInteger getPageSize() {
		return pageSize;
	}
	public void setPageSize(BigInteger pageSize) {
		this.pageSize = pageSize;
	}

}
