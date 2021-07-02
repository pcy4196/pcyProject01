package egovframework.example.left.web;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.left.service.LeftService;

@Controller
public class LeftController {
	
	@Resource(name = "leftService")
	private LeftService leftService;
	
	@RequestMapping(value = "mainMenuList.do")
	public void mainMenuList(HttpServletResponse response) throws Exception {
		
		PrintWriter out = null;
		
		response.setCharacterEncoding("UTF-8");
		
		List<?> menuList = leftService.selectMainMenu();
		
		out = response.getWriter();
		
		out.write(JsonUtil.ListToJson(menuList));
	}
	
	@RequestMapping(value = "subMenuList.do")
	public void subMenuList(HttpServletResponse response, @RequestParam String menuId) throws Exception {
		
		PrintWriter out = null;
		
		response.setCharacterEncoding("UTF-8");
		
		List<?> menuSubList = leftService.selectSubMenu(menuId);
		
		out = response.getWriter();
		
		out.write(JsonUtil.ListToJson(menuSubList));
	}
}
