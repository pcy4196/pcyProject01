package egovframework.example.profile.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfileController {
	
	@RequestMapping(value = "adProfile.do")
	public String initProfile() throws Exception {

		return "adProfile/adProfile.tiles";
	}
}
