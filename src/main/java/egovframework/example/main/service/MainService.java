package egovframework.example.main.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MainService {

	List<?> selectReviewsList() throws Exception;

	boolean insertReviewsOneTx(HttpServletRequest request) throws Exception;

	boolean ReviewsPwCheckTx(HttpServletRequest request) throws Exception;

	int updatetReviewsOne(Map<String, Object> reviewsEditEgov) throws Exception;

	int deleteReviewsOne(String reviewsDeleteOne) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectReviewsPagingList(PaginReviewVO paginReviewVo) throws Exception;

	EgovMap selectReviewsListCnt(PaginReviewVO paginReviewVo) throws Exception;
		
}

