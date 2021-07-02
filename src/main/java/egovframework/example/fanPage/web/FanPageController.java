package egovframework.example.fanPage.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.fanPage.service.FanPageService;
import egovframework.example.fanPage.service.PagingFanPageVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class FanPageController {
	
	@Resource(name = "fanPageService")
	private FanPageService fanPageService;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "fanPage.do")
	public String fanPage(PagingFanPageVO pagingFanPageVO, ModelMap model) throws Exception {
		
		Map pageListCnt = fanPageService.selectFanPagePagingListCnt(pagingFanPageVO);
		Map resMap = new HashMap();
		resMap.put("totalPage", pageListCnt.get("totalPage"));	// 토탈 페이지
		resMap.put("page", pagingFanPageVO.getPage());			// 현재 페이지
		
		int pageGroup = (int) Math.ceil((double)pagingFanPageVO.getPage() / pagingFanPageVO.getPageScale()); // 페이지 그룹
		resMap.put("pageGroup", pageGroup);	
		
		long startPage = (pageGroup - 1) * pagingFanPageVO.getPageScale() + 1; // 페이징 스타트 페이지
		pagingFanPageVO.setStartPage(startPage);
		resMap.put("startPage", pagingFanPageVO.getStartPage());
		
		long endPage = startPage + pagingFanPageVO.getPageScale() - 1; // 페이징 마지막 페이지
		pagingFanPageVO.setEndPage(endPage);
		resMap.put("endPage", pagingFanPageVO.getEndPage());
		
		long prePage = (pageGroup - 2) * pagingFanPageVO.getPageScale() + 1; // <<
		resMap.put("prePage", prePage);
		
		long nextPage = pageGroup * pagingFanPageVO.getPageScale() + 1; // >>
		resMap.put("nextPage", nextPage);
		
		List<Map> fanPageList = fanPageService.selectFanPagePagingList(pagingFanPageVO);
		
		model.addAttribute("resMap", resMap);
		model.addAttribute("fanPageList", fanPageList);
		
		return "fanPage/fanPage.tiles";
	}
	
	@RequestMapping(value = "fanPageCreate.do", method = RequestMethod.GET)
	public String fanPageCreate(HttpSession session) throws Exception {
		
		if (session.getAttribute("id") != null && session.getAttribute("id") != "") {
			
			return "fanPage/fanPageCreate.tiles";
		} else {
						
			return "redirect:fanPage.do?pageName=menu10&page=1";
		}		
	}
	
	@RequestMapping(value = "fanPageCreate.do", method = RequestMethod.POST)
	public String fanPageCreate(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {
		
		EgovMap egovMap = new EgovMap();
		egovMap.put("wname", request.getParameter("wname"));
		egovMap.put("title", request.getParameter("title"));
		
		String content = request.getParameter("content"); // html 태그로 변경
		content = content.replaceAll("&lt;", "<");
		content = content.replaceAll("&gt;", ">");
		content = content.replaceAll("&quot;", "\"");
		content = content.replaceAll("&amp;gt;", ">");
		content = content.replaceAll("&nbsp;", " ");
		System.out.println("content : " + content);		
		
		egovMap.put("content", content);		
		
		int result = fanPageService.insertFanPageData(egovMap);
		
		if (result > 0) {
			
			model.addAttribute("msg", "글을 등록했습니다.");
			
			return "redirect:fanPage.do?pageName=menu10&page=" + request.getParameter("page");
		} else {
			
			model.addAttribute("msg", "글을 등록하지 못 했습니다.");
			
			return "redirect:fanPage.do?pageName=menu10&page=" + request.getParameter("page");
		}						
	}
	
	@RequestMapping(value = "fanPageContent.do")
	public String fanPageContent(HttpServletRequest request, ModelMap model) throws Exception {
		
		String no = request.getParameter("no");
		
		Map<String, Object> fanPageContent = fanPageService.selectFanPageDataTx(no);
		
		model.addAttribute("fanPageContent", fanPageContent);		
		
		return "fanPage/fanPageContent.tiles";		
	}	
	
	@RequestMapping(value = "fanPageUpdate.do", method = RequestMethod.GET)
	public String fanPageUpdate(HttpServletRequest request, ModelMap model) throws Exception {
		
		String no = request.getParameter("no");
		
		Map<String, Object> fanPageContent = fanPageService.selectFanPageDataTx(no);
		
		model.addAttribute("fanPageContent", fanPageContent);
		
		return "fanPage/fanPageUpdate.tiles";		
	}
	
	@RequestMapping(value = "fanPageUpdate.do", method = RequestMethod.POST)
	public String fanPageUpdate(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {
		
		EgovMap egovMap = new EgovMap();
		egovMap.put("no", request.getParameter("no"));
		egovMap.put("title", request.getParameter("title"));
		
		String content = request.getParameter("content"); // html 태그로 변경
		content = content.replaceAll("&lt;", "<");
		content = content.replaceAll("&gt;", ">");
		content = content.replaceAll("&quot;", "\"");
		content = content.replaceAll("&amp;gt;", ">");	
		content = content.replaceAll("&nbsp;", " ");
		System.out.println("content : " + content);		
		
		egovMap.put("content", content);	
		
		int result = fanPageService.updateFanPageData(egovMap);
		
		if (result > 0) {
			
			model.addAttribute("msg", "글을 수정했습니다.");
			
			return "redirect:fanPageContent.do?pageName=menu10&page=" + request.getParameter("page") + "&no=" + request.getParameter("no") + "&rpage=1";
		} else {
			
			model.addAttribute("msg", "글을 수정하지 못 했습니다.");
			
			return "redirect:fanPageContent.do?pageName=menu10&page=" + request.getParameter("page") + "&no=" + request.getParameter("no") + "&rpage=1";
		}	
	}
	
	@RequestMapping(value = "fanPagedelete.do")
	public String fanPagedelete(HttpServletRequest request, ModelMap model) throws Exception {
		
		String no = request.getParameter("no");
		
		int result = fanPageService.deleteFanPageData(no);
		
		if (result > 0) {
			
			model.addAttribute("msg", "글을 삭제했습니다.");
			
			return "redirect:fanPage.do?pageName=menu10&page=" + request.getParameter("page");
		} else {
			
			model.addAttribute("msg", "글을 삭제하지 못 했습니다.");
			
			return "redirect:fanPage.do?pageName=menu10&page=" + request.getParameter("page");
		}	
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "fapReplyList.do")
	public void fapReviewsList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		PrintWriter out = null;
		
		response.setCharacterEncoding("UTF-8");
						
		EgovMap egovMap = new EgovMap();
		egovMap.put("no", request.getParameter("no"));
		egovMap.put("rpage", Integer.parseInt(request.getParameter("rpage")));
		egovMap.put("rows", 5);
		
		List<?> replyList = fanPageService.selectReplyList(egovMap);
		Map replyListCnt = fanPageService.selectReplyListCnt(egovMap);
		Map resMap = new HashMap();
		resMap.put("totalPage", replyListCnt.get("totalPage"));
		resMap.put("page", egovMap.get("rpage"));
		
		int pageGroup = (int) Math.ceil(((double) Integer.parseInt(request.getParameter("rpage"))) / 5.0); // 페이지 그룹
		System.out.println("pageGroup : " + pageGroup);
		resMap.put("pageGroup", pageGroup);	
		
		long startPage = (long) ((pageGroup - 1) * 5.0 + 1.0); // 페이징 스타트 페이지
		resMap.put("startPage", startPage);
		
		long endPage = (long) (startPage + 5.0 - 1.0); // 페이징 마지막 페이지
		resMap.put("endPage", endPage);
		
		long prePage = (long) ((pageGroup - 2) * 5.0 + 1.0); // <<
		resMap.put("prePage", prePage);
		
		long nextPage = (long) (pageGroup * 5.0 + 1.0); // >>
		resMap.put("nextPage", nextPage);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", replyList);
		result.put("resMap", resMap);
		
		out = response.getWriter();
		
		System.out.println("result : " + result);
		
		out.write(JsonUtil.HashMapToJson(result));
	}
	
	@RequestMapping(value = "/fapReplyCreate.do")
	public void fapReviewsCreate(HttpServletRequest request, HttpServletResponse response) throws Exception {

		PrintWriter out = null;

		HashMap<String, Object> resMap = new HashMap<String, Object>();

		response.setCharacterEncoding("UTF-8");

		try {
			
			String reviewsOne = request.getParameter("reviewsOne");
			
			System.out.println("reviewsOne : " + reviewsOne);
			
			reviewsOne = reviewsOne.replaceAll("&quot;", "\"");
			
			System.out.println("modified reviewsOne : " + reviewsOne);
			
			Map<String, Object> reviewsOneMap = JsonUtil.JsonToMap(reviewsOne);
			
			System.out.println("modifiedMap reviewsOne : " + reviewsOneMap);
			
			int cnt = fanPageService.insertReplyOne(reviewsOneMap);
						
			if (cnt > 0) {
				
				resMap.put("result", "success");
			} else {
				
				resMap.put("result", "fail");
			}		

			out = response.getWriter();			
			
			out.write(JsonUtil.HashMapToJson(resMap));
		} catch (Exception e) {

		}
	}
	
	@RequestMapping(value = "/fapReplyEdit.do")
	public void fapReviewsEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {

		PrintWriter out = null;

		HashMap<String, Object> resMap = new HashMap<String, Object>();

		response.setCharacterEncoding("UTF-8");

		try {
			
			String reviewsOne = request.getParameter("reviewsOne");
			
			System.out.println("reviewsOne : " + reviewsOne);
			
			reviewsOne = reviewsOne.replaceAll("&quot;", "\"");
			
			System.out.println("modified reviewsOne : " + reviewsOne);
			
			Map<String, Object> reviewsOneMap = JsonUtil.JsonToMap(reviewsOne);
			
			System.out.println("modifiedMap reviewsOne : " + reviewsOneMap);
			
			int cnt = fanPageService.updateReplyOne(reviewsOneMap);
						
			if (cnt > 0) {
				
				resMap.put("result", "success");
			} else {
				
				resMap.put("result", "fail");
			}		

			out = response.getWriter();			
			
			out.write(JsonUtil.HashMapToJson(resMap));
		} catch (Exception e) {

		}
	}
	
	@RequestMapping(value = "/fapReplyDelete.do")
	public void fapReplyDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {

		PrintWriter out = null;

		HashMap<String, Object> resMap = new HashMap<String, Object>();

		response.setCharacterEncoding("UTF-8");

		try {
			
			String rnum = request.getParameter("rnum");			
									
			int cnt = fanPageService.deleteReplyOne(rnum);
			
			if (cnt > 0) {
				
				resMap.put("result", "success");
			} else {
				
				resMap.put("result", "fail");
			}		

			out = response.getWriter();			
			
			out.write(JsonUtil.HashMapToJson(resMap));
		} catch (Exception e) {

		}
	}
}
