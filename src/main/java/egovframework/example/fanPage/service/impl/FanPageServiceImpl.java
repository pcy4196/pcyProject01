package egovframework.example.fanPage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.fanPage.service.FanPageService;
import egovframework.example.fanPage.service.PagingFanPageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("fanPageService")
public class FanPageServiceImpl extends EgovAbstractServiceImpl implements FanPageService {
	
	@Resource(name = "fanPageMapper")
	private FanPageMapper fanPageMapper;

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectFanPagePagingList(PagingFanPageVO pagingFanPageVO)
			throws Exception {
		
		return fanPageMapper.selectFanPagePagingList(pagingFanPageVO);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Map selectFanPagePagingListCnt(PagingFanPageVO pagingFanPageVO)
			throws Exception {
		
		return fanPageMapper.selectFanPagePagingListCnt(pagingFanPageVO);
	}

	@Override
	public int insertFanPageData(EgovMap egovMap) throws Exception {
		
		return fanPageMapper.insertFanPageData(egovMap);
	}

	@Override
	public Map<String, Object> selectFanPageDataTx(String no) throws Exception {
		
		fanPageMapper.updateFanPageViewCnt(no);
		
		return fanPageMapper.selectFanPageData(no);
	}

	@Override
	public int updateFanPageData(EgovMap egovMap) throws Exception {
		
		return fanPageMapper.updateFanPageData(egovMap);
	}

	@Override
	public int deleteFanPageData(String no) throws Exception {
		
		return fanPageMapper.deleteFanPageData(no);
	}

	@Override
	public List<?> selectReplyList(EgovMap egovMap) throws Exception {
		
		return fanPageMapper.selectReplyList(egovMap);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Map selectReplyListCnt(EgovMap egovMap) throws Exception {
		
		return fanPageMapper.selectReplyListCnt(egovMap);
	}

	@Override
	public int insertReplyOne(Map<String, Object> reviewsOneMap)
			throws Exception {
		
		return fanPageMapper.insertReplyOne(reviewsOneMap);
	}

	@Override
	public int updateReplyOne(Map<String, Object> reviewsOneMap)
			throws Exception {
		
		return fanPageMapper.updateReplyOne(reviewsOneMap);
	}

	@Override
	public int deleteReplyOne(String rnum) throws Exception {
		
		return fanPageMapper.deleteReplyOne(rnum);
	}

}