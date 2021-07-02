package egovframework.example.playerProfile.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("playerProfileMapper")
public interface PlayerProfileMapper {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectPlayerProfileList() throws Exception;
	
	String selectYouTubeUrlOne(String id) throws Exception;
}
