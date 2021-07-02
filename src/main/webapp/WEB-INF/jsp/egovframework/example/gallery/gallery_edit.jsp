<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
$(document).ready(function() {	

	$('#memberFrm').validate();

});

function checkFile() {
	var $fname = $("#fname").val();
	var index = $fname.lastIndexOf(".");
	var extension = $fname.substring(index + 1);	
	
	if ($fname.indexOf(".jpg") != -1 || $fname.indexOf(".png") != -1 || $fname.indexOf(".gif") != -1) {
		
		return true;
	} else {
		
		alert(extension + " 은(는) img, gif 파일이 아닙니다");
		return false;
	}
}
</script>
<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/playerProfile/mainPlayerProfile.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>NBA Player들의 사진 및 GIF <br />파일을 수정하는 Page 입니다</h2>
						<p>- Gallery Edit -</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="card">
 <form id="galleryCreate" class="form-horizontal" action="galleryEditProc.do" method="post" enctype="multipart/form-data" onsubmit="return checkFile();" >
 	<input type="hidden" name="pageName" value="menu9" />
 	<input type="hidden" name="tableno" value="${param.tableno}" />
 	<input type="hidden" name="page" value='<c:out value="${param.page}"/>' />
 	<div class="content">
         <legend>Gallery 게시판 등록</legend>	
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">WNAME</label>
                 <div class="col-sm-4">
                     <input class="form-control" type="text" id="wname" name="wname" required="required" readonly="readonly" value="${galleryContent.wname}"/>
                 </div>
                 <div class="col-sm-4">                 		
                 	
                 </div>
                 <div class="col-sm-2"><code>작성자</code></div>
             </div>
         </fieldset>
         
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">TITLE</label>
                 <div class="col-sm-4">
                     <input class="form-control" type="text" id="title" name="title" required="required" value="${galleryContent.title}"/>
                 </div>
                 <div class="col-sm-4">
                     
                 </div>
                 <div class="col-sm-2"><code>제목</code></div>
             </div>
         </fieldset>        
                  
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">CONTENT</label>
                 <div class="col-sm-8">
                     <input class="form-control" type="text" id="content" name="content" required="required" value="${galleryContent.content}" />
                 </div>                 
                 <div class="col-sm-2"><code>내용</code></div>
             </div>
         </fieldset>  
         
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">FILE</label>
                 <div class="col-sm-4">
                     <input class="form-control" type="file" id="fname" name="fname" required="required" />
                 </div>
                 <div class="col-sm-4">
                     <input class="form-control" type="text" id="oldfile" name="oldfile" readonly="readonly" value="${galleryContent.fname}"  />
                 </div>                
                 <div class="col-sm-2"><code>IMG or GIF 파일</code></div>
             </div>
         </fieldset>         
        
     </div>
     <div class="footer text-center">
         <button type="submit" class="btn btn-info btn-fill btn-lg">수정</button>
         <button type="reset" class="btn btn-default btn-fill btn-lg">다시작성</button>
         <button type="button" class="btn btn-danger btn-fill btn-lg" onclick="history.back();">취소</button>
     </div>
 </form>
</div>

