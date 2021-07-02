package egovframework.example.member.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.member.service.MemberService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("memberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService {

	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;

	@Override
	public int insertMeberNew(EgovMap egovMap) throws Exception {

		return memberMapper.insertMeberNew(egovMap);
	}

	@Override
	public String selectMeberCheck(String id) throws Exception {

		return memberMapper.selectMeberCheck(id);
	}

	@Override
	public int selectMemberIdCheck(String id) throws Exception {

		return memberMapper.selectMemberIdCheck(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectMemberInfo(String id) throws Exception {

		return memberMapper.selectMemberInfo(id);
	}

	@Override
	public int updateInfoMember(EgovMap egovMap) throws Exception {

		return memberMapper.updateInfoMember(egovMap);
	}

	@Override
	public int deleteMemberOne(String id) throws Exception {
		
		return memberMapper.deleteMemberOne(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectMemberInfoList() throws Exception {

		return memberMapper.selectMemberInfoList();
	}

	@Override
	public Map selectMemberInfoOne(String memberId) throws Exception {

		return memberMapper.selectMemberInfoOne(memberId);
	}

}