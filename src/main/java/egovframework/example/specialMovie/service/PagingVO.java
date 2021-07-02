package egovframework.example.specialMovie.service;

import egovframework.example.cmmn.CmmnVO;

public class PagingVO extends CmmnVO {	
	
	private long rows = 3; // 한페이지당 3개씩 보여주게 하기

	public long getRows() {
		return rows;
	}

	public void setRows(long rows) {
		this.rows = rows;
	}	
	
}
