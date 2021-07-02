package egovframework.example.playerProfile.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.playerProfile.service.PlayerProfileService;

@Controller
public class PlayerProfileController {
	
	@Resource(name = "playerProfileService")
	private PlayerProfileService playerProfileService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "playerProfile.do")
	public String initPlayerProfile(ModelMap model) throws Exception {
		
		List<Map> playerProList = playerProfileService.selectPlayerProfileList();
		
		model.addAttribute("profile", playerProList);
		
		return "playerProfile/playerProfile.tiles";
	}
	
	@RequestMapping(value = "/playerVideo.do")
	public String playerVideo(HttpServletRequest request, ModelMap model) throws Exception {		
		
		String id = request.getParameter("id");
				
		String youTubeUrl = playerProfileService.selectYouTubeUrlOne(id);
		
		model.addAttribute("url", youTubeUrl);
		
		return "playerProfile/popPlayerVideo";
	}
}
