package egovframework.example.specialMovie.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.specialMovie.service.PagingVO;
import egovframework.example.specialMovie.service.SpecialMovieService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class SpecialMovieController {
	
	@Resource(name = "SpecialMovieService")
	private SpecialMovieService specialMovieService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "specialMovie.do") // 글 조회하기 + 페이징
	public String initSpecialMovie(PagingVO pagingVO ,ModelMap model) throws Exception {
		
		EgovMap pageListCnt = specialMovieService.selectSpecialMoviePagingListCnt(pagingVO);
		System.out.println("totalPage : " + pageListCnt.get("totalPage"));
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("totalPage", pageListCnt.get("totalPage")); // 토탈 페이지
		resMap.put("page", pagingVO.getPage());
		
		int pageGroup = (int) Math.ceil((double)pagingVO.getPage() / pagingVO.getPageScale()); // 페이지 그룹
		System.out.println(pageGroup);
		resMap.put("pageGroup", pageGroup);
		
		long startPage = (pageGroup - 1) * pagingVO.getPageScale() + 1; // 페이징 스타트 페이지
		resMap.put("startPage", startPage);
		
		long endPage = startPage + pagingVO.getPageScale() - 1; // 페이징 마지막 페이지
		resMap.put("endPage", endPage);
		
		long prePage = (pageGroup - 2) * pagingVO.getPageScale() + 1; // <<
		resMap.put("prePage", prePage);
		
		long nextPage = pageGroup * pagingVO.getPageScale() + 1; // >>
		resMap.put("nextPage", nextPage);
		
		List<Map> smvTalbe = specialMovieService.selectSpecialMoviePagingList(pagingVO);		
		
		model.addAttribute("smvTable", smvTalbe);
		model.addAttribute("resMap", resMap);

		return "specialMovie/specialMovie.tiles";
	}
	
	/*@SuppressWarnings("rawtypes")
	@RequestMapping(value = "specialMovie.do") // 글 조회하기
	public String initSpecialMovie(PagingVO pagingVO ,ModelMap model) throws Exception {
		
		List<Map> smvTalbe = specialMovieService.selectSpecialMovieList();
		
		System.out.println(smvTalbe);
		
		model.addAttribute("smvTable", smvTalbe);

		return "specialMovie/specialMovie.tiles";
	}*/

	@RequestMapping(value = "specialMovie01.do") // 관리자만 글 작성하게 하기
	public String specialMovie01(HttpServletRequest request, ModelMap model) throws Exception {
		
		String passwd = request.getParameter("passwd");
		
		if (passwd.equals("pcygogo")) {
			
			return "specialMovie/specialMovie_create.tiles";
		} else {
			
			model.addAttribute("message", "관리자가 아닙니다");
			
			return "forward:specialMovie.do";
		}		
	}
	
	@RequestMapping(value = "specialMovie02.do") // 글 조회수 +1 하기, 한줄 내용 불러오기
	public String specialMovie02(HttpServletRequest request, ModelMap model) throws Exception {
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();	
		
		resMap.put("tableNo", Integer.parseInt(request.getParameter("tableNo")));
		
		int result = specialMovieService.updateSpecialMovieViewCnt(resMap);	
		
		System.out.println(result + " row update");	// 글 조회수 +1 
	
		EgovMap smvTalbe = specialMovieService.selectSpecialMovieOne(resMap);
		System.out.println(smvTalbe);
		
		model.addAttribute("smvTable", smvTalbe);	// 한줄 내용 불러오기
		
		return "specialMovie/specialMovie_content.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "specialMovie03.do") // 글 작성하기
	public String specialMovie03(HttpServletRequest request, ModelMap model) throws Exception {
		
		EgovMap egovMap = new EgovMap();
		
		egovMap.put("title", request.getParameter("title"));
		egovMap.put("content", request.getParameter("content")); // 작성한 내용 egovMap으로 받기
		egovMap.put("movie", request.getParameter("movie"));		
		
		int result = specialMovieService.insertSpecialMovieTable(egovMap);		
		System.out.println(result + " row insert");	
		
		List<Map> smvTalbe = specialMovieService.selectSpecialMovieList();		
		System.out.println(smvTalbe); // 불러오는 컬럼 console에서 확인
		
		model.addAttribute("smvTable", smvTalbe);
		model.addAttribute("message", "글을 등록했습니다");
		
		return "forward:specialMovie.do";
	}
		
	@RequestMapping(value = "specialMovie04.do") // 글 삭제하기
	public String specialMovie04(HttpServletRequest request, ModelMap model) throws Exception {
		
		String passwd = request.getParameter("passwd");		
		
		if (passwd.equals("pcygogo")) {
			
			EgovMap egovMap = new EgovMap();			
			egovMap.put("tableno", Integer.parseInt(request.getParameter("tableNo")));
			
			int result = specialMovieService.deleteSpecialMovieOne(egovMap);
			System.out.println(result + " row delete");	
			
			model.addAttribute("message", "글을 삭제 했습니다");
			model.addAttribute("page", request.getParameter("page"));
						
			return "forward:specialMovie.do";
		} else {
			
			model.addAttribute("message", "관리자가 아닙니다");
			model.addAttribute("page", request.getParameter("page"));
			
			return "forward:specialMovie.do";
		}		
	}
}
