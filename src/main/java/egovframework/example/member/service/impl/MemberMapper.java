package egovframework.example.member.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("memberMapper")
public interface MemberMapper {
	
	int insertMeberNew(EgovMap egovMap) throws Exception;
	
	String selectMeberCheck(String id) throws Exception;
	
	int selectMemberIdCheck(String id) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectMemberInfo(String id) throws Exception;
	
	int updateInfoMember(EgovMap egovMap) throws Exception;
	
	int deleteMemberOne(String id) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectMemberInfoList() throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map selectMemberInfoOne(String memberId) throws Exception;
}
