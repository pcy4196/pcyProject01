package egovframework.example.gallery.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.gallery.service.PagingGalleryVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("galleryMapper")
public interface GalleryMapper {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectGalleryList() throws Exception;
	
	Map<String, Object> selectGalleryContent(String tableNo) throws Exception;
	
	int insertGalleryOne(EgovMap egovMap) throws Exception;
	
	int updateGalleryContent(String tableNo) throws Exception;
	
	int updateGalleryOne(EgovMap egovMap) throws Exception;
	
	int deleteGalleryOne(EgovMap egovMap) throws Exception;
	
	EgovMap selectGalleryPagingListCnt(PagingGalleryVO pagingGalleryVO) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectGalleryPagingList(PagingGalleryVO pagingGalleryVO) throws Exception;
}
