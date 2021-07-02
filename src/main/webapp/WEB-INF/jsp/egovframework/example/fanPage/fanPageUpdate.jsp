<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.th001 {
	text-align: center
}
.td001 {
	text-align: center
}
</style>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>

<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/specialMovie/mainSpecialMovie.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>Golden State Fan Page 공간</h2>
						<p>- Fan Page 게시판 -</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card">
 <form id="frmFAP" name="frmFAP" class="form-horizontal" action="fanPageUpdate.do" method="post" onsubmit="return check();">
 	<input type="hidden" name="page" value="${param.page}">
 	<input type="hidden" name="no" value='<c:out value="${fanPageContent.no}"/>'>
 	<input type="hidden" name="pageName" value="menu10" />
    <div class="content">
         <legend>Fan Page 게시판 작성하기 </legend>		
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">TITLE</label>
                 <div class="col-sm-8">
                     <input class="form-control" type="text" name="title" required="required" value="<c:out value="${fanPageContent.title}"/>" />
                 </div>   
                 <div class="col-sm-2"><code>제목</code></div>             
             </div>
         </fieldset>

         <fieldset>
			<div class="form-group">
				<label class="col-sm-2 control-label">CONTENT</label>
				<div class="col-sm-10 text-center">
					<textarea rows="10" id="content" name="content" style="width: 100%;" placeholder="내용란"><c:out value="${fanPageContent.content}"/></textarea>
				</div>                
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

<script type="text/javascript">
$(document).ready(function() {	
	
	if ('<c:out value="${sessionScope.id}"/>' == 'admin') {
		
		CKEDITOR.replace('content', {
			filebrowserBrowseUrl : 'ckfinder/ckfinder.html',
			filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?type=Images',
			filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?type=Flash'
		});
	} else {
		
		CKEDITOR.replace('content');
	}
	
	CKEDITOR.on('dialogDefinition', function (ev) {
		var dialogName = ev.data.name;
		var dialog = ev.data.definition.dialog;
		var dialogDefinition = ev.data.definition;

			if (dialogName == 'image') {
				dialog.on('show', function (obj) {
				this.selectPage('Upload'); //업로드텝으로 시작
			});

			dialogDefinition.removeContents('advanced'); // 자세히탭 제거
			dialogDefinition.removeContents('Link'); // 링크탭 제거
		}
	});
	
  	$('#frmFAP').validate();  	
});

function check() {
	
	if (CKEDITOR.instances['content'].getData() == '') {
		
		alert('내용을 입력해 주세요.');
		CKEDITOR.instances['content'].focus();
		return false;
	}
}
</script>