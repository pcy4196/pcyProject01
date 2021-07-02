package egovframework.example.qnaTable.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("qnaTableMapper")
public interface QnaTableMapper {

	@SuppressWarnings("rawtypes")
	List<Map> selectQnaTableList() throws Exception;
	
	int insertQnaTableList(EgovMap egovMap) throws Exception;
	
	int selectCheckPw(EgovMap egovMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectQnaTableOne(EgovMap egovMap) throws Exception;
	
	int updateQnaTableList(EgovMap egovMap) throws Exception;
	
	int delteQnaTableOne(EgovMap egovMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectQnaTableAllCol(EgovMap egovMap) throws Exception;
	
	int updateQnaTableAnsnum(EgovMap egovMap) throws Exception;
	
	int insertQnaTableReply(EgovMap egovMap) throws Exception;
		
}
