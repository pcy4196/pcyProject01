package egovframework.example.record.service;

import java.util.List;
import java.util.Map;

public interface RecordService {

	@SuppressWarnings("rawtypes")
	List<Map> selectRecordTeamList() throws Exception;

	
}

