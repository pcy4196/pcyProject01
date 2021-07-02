package egovframework.example.playerProfile.service;

import java.util.List;
import java.util.Map;

public interface PlayerProfileService {

	@SuppressWarnings("rawtypes")
	List<Map> selectPlayerProfileList() throws Exception;

	String selectYouTubeUrlOne(String id) throws Exception;
	
}

