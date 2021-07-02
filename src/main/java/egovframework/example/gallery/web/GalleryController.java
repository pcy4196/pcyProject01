package egovframework.example.gallery.web;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.gallery.service.GalleryService;
import egovframework.example.gallery.service.PagingGalleryVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class GalleryController {
	
	@Resource(name = "galleryService")
	private GalleryService galleryService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "gallery.do")
	public String gallery(PagingGalleryVO pagingGalleryVO, ModelMap model) throws Exception {
		
		EgovMap pageListCnt = galleryService.selectGalleryPagingListCnt(pagingGalleryVO);
		System.out.println("totalPage : " + pageListCnt.get("totalPage"));
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("totalPage", pageListCnt.get("totalPage")); 	// 토탈 페이지
		resMap.put("page", pagingGalleryVO.getPage());			// 현재 페이지
		
		int pageGroup = (int) Math.ceil((double)pagingGalleryVO.getPage() / pagingGalleryVO.getPageScale()); // 페이지 그룹
		System.out.println(pageGroup);		
		resMap.put("pageGroup", pageGroup);
		
		long startPage = (pageGroup - 1) * pagingGalleryVO.getPageScale() + 1; // 페이징 스타트 페이지
		pagingGalleryVO.setStartPage(startPage);
		resMap.put("startPage", pagingGalleryVO.getStartPage());
		
		long endPage = startPage + pagingGalleryVO.getPageScale() - 1; // 페이징 마지막 페이지
		pagingGalleryVO.setEndPage(endPage);
		resMap.put("endPage", pagingGalleryVO.getEndPage());
		
		long prePage = (pageGroup - 2) * pagingGalleryVO.getPageScale() + 1; // <<
		resMap.put("prePage", prePage);
		
		long nextPage = pageGroup * pagingGalleryVO.getPageScale() + 1; // >>
		resMap.put("nextPage", nextPage);
		
		List<Map> galleryList = galleryService.selectGalleryPagingList(pagingGalleryVO);
		
		System.out.println(galleryList);
		
		model.addAttribute("galleryList", galleryList);
		model.addAttribute("resMap", resMap);
		
		return "gallery/gallery_list.tiles";
	}
	
	/*@SuppressWarnings("rawtypes")
	@RequestMapping(value = "gallery.do")
	public String gallery(ModelMap model) throws Exception {
		
		List<Map> galleryList = galleryService.selectGalleryList();
		
		System.out.println(galleryList);
		
		model.addAttribute("galleryList", galleryList);
		
		return "gallery/gallery_list.tiles";
	}*/
	
	@RequestMapping(value = "galleryContent.do")
	public String galleryContent(HttpServletRequest request, ModelMap model) throws Exception {
		
		String tableno = request.getParameter("tableno");
		
		System.out.println(tableno + " 테이블 번호(보려고하는)");
		
		int result = galleryService.updateGalleryContent(tableno); // viewCnt 업데이트
		
		System.out.println(result + " row update");
		
		Map<String, Object> galleryContent = galleryService.selectGalleryContent(tableno);
		
		System.out.println(galleryContent);
		
		model.addAttribute("galleryContent", galleryContent);
		
		return "gallery/gallery_content.tiles";
	}
	
	@RequestMapping(value = "galleryCreate.do") // 게시판 등록 폼 보여주는 컨트롤러
	public String galleryCreate(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		
		String id = (String) session.getAttribute("id");
		
		if (id != null) {
			
			return "gallery/gallery_create.tiles";
		} else {
						
			session.setAttribute("msgLog", "회원만 볼 수 있습니다");
			
			return "redirect:/gallery.do?pageName=menu9&page=1";
		}		
	}
	
	@RequestMapping(value = "galleryCreateProc.do") // 게시판 등록 처리 Controller
	public String galleryCreateProc(HttpServletRequest request, HttpSession session) throws Exception {
		
		String id = (String) session.getAttribute("id");
		EgovMap egovMap = new EgovMap();
		
		if (id != null) {	
			
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
			
			String wname = multipartHttpServletRequest.getParameter("wname");			
			egovMap.put("wname", wname); // 값 담기			
			
			String title = multipartHttpServletRequest.getParameter("title");
			egovMap.put("title", title); // 값 담기	
			
			String content = multipartHttpServletRequest.getParameter("content");
			egovMap.put("content", content); // 값 담기	
			
			// 저장 경로 설정
	        String root = session.getServletContext().getRealPath("/");	        
	        String path = root + "images/gallery/";
	         
	        String newFileName = ""; // 업로드 되는 파일명
	        
	        File dir = new File(path);
	        if(!dir.isDirectory()){
	            dir.mkdir();
	        }
	         
	        Iterator<String> files = multipartHttpServletRequest.getFileNames();
	        while(files.hasNext()){
	            String uploadFile = files.next();	            
	                         
	            MultipartFile mFile = multipartHttpServletRequest.getFile(uploadFile);
	            String fileName = mFile.getOriginalFilename();
	            System.out.println("실제 파일 이름 : " + fileName);
	            // 똑같은 파일이름이 있는경우
	            File uploadedFile = new File(path + fileName);
	            if (uploadedFile.exists() == true) {
					
	            	for (int i = 0; true; i++) {
	            		uploadedFile = new File(path + "(" + i + ")" + fileName);
	            		
						if (uploadedFile.exists() != true) {
							newFileName = "(" + i + ")" + fileName;
							break;
						}
					}
	            	
				} else {
					
					newFileName = fileName;
				}
	            
	            System.out.println("업로드 파일 이름 : " + newFileName);
	            try {
	            	
	                mFile.transferTo(new File(path + newFileName));
	            } catch (Exception e) {
	            	
	                System.out.println(e.toString());
	            }	           
	        }
	        
	        egovMap.put("fname", newFileName);
	        
	        int result = galleryService.insertGalleryOne(egovMap);
	        
	        System.out.println(result + " row insert");
	        
	        session.setAttribute("msgLog", "업로드 했습니다.");
					
			return "forward:/gallery.do";
		} else {
						
			session.setAttribute("msgLog", "회원만 볼 수 있습니다");
			
			return "redirect:/gallery.do?pageName=menu9&page=1";
		}		
	}
	
	@RequestMapping(value = "galleryEdit.do") // 게시판 수정하는 페이지로 이동
	public String galleryEdit(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		
		String id = (String) session.getAttribute("id");
		
		if (id != null) {
			
			String tableno = request.getParameter("tableno");
			
			System.out.println(tableno + " 테이블 번호(수정하려고 하는)");
					
			Map<String, Object> galleryContent = galleryService.selectGalleryContent(tableno);
			
			System.out.println(galleryContent);
			
			model.addAttribute("galleryContent", galleryContent);
			
			return "gallery/gallery_edit.tiles";
		} else {
						
			session.setAttribute("msgLog", "회원만 볼 수 있습니다");
			
			return "redirect:/gallery.do?pageName=menu9&page=1";
		}		
	}
	
	@RequestMapping(value = "galleryEditProc.do") // 글 수정하기
	public String galleryEditProc(HttpServletRequest request, HttpSession session) throws Exception {
		
		String id = (String) session.getAttribute("id");
		EgovMap egovMap = new EgovMap();
		
		if (id != null) {	
			
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
			
			String tableno = multipartHttpServletRequest.getParameter("tableno");	// 수정할 테이블 번호
			egovMap.put("tableno", tableno); // 값 담기
						
			String title = multipartHttpServletRequest.getParameter("title");		// 수정할 테이블 제목
			egovMap.put("title", title); // 값 담기	
			
			String content = multipartHttpServletRequest.getParameter("content");	// 수정할 테이블 내용
			egovMap.put("content", content); // 값 담기	
			
			// 저장 경로 설정
	        String root = session.getServletContext().getRealPath("/");
	        String path = root + "images/gallery/";
	        
	        File dir = new File(path);
	        if(!dir.isDirectory()){
	            dir.mkdir();
	        }
	        
	        String oldfile = multipartHttpServletRequest.getParameter("oldfile"); 	// 예전파일 이름 값 받아와서 삭제 하기
			File deleteFile = new File(path + oldfile);
			if (deleteFile.exists()) {
				
				deleteFile.delete(); // 예전 파일 삭제하기
			}			
	         
	        String newFileName = ""; // 업로드 되는 파일명
	       	         
	        Iterator<String> files = multipartHttpServletRequest.getFileNames();
	        while(files.hasNext()){
	            String uploadFile = files.next();	            
	                         
	            MultipartFile mFile = multipartHttpServletRequest.getFile(uploadFile);
	            String fileName = mFile.getOriginalFilename();
	            System.out.println("실제 파일 이름 : " + fileName);
	            // 똑같은 파일이름이 있는경우
	            File uploadedFile = new File(path + fileName);
	            if (uploadedFile.exists() == true) {
					
	            	for (int i = 0; true; i++) {
	            		uploadedFile = new File(path + "(" + i + ")" + fileName);
	            		
						if (!(uploadedFile.exists() == true)) {
							newFileName = "(" + i + ")" + fileName;
							break;
						}
					}	
	            	
				} else {
					
					newFileName = fileName;
				}
	            
	            System.out.println("업로드 파일 이름 : " + newFileName);
	            try {
	            	
	                mFile.transferTo(new File(path + newFileName));
	            } catch (Exception e) {
	            	
	                System.out.println(e.toString());
	            } 	           
	        }
	        
	        egovMap.put("fname", newFileName);
	        
	        int result = galleryService.updateGalleryOne(egovMap);
	        
	        System.out.println(result + " row update");
	        
	        session.setAttribute("msgLog", "업로드 했습니다.");
					
			return "forward:/gallery.do";
		} else {
						
			session.setAttribute("msgLog", "회원만 볼 수 있습니다");
			
			return "redirect:/gallery.do?pageName=menu9&page=1";
		}		
	}
	
	@RequestMapping(value = "galleryDelete.do")	// 글 삭제하기
	public String gallerydelete(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		
		String id = (String) session.getAttribute("id");
		EgovMap egovMap = new EgovMap();
		
		if (id != null) {	
						
			String tableno = request.getParameter("tableno");	// 삭제할 테이블 번호
			egovMap.put("tableno", tableno); // 값 담기
						
			// 저장 경로 설정
	        String root = session.getServletContext().getRealPath("/");
	        String path = root + "images/gallery/";
	      	        
	        String fname = request.getParameter("fname"); 	// 예전파일 이름 값 받아와서 삭제 하기
	        System.out.println("삭제할 파일 이름 : " + fname);
			File deleteFile = new File(path + fname);
			if (deleteFile.exists()) {
				
				deleteFile.delete(); // 예전 파일 삭제하기
			}       
			
	        int result = galleryService.deleteGalleryOne(egovMap);
	        
	        System.out.println(result + " row delete");
	        
	        session.setAttribute("msgLog", "삭제 했습니다.");
					
			return "forward:/gallery.do";
		} else {
						
			session.setAttribute("msgLog", "회원만 볼 수 있습니다");
			
			return "redirect:/gallery.do?pageName=menu9&page=1";
		}		
	}
}
