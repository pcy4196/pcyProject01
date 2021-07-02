package egovframework.example.record.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper("recordMapper")
public interface RecordMapper {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectRecordTeamList() throws Exception;
}
