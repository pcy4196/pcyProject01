package egovframework.example.record.web;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.record.service.RecordService;

@Controller
public class RecordController {
	
	@Resource(name = "recordService")
	private RecordService recordService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "record.do")
	public String initRecord(HttpServletRequest request, ModelMap model) throws Exception {
		
		try {
			List<Map> resultGSW = recordService.selectRecordTeamList();
			
			model.addAttribute("resultGSW", resultGSW);
			
		} catch (Exception e) {

		}		
		
		return "record/record.tiles";
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "record01.do")
	public String initRecord01(HttpServletRequest request, ModelMap model) throws Exception {
		
		try {
			
			Enumeration<String> attr = request.getParameterNames();
			
			while (attr.hasMoreElements()) {
				
				String attrName = attr.nextElement();				
				
				System.out.println(attrName);
				
				if (attrName.equals("pcy")) {
					
					String[] arr = request.getParameterValues("pcy");
					
					System.out.println(arr);
					
					model.addAttribute("arr", arr);
				}
				
				
			}
			
			List<Map> resultGSW = recordService.selectRecordTeamList();
			
			model.addAttribute("resultGSW", resultGSW);
			
		} catch (Exception e) {
			
			System.out.println(e.toString());
		}		
		
		return "record/record_checkBox.tiles";
	}
}
