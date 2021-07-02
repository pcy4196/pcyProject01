package egovframework.example.member.web;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.member.service.MemberService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "member.do")
	public String initMember(HttpServletRequest request, HttpSession session) throws Exception {
		
		String previewPage = request.getHeader("referer");
		
		session.setAttribute("urlMember", previewPage);		
		
		return "member/memberCreate.tiles";
	}
	
	@RequestMapping(value = "memberCreate.do")
	public String memberCreate(HttpServletRequest request, ModelMap model) throws Exception {
		
		EgovMap egovMap = new EgovMap(); // 값 받아서 넣기
		egovMap.put("id", request.getParameter("id"));
		egovMap.put("name", request.getParameter("name"));
		egovMap.put("passwd", request.getParameter("passwd"));
		egovMap.put("phonenumber", request.getParameter("phonenumber"));
		egovMap.put("zipcode", request.getParameter("zipcode"));
		egovMap.put("address1", request.getParameter("address1"));
		egovMap.put("address2", request.getParameter("address2"));
		
		int result = memberService.insertMeberNew(egovMap);
		System.out.println(result + " row insert");
				
		model.addAttribute("msg", "회원가입을 했습니다! 로그인 해보세요!");
					
		return "forward:/memberLogin.do";
	}
	
	@RequestMapping(value = "memberLogin.do") // 로그인 화면 불러오기 
	public String memberLogin(HttpServletRequest request, HttpSession session) throws Exception {
		
		String previewPage = request.getHeader("referer");
		
		session.setAttribute("url", previewPage);		
		
		return "member/memberLogin.tiles";	
	}
	
	@RequestMapping(value = "memberLoginCheck.do") // 회원 아이디 비번 검사
	public String memberLoginCheck(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		
		String previewPage = (String) session.getAttribute("url");		
		int index = previewPage.lastIndexOf("/");
		String url = previewPage.substring(index);	// 포워드 할 주소 생성하기
		System.out.println(url);
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		String result = memberService.selectMeberCheck(id);
		if (passwd.equals(result)) {
			
			model.addAttribute("msg", id + "님 반갑습니다!!");
			
			session.setAttribute("id", id); // 아이디 세션 설정
			
			if (url.equals("/member.do")) {
				String previewMemberPage = (String) session.getAttribute("urlMember");
				session.removeAttribute("urlMember");
				int indexTwo = previewMemberPage.lastIndexOf("/");
				String urlMember = previewMemberPage.substring(indexTwo);	// 포워드 할 주소 생성하기
				
				return "redirect:" + urlMember;
			} 			
			
			return "redirect:" + url;
		} else {
			
			model.addAttribute("msg", "비밀번호가 틀렸거나 아이디가 없습니다");
			
			return "member/memberLogin.tiles";
		}		
	}
	
	@RequestMapping(value = "memberLogout.do") // 회원 로그 아웃
	public String memberLogout(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
				
		String previewPage = request.getHeader("referer");	
					
		int index = previewPage.lastIndexOf("/");
		String url = previewPage.substring(index);	// 포워드 할 주소 생성하기	
		System.out.println(url);
		
		if (url.equals("/memberLoginCheck.do") || url.equals("/member_myInfo.do")) {
			
			String previewTwoPage = (String) session.getAttribute("url");
			session.removeAttribute("url");
			int index01 = previewTwoPage.lastIndexOf("/");
			String secondUrl = previewTwoPage.substring(index01);	// 포워드 할 주소 생성하기
			
			session.removeAttribute("id"); // 로그아웃을 위한 아이디 세션 해제
			
			session.setAttribute("msgLog", "로그아웃을 했습니다");
						
			return "redirect:" + secondUrl;
		} else {
			
			session.removeAttribute("id"); // 로그아웃을 위한 아이디 세션 해제
			
			session.setAttribute("msgLog", "로그아웃을 했습니다");
						
			return "redirect:" + url;	
		}		
	}
	
	@RequestMapping(value = "/memberIdCheck.do") // ID 중복 체크 (AJAX 이용)
	public void mainMenuList(HttpServletResponse response, @RequestParam String id) throws Exception {

		PrintWriter out = null;
	
		response.setCharacterEncoding("UTF-8");
	
		int result = memberService.selectMemberIdCheck(id);
		System.out.println(result + " 결과값");
		
		String checkResult = "";
		if (result > 0) {
			checkResult = "NO";
		} else {
			checkResult = "YES";
		}		
	
		out = response.getWriter();
	
		out.write(checkResult);
		/*System.out.println(JsonUtil.ListToJson(menuList));*/
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/member_myInfo.do") // 회원 정보 확인
	public String member_myInfo(HttpSession session, ModelMap model) throws Exception {
		
		String id = (String) session.getAttribute("id");
		
		if (id != null) {
			
			List<Map> infoMember = memberService.selectMemberInfo(id);
			
			model.addAttribute("infoMember", infoMember);
			
			return "member/memberInfo.tiles";
		} else {
						
			session.setAttribute("msgLog", "회원만 볼 수 있습니다");
			
			return "redirect:/main.do?pageName=menu1";
		}		
	}
	
	@RequestMapping(value = "/member_Update.do") // 회원 정보 수정
	public String member_Update(HttpServletRequest request, HttpSession session) throws Exception {
		
		String id = (String) session.getAttribute("id");
		
		if (session.getAttribute("id") == null) {
			
			session.setAttribute("msgLog", "회원만 볼 수 있습니다");
			
			return "redirect:/main.do?pageName=menu1";
		}
		
		EgovMap egovMap = new EgovMap();
		egovMap.put("id", id);		
		egovMap.put("name", request.getParameter("name"));
		egovMap.put("passwd", request.getParameter("passwd"));
		egovMap.put("phonenumber", request.getParameter("phonenumber"));
		egovMap.put("zipcode", request.getParameter("zipcode"));
		egovMap.put("address1", request.getParameter("address1"));
		egovMap.put("address2", request.getParameter("address2"));
		
		int result = memberService.updateInfoMember(egovMap);
		
		if (result > 0) {
			
			System.out.println(result + " column update");
			
			session.setAttribute("msgLog", "회원정보를 수정 했습니다");
			
			return "redirect:/member_myInfo.do";
		} else {
			
			session.setAttribute("msgLog", "회원 정보 수정을 실패 했습니다");
			
			return "redirect:/member_myInfo.do";
		}		
	}
		
	@RequestMapping(value = "/member_deleteCheck.do") // 회원 정보 삭제 체크 화면
	public String member_deleteCheck(HttpSession session) throws Exception {
		
		String id = (String) session.getAttribute("id");
		
		if (id != null) {
						
			return "member/memberDelete.tiles";
		} else {
						
			session.setAttribute("msgLog", "회원만 볼 수 있습니다");
			
			return "redirect:/main.do?pageName=menu1";
		}		
	}
	
	@RequestMapping(value = "/member_delete.do") // 회원 정보 삭제
	public String member_delete(HttpServletRequest request, HttpSession session) throws Exception {
		
		String id = (String) session.getAttribute("id");
		String passwd = request.getParameter("passwd");
		
		String check = memberService.selectMeberCheck(id);
		
		if (passwd.equals(check)) {
			
			int result = memberService.deleteMemberOne(id);
			
			System.out.println(result + " member delete"); // 콘솔창에서 확인 가능
			
			session.setAttribute("msgLog", id + " 님을 삭제 했습니다");
			
			session.removeAttribute("id"); // 아이디 로그인 해제
			
			return "redirect:/main.do?pageName=menu1";
			
		} else {
			
			session.setAttribute("msgLog", "비밀번호가 틀렸습니다. 다시한번 시도해 보세요!");
			
			return "redirect:/member_deleteCheck.do";
		}		
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/memberList.do") // 회원 목록 확인(관리자)
	public String member_list(HttpSession session, ModelMap model) throws Exception {
		
		String id = (String) session.getAttribute("id");
		
		if (id != null && id.equals("admin")) { // 관리자만 들어갈 수 있게 표현하기
			
			List<Map> infoMemberList = memberService.selectMemberInfoList();
			
			model.addAttribute("infoMemberList", infoMemberList);
			
			System.out.println(infoMemberList);
			
			return "member/memberList.tiles";			
			
		} else {
			
			session.setAttribute("msgLog", "관리자만 볼 수 있습니다");
			
			return "redirect:main.do?pageName=menu1";	
		}				
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/member_update_admin.do") // 회원 정보 확인
	public String member_Update_admin(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		
		if (session.getAttribute("id") == null || !session.getAttribute("id").equals("admin") ) {
			
			session.setAttribute("msgLog", "관리자만 볼 수 있습니다");
			
			return "redirect:/main.do";
		}
		
		String memberId = request.getParameter("memberId");
		
		if (memberId != null) {
			
			Map infoMember = memberService.selectMemberInfoOne(memberId);
			
			model.addAttribute("infoMember", infoMember);
			
			return "member/memberInfo_admin.tiles";
		} else {
						
			session.setAttribute("msgLog", "회원만 볼 수 있습니다");
			
			return "redirect:/main.do?pageName=menu1";
		}		
	}
	
	
	
	@RequestMapping(value = "/member_update_admin_proc.do") // 회원 정보 수정(관리자)
	public String member_Update_admin_proc(HttpServletRequest request, HttpSession session) throws Exception {
		
		if (session.getAttribute("id") == null || !session.getAttribute("id").equals("admin")) {
			
			session.setAttribute("msgLog", "관리자만 볼 수 있습니다");
			
			return "redirect:/main.do?pageName=menu1";
		}
		
		EgovMap egovMap = new EgovMap();
		egovMap.put("id", request.getParameter("id"));		
		egovMap.put("name", request.getParameter("name"));
		egovMap.put("passwd", request.getParameter("passwd"));
		egovMap.put("phonenumber", request.getParameter("phonenumber"));
		egovMap.put("zipcode", request.getParameter("zipcode"));
		egovMap.put("address1", request.getParameter("address1"));
		egovMap.put("address2", request.getParameter("address2"));
		
		int result = memberService.updateInfoMember(egovMap);
		
		if (result > 0) {
			
			System.out.println(result + " column update");
			
			session.setAttribute("msgLog", "회원정보를 수정 했습니다");
			
			return "redirect:/memberList.do";
		} else {
			
			session.setAttribute("msgLog", "회원 정보 수정을 실패 했습니다");
			
			return "redirect:/memberList.do";
		}		
	}
	
	@RequestMapping(value = "/member_delete_admin.do") // 회원 정보 삭제(관리자)
	public String member_delete_admin(HttpServletRequest request, HttpSession session) throws Exception {
		
		if (session.getAttribute("id") == null || !session.getAttribute("id").equals("admin")) {
			
			session.setAttribute("msgLog", "관리자만 볼 수 있습니다");
			
			return "redirect:/main.do?pageName=menu1";
		}
		
		String id = request.getParameter("memberId");				
			
		int result = memberService.deleteMemberOne(id);
		
		System.out.println(result + " member delete"); // 콘솔창에서 확인 가능
		
		session.setAttribute("msgLog", id + " 님을 삭제 했습니다");
					
		return "redirect:/memberList.do";	
	}
}