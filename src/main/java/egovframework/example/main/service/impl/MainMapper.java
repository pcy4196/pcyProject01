package egovframework.example.main.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.main.service.PaginReviewVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mainMapper")
public interface MainMapper {
	
	List<?> selectReviewsList() throws Exception;

	int insertReviewsOne(Map<String, Object> reviewsOneMap) throws Exception;

	String selectReviewsPasswdOne(String no) throws Exception;
	
	int updatetReviewsOne(Map<String, Object> reviewsEditEgov) throws Exception;
	
	int deleteReviewsOne(String reviewsDeleteOne) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectReviewsPagingList(PaginReviewVO paginReviewVo) throws Exception;
	
	EgovMap selectReviewsListCnt(PaginReviewVO paginReviewVo) throws Exception;
}
