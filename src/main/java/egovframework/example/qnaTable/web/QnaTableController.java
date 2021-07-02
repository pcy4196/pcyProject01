package egovframework.example.qnaTable.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.qnaTable.service.QnaTableService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class QnaTableController {
	
	@Resource(name = "qnaTableService")
	private QnaTableService qnaTableService;
	
	@RequestMapping(value = "qnaTable01.do") // FAQ OF NBA 페이지 관련 컨트롤러
	public String initqnaTable01() throws Exception {

		return "qnaTable/faqPage.tiles";
	}
	
	@SuppressWarnings("rawtypes") // 리스트 보여주기
	@RequestMapping(value = "qnaTable02.do")
	public String initqnaTable02(ModelMap model) throws Exception {
		
		try {
			
			List<Map> qnaList = qnaTableService.selectQnaTableList();
			
			model.addAttribute("qnaList", qnaList);					
			model.addAttribute("message", "Q&A 게시판 입니다");
			
		} catch (Exception e) {
			
		}

		return "qnaTable/qnaPage01.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "qnaTable03.do") // 글 등록하기
	public String initqnaTable03(HttpServletRequest request, ModelMap model) throws Exception {
		
		EgovMap egovMap = new EgovMap();
		
		egovMap.put("name", request.getParameter("name"));
		egovMap.put("title", request.getParameter("title"));
		egovMap.put("content", request.getParameter("content"));
		egovMap.put("passwd", request.getParameter("passwd"));
				
		int result = qnaTableService.insertQnaTableList(egovMap);
		System.out.println(result+" row insert commit");
		
		List<Map> qnaList = qnaTableService.selectQnaTableList();
		
		model.addAttribute("qnaList", qnaList);		
		model.addAttribute("message", "글을 등록했습니다");		
				
		return "qnaTable/qnaPage01.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "qnaTable04.do") // 글 수정하는 화면
	public String initqnaTable04(HttpServletRequest request, ModelMap model) throws Exception {
		String superPw = "pcygogo"; // 슈퍼키 설정
		
		String passwd = request.getParameter("passwd"); // 패스워드 값 
		int idx = Integer.parseInt(request.getParameter("idx")); // idx 값
			
		EgovMap egovMap = new EgovMap();
		
		egovMap.put("passwd", passwd);
		egovMap.put("idx", idx);
		
		int checkPw = qnaTableService.selectCheckPw(egovMap);
		
		if (checkPw == 1 || passwd.equals(superPw)) { 	// 비밀번호 확인 및 수퍼 비밀번호 조회
			List<Map> qnaList = qnaTableService.selectQnaTableOne(egovMap);
			
			System.out.println(qnaList); // 콘솔창으로 확인
			model.addAttribute("qnaList", qnaList);
			
			return "qnaTable/qnaPage02.tiles";
		} else {										// 비밀번호 틀린 경우
			List<Map> qnaList = qnaTableService.selectQnaTableList();
			
			model.addAttribute("qnaList", qnaList);		
			model.addAttribute("message", "비밀번호가 틀렸습니다");		
			
			return "qnaTable/qnaPage01.tiles";
		}
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "qnaTable05.do") // 글 수정
	public String initqnaTable05(HttpServletRequest request, ModelMap model) throws Exception {
		
		EgovMap egovMap = new EgovMap();
		
		egovMap.put("idx", Integer.parseInt(request.getParameter("idx")));
		egovMap.put("name", request.getParameter("name"));
		egovMap.put("title", request.getParameter("title"));
		egovMap.put("content", request.getParameter("content"));
		egovMap.put("passwd", request.getParameter("passwd"));
		
		int result = qnaTableService.updateQnaTableList(egovMap);
		System.out.println(result);
	
		List<Map> qnaList = qnaTableService.selectQnaTableList();
		
		model.addAttribute("qnaList", qnaList);		
		model.addAttribute("message", "글을 수정했습니다");
		
		return "qnaTable/qnaPage01.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "qnaTable06.do") // 글 삭제
	public String initqnaTable06(HttpServletRequest request, ModelMap model) throws Exception {
		String superPw = "pcygogo"; // 슈퍼키 설정
		
		String passwd = request.getParameter("passwd"); // 패스워드 값 
		int idx = Integer.parseInt(request.getParameter("idx")); // idx 값
			
		EgovMap egovMap = new EgovMap();
		
		egovMap.put("passwd", passwd);
		egovMap.put("idx", idx);
		
		int checkPw = qnaTableService.selectCheckPw(egovMap);
		
		if (checkPw == 1 || passwd.equals(superPw)) { 	// 비밀번호 확인 및 수퍼 비밀번호 조회
			int result = qnaTableService.delteQnaTableOne(egovMap);
			System.out.println(result+" row insert delete"); // 콘솔창으로 확인
			
			List<Map> qnaList = qnaTableService.selectQnaTableList();
			
			model.addAttribute("qnaList", qnaList);		
			model.addAttribute("message", "글이 삭제 되었습니다");		
			
			return "qnaTable/qnaPage01.tiles";
		} else {										// 비밀번호 틀린 경우
			List<Map> qnaList = qnaTableService.selectQnaTableList();
			
			model.addAttribute("qnaList", qnaList);		
			model.addAttribute("message", "비밀번호가 틀렸습니다");		
			
			return "qnaTable/qnaPage01.tiles";
		}
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "qnaTable07.do") // 글 리플하는 화면
	public String initqnaTable07(HttpServletRequest request, ModelMap model) throws Exception {
		String superPw = "pcygogo"; // 슈퍼키 설정
		String passwd = request.getParameter("passwd");
		int idx = Integer.parseInt(request.getParameter("idx")); // 글 조회하기 위한 아이디 값 조회
		System.out.println(idx);
		
		EgovMap egovMap = new EgovMap();

		egovMap.put("idx", idx);
		
		if (passwd.equals(superPw)) { 	// 비밀번호 확인 및 수퍼 비밀번호 조회
			List<Map> qnaList = qnaTableService.selectQnaTableAllCol(egovMap);
			
			System.out.println(qnaList); // 콘솔창으로 확인
			model.addAttribute("qnaList", qnaList);
			
			return "qnaTable/qnaPage03.tiles";
		} else {										// 관리자가 아닌경우
			List<Map> qnaList = qnaTableService.selectQnaTableList();
			
			model.addAttribute("qnaList", qnaList);		
			model.addAttribute("message", "관리자만 작성가능합니다");		
			
			return "qnaTable/qnaPage01.tiles";
		}
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "qnaTable08.do") // 리플달기
	public String initqnaTable08(HttpServletRequest request, ModelMap model) throws Exception {
				
		int grpno = Integer.parseInt(request.getParameter("grpno"));
		int indent = Integer.parseInt(request.getParameter("indent"));
		int ansnum = Integer.parseInt(request.getParameter("ansnum"));
		
		EgovMap egovMap = new EgovMap();
		
		egovMap.put("grpno", grpno);
		egovMap.put("ansnum", ansnum);		
		
		int plusAnsnum = qnaTableService.updateQnaTableAnsnum(egovMap);
		System.out.println(plusAnsnum + " row update"); // 콘솔창으로 확인
		
		egovMap.put("grpno", grpno);
		egovMap.put("ansnum", ansnum + 1);
		egovMap.put("indent", indent + 1);
		egovMap.put("name", request.getParameter("name"));
		egovMap.put("title", request.getParameter("title"));
		egovMap.put("content", request.getParameter("content"));
		egovMap.put("passwd", request.getParameter("passwd"));
		
		int result = qnaTableService.insertQnaTableReply(egovMap);
		System.out.println(result + " row insert(reply)"); // 콘솔창으로 확인
		
		List<Map> qnaList = qnaTableService.selectQnaTableList();
		
		model.addAttribute("qnaList", qnaList);		
		model.addAttribute("message", "답글이 생성되었습니다");	
		
		return "qnaTable/qnaPage01.tiles";
		
	}
}
