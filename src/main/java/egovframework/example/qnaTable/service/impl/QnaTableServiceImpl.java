package egovframework.example.qnaTable.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.qnaTable.service.QnaTableService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("qnaTableService")
public class QnaTableServiceImpl extends EgovAbstractServiceImpl implements QnaTableService {
	
	@Resource(name = "qnaTableMapper")
	private QnaTableMapper qnaTableMapper;


	@SuppressWarnings("rawtypes") 	// 전체 글 조회하기
	@Override
	public List<Map> selectQnaTableList() throws Exception {

		return qnaTableMapper.selectQnaTableList();
	}


	@Override						// 글 입력하기
	public int insertQnaTableList(EgovMap egovMap) throws Exception {

		return qnaTableMapper.insertQnaTableList(egovMap);
	}


	@Override						// 비밀번호 확인하기
	public int selectCheckPw(EgovMap egovMap) throws Exception {

		return qnaTableMapper.selectCheckPw(egovMap);
	}


	@SuppressWarnings("rawtypes")
	@Override						// 하나만 불러오기
	public List<Map> selectQnaTableOne(EgovMap egovMap) throws Exception {
		
		return qnaTableMapper.selectQnaTableOne(egovMap);
	}

	@Override
	public int updateQnaTableList(EgovMap egovMap) throws Exception {

		return qnaTableMapper.updateQnaTableList(egovMap);
	}


	@Override
	public int delteQnaTableOne(EgovMap egovMap) throws Exception {

		return qnaTableMapper.delteQnaTableOne(egovMap);
	}


	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectQnaTableAllCol(EgovMap egovMap) throws Exception {

		return qnaTableMapper.selectQnaTableAllCol(egovMap);
	}


	@Override
	public int updateQnaTableAnsnum(EgovMap egovMap) throws Exception {

		return qnaTableMapper.updateQnaTableAnsnum(egovMap);
	}


	@Override
	public int insertQnaTableReply(EgovMap egovMap) throws Exception {

		return qnaTableMapper.insertQnaTableReply(egovMap);
	}

	
		
}