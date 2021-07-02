package egovframework.example.main.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.main.service.MainService;
import egovframework.example.main.service.PaginReviewVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MainController {

	@Resource(name = "mainService")
	private MainService mainService;

	@RequestMapping(value = "main.do")
	public String initMain() throws Exception {

		return "main/main.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "reviewMain.do")
	public String reviewMain(PaginReviewVO paginReviewVo, ModelMap model) throws Exception {
		
		List<Map> reviewsList = mainService.selectReviewsPagingList(paginReviewVo);
		
		model.addAttribute("reviewsList", reviewsList);
		
		EgovMap reviewsListCnt = mainService.selectReviewsListCnt(paginReviewVo);
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();

		resMap.put("total", reviewsListCnt.get("totalPage"));
		resMap.put("page", paginReviewVo.getPage());
		resMap.put("pageScale", paginReviewVo.getPageScale());
		
		int pageGroup = (int) Math.ceil((double)paginReviewVo.getPage() / paginReviewVo.getPageScale());
		
		long startPage = (pageGroup - 1) * paginReviewVo.getPageScale() + 1;

		paginReviewVo.setStartPage(startPage);

		resMap.put("startPage", paginReviewVo.getStartPage());
		
		long endPage = startPage + paginReviewVo.getPageScale() - 1;

		paginReviewVo.setEndPage(endPage);

		resMap.put("endPage", paginReviewVo.getEndPage());
		
		// 이전 페이지
		long prePage = (pageGroup - 2) * paginReviewVo.getPageScale() + 1;
		
		// 다음 페이지
		long nextPage = pageGroup * paginReviewVo.getPageScale() + 1;
		
		System.out.println("pageGroup : " + pageGroup);
		System.out.println("prePage : " + prePage);
		System.out.println("nextPage : " + nextPage);

		resMap.put("pageGroup", pageGroup);
		resMap.put("prePage", prePage);
		resMap.put("nextPage", nextPage);

		model.addAttribute("resMap", resMap);

		return "main/reviewMain";
	}

	@RequestMapping(value = "/mainReviewsList.do")
	public void mainReviewsList(HttpServletResponse response) throws Exception {

		PrintWriter out = null;

		response.setCharacterEncoding("UTF-8");

		List<?> reviewsList = mainService.selectReviewsList();

		out = response.getWriter();

		out.write(JsonUtil.ListToJson(reviewsList));
	}

	@RequestMapping(value = "/mainReviewsCreate.do")
	public void mainReviewsCreate(HttpServletRequest request, HttpServletResponse response) throws Exception {

		PrintWriter out = null;

		HashMap<String, Object> resMap = new HashMap<String, Object>();

		response.setCharacterEncoding("UTF-8");

		try {
			
			boolean flag = mainService.insertReviewsOneTx(request);
						
			if (flag) {
				
				resMap.put("result", "success");
			} else {
				
				resMap.put("result", "fail");
			}		

			out = response.getWriter();			
			
			out.write(JsonUtil.HashMapToJson(resMap).toString());
		} catch (Exception e) {

		}
	}
	
	@RequestMapping(value = "/mainReviewsEdit.do")
	public void mainReviewsEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {

		PrintWriter out = null;

		HashMap<String, Object> resMap = new HashMap<String, Object>();

		response.setCharacterEncoding("UTF-8");

		try {
			
			String reviewsEditOne = request.getParameter("reviewsEditOne");			
			System.out.println(reviewsEditOne);
			
			reviewsEditOne = reviewsEditOne.replaceAll("&quot;", "\"");
			System.out.println(reviewsEditOne);
			
			Map<String, Object> reviewsEditEgov = JsonUtil.JsonToMap(reviewsEditOne);
			System.out.println("modified reviewsEditOne : " + reviewsEditEgov);
						
			int cnt = mainService.updatetReviewsOne(reviewsEditEgov);
						
			if (cnt > 0) {
				
				resMap.put("result", "success");
			} else {
				
				resMap.put("result", "fail");
			}		

			out = response.getWriter();			
			
			out.write(JsonUtil.HashMapToJson(resMap).toString());
		} catch (Exception e) {

		}
	}
	
	@RequestMapping(value = "/mainReviewsDelete.do")
	public void mainReviewsDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {

		PrintWriter out = null;

		HashMap<String, Object> resMap = new HashMap<String, Object>();

		response.setCharacterEncoding("UTF-8");

		try {
			
			String reviewsDeleteOne = request.getParameter("no");			
			System.out.println(reviewsDeleteOne);
			
						
			int cnt = mainService.deleteReviewsOne(reviewsDeleteOne);
			
			if (cnt > 0) {
				
				resMap.put("result", "success");
			} else {
				
				resMap.put("result", "fail");
			}		

			out = response.getWriter();			
			
			out.write(JsonUtil.HashMapToJson(resMap).toString());
		} catch (Exception e) {

		}
	}
	
	@RequestMapping(value = "/mainReviewsCheck.do")
	public void mainReviewsCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		PrintWriter out = null;

		HashMap<String, Object> resMap = new HashMap<String, Object>();

		response.setCharacterEncoding("UTF-8");

		try {
			
			boolean flag = mainService.ReviewsPwCheckTx(request);
						
			if (flag) {
				
				resMap.put("result", "success");
			} else {
				
				resMap.put("result", "fail");
			}		

			out = response.getWriter();
						
			out.write(JsonUtil.HashMapToJson(resMap).toString());
		} catch (Exception e) {

		}
	}

}
