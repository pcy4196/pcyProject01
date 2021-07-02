package egovframework.example.fanPage.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface FanPageService {

	@SuppressWarnings("rawtypes")
	List<Map> selectFanPagePagingList(PagingFanPageVO pagingFanPageVO) throws Exception;

	@SuppressWarnings("rawtypes")
	Map selectFanPagePagingListCnt(PagingFanPageVO pagingFanPageVO) throws Exception;

	int insertFanPageData(EgovMap egovMap) throws Exception;

	Map<String, Object> selectFanPageDataTx(String no) throws Exception;

	int updateFanPageData(EgovMap egovMap) throws Exception;

	int deleteFanPageData(String no) throws Exception;

	List<?> selectReplyList(EgovMap egovMap) throws Exception;

	@SuppressWarnings("rawtypes")
	Map selectReplyListCnt(EgovMap egovMap) throws Exception;

	int insertReplyOne(Map<String, Object> reviewsOneMap) throws Exception;

	int updateReplyOne(Map<String, Object> reviewsOneMap) throws Exception;

	int deleteReplyOne(String rnum) throws Exception;	
}

