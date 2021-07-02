package egovframework.example.record.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.record.service.RecordService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("recordService")
public class RecordServiceImpl extends EgovAbstractServiceImpl implements RecordService {

	@Resource(name = "recordMapper")
	private RecordMapper recordMapper;

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectRecordTeamList() throws Exception {

		return recordMapper.selectRecordTeamList();
	}
	
}