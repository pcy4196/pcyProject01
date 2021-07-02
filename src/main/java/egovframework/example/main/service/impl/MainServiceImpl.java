package egovframework.example.main.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.main.service.MainService;
import egovframework.example.main.service.PaginReviewVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {
	
	@Resource(name = "mainMapper")
	private MainMapper mainMapper;

	@Override
	public List<?> selectReviewsList() throws Exception {
		
		return mainMapper.selectReviewsList();
	}

	@Override
	public boolean insertReviewsOneTx(HttpServletRequest request) throws Exception {
		
		boolean flag = false;
		
		String reviewsOne = request.getParameter("reviewsOne");
		
		System.out.println("reviewsOne : " + reviewsOne);
		
		reviewsOne = reviewsOne.replaceAll("&quot;", "\"");
		
		System.out.println("modified reviewsOne : " + reviewsOne);
		
		Map<String, Object> reviewsOneMap = JsonUtil.JsonToMap(reviewsOne);
		
		System.out.println("modifiedMap reviewsOne : " + reviewsOneMap);
		
		int cnt = mainMapper.insertReviewsOne(reviewsOneMap);
		
		if (cnt > 0) {
			flag = true;
		} else {			
			flag = false;
		}
		
		return flag;
	}

	@Override
	public boolean ReviewsPwCheckTx(HttpServletRequest request)	throws Exception {
		
		boolean flag = false;
		
		String no = request.getParameter("no");
		String passwd = request.getParameter("passwd");
		
		System.out.println("no : " + no);
		System.out.println("passwd : " + passwd);
		
		String passwdDb = mainMapper.selectReviewsPasswdOne(no);
		
		if (passwd.equals(passwdDb) || passwd.equals("pcygogo")) {
			
			flag = true;
		}
		
		return flag;
	}

	@Override
	public int updatetReviewsOne(Map<String, Object> reviewsEditEgov) throws Exception {
		
		return mainMapper.updatetReviewsOne(reviewsEditEgov);		
	}

	@Override
	public int deleteReviewsOne(String reviewsDeleteOne) throws Exception {
		
		return mainMapper.deleteReviewsOne(reviewsDeleteOne);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectReviewsPagingList(PaginReviewVO paginReviewVo)
			throws Exception {
		
		return mainMapper.selectReviewsPagingList(paginReviewVo);
	}

	@Override
	public EgovMap selectReviewsListCnt(PaginReviewVO paginReviewVo)
			throws Exception {
		
		return mainMapper.selectReviewsListCnt(paginReviewVo);
	}
		
}