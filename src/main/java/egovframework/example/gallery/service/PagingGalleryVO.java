package egovframework.example.gallery.service;

import egovframework.example.cmmn.CmmnVO;

public class PagingGalleryVO extends CmmnVO {	
	
	private long rows = 6; // 한페이지당 6개씩 보여주게 하기
	
	private long pageScale = 5;

	public long getRows() {
		return rows;
	}

	public long getPageScale() {
		return pageScale;
	}

	public void setPageScale(long pageScale) {
		this.pageScale = pageScale;
	}

	public void setRows(long rows) {
		this.rows = rows;
	}	
	
}
