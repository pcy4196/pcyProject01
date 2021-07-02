package egovframework.example.playerProfile.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.playerProfile.service.PlayerProfileService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("playerProfileService")
public class PlayerProfileServiceImpl extends EgovAbstractServiceImpl implements PlayerProfileService {

	@Resource(name = "playerProfileMapper")
	private PlayerProfileMapper playerProfileMapper;

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPlayerProfileList() throws Exception {
		
		return playerProfileMapper.selectPlayerProfileList();
	}

	@Override
	public String selectYouTubeUrlOne(String id) throws Exception {

		return playerProfileMapper.selectYouTubeUrlOne(id);
	}	
	
}