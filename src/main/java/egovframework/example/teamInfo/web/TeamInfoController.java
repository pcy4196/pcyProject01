package egovframework.example.teamInfo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TeamInfoController {
	
	@RequestMapping(value = "teamInfo.do")
	public String initProfile() throws Exception {

		return "teamInfo/teamInfo.tiles";
	}
}
