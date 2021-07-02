package egovframework.example.gallery.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.gallery.service.GalleryService;
import egovframework.example.gallery.service.PagingGalleryVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("galleryService")
public class GalleryServiceImpl extends EgovAbstractServiceImpl implements GalleryService {

	@Resource(name = "galleryMapper")
	private GalleryMapper galleryMapper;

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectGalleryList() throws Exception {

		return galleryMapper.selectGalleryList();
	}

	@Override
	public Map<String, Object> selectGalleryContent(String tableNo)
			throws Exception {

		return galleryMapper.selectGalleryContent(tableNo);
	}

	@Override
	public int insertGalleryOne(EgovMap egovMap) throws Exception {

		return galleryMapper.insertGalleryOne(egovMap);
	}

	@Override
	public int updateGalleryContent(String tableNo) throws Exception {
		
		return galleryMapper.updateGalleryContent(tableNo);
	}

	@Override
	public int updateGalleryOne(EgovMap egovMap) throws Exception {

		return galleryMapper.updateGalleryOne(egovMap);
	}

	@Override
	public int deleteGalleryOne(EgovMap egovMap) throws Exception {

		return galleryMapper.deleteGalleryOne(egovMap);
	}

	@Override
	public EgovMap selectGalleryPagingListCnt(PagingGalleryVO pagingGalleryVO)
			throws Exception {

		return galleryMapper.selectGalleryPagingListCnt(pagingGalleryVO);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectGalleryPagingList(PagingGalleryVO pagingGalleryVO)
			throws Exception {

		return galleryMapper.selectGalleryPagingList(pagingGalleryVO);
	}	
}