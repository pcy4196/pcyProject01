package egovframework.example.specialMovie.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.specialMovie.service.PagingVO;
import egovframework.example.specialMovie.service.SpecialMovieService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("SpecialMovieService")
public class SpecialMovieServiceImpl extends EgovAbstractServiceImpl implements SpecialMovieService {

	@Resource(name = "specialMovieMapper")
	private SpecialMovieMapper specialMovieMapper;

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectSpecialMovieList() throws Exception {

		return specialMovieMapper.selectSpecialMovieList();
	}

	/*@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectSpecialMovieOne(HashMap<String, Object> resMap)
			throws Exception {

		return specialMovieMapper.selectSpecialMovieOne(resMap);
	}*/

	@Override
	public int updateSpecialMovieViewCnt(HashMap<String, Object> resMap)
			throws Exception {

		return specialMovieMapper.updateSpecialMovieViewCnt(resMap);
	}

	@Override
	public int insertSpecialMovieTable(EgovMap egovMap) throws Exception {

		return specialMovieMapper.insertSpecialMovieTable(egovMap);
	}

	@Override
	public int deleteSpecialMovieOne(EgovMap egovMap) throws Exception {

		return specialMovieMapper.deleteSpecialMovieOne(egovMap);
	}

	@Override
	public EgovMap selectSpecialMoviePagingListCnt(PagingVO pagingVO)
			throws Exception {
		
		return specialMovieMapper.selectSpecialMoviePagingListCnt(pagingVO);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectSpecialMoviePagingList(PagingVO pagingVO)
			throws Exception {

		return specialMovieMapper.selectSpecialMoviePagingList(pagingVO);
	}

	@Override
	public EgovMap selectSpecialMovieOne(HashMap<String, Object> resMap)
			throws Exception {
		
		return specialMovieMapper.selectSpecialMovieOne(resMap);
	}

	
	
}