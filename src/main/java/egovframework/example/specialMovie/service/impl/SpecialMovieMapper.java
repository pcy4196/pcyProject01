package egovframework.example.specialMovie.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.example.specialMovie.service.PagingVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("specialMovieMapper")
public interface SpecialMovieMapper {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectSpecialMovieList() throws Exception;
	
	int updateSpecialMovieViewCnt(HashMap<String, Object> resMap) throws Exception;
	
	int insertSpecialMovieTable(EgovMap egovMap) throws Exception;
	
	int deleteSpecialMovieOne(EgovMap egovMap) throws Exception;
	
	EgovMap selectSpecialMoviePagingListCnt(PagingVO pagingVO) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectSpecialMoviePagingList(PagingVO pagingVO) throws Exception;
	
	EgovMap selectSpecialMovieOne(HashMap<String, Object> resMap) throws Exception;	
}
