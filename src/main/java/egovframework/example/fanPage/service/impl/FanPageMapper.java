package egovframework.example.fanPage.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.fanPage.service.PagingFanPageVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("fanPageMapper")
public interface FanPageMapper {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectFanPagePagingList(PagingFanPageVO pagingFanPageVO) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map selectFanPagePagingListCnt(PagingFanPageVO pagingFanPageVO) throws Exception;
	
	int insertFanPageData(EgovMap egovMap) throws Exception;

	void updateFanPageViewCnt(String no) throws Exception;

	Map<String, Object> selectFanPageData(String no) throws Exception;
	
	int updateFanPageData(EgovMap egovMap) throws Exception;
	
	int deleteFanPageData(String no) throws Exception;
	
	List<?> selectReplyList(EgovMap egovMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map selectReplyListCnt(EgovMap egovMap) throws Exception;
	
	int insertReplyOne(Map<String, Object> reviewsOneMap) throws Exception;
	
	int updateReplyOne(Map<String, Object> reviewsOneMap) throws Exception;
	
	int deleteReplyOne(String rnum) throws Exception;
}
