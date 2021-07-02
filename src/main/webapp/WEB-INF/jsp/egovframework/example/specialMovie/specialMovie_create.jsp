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
<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/specialMovie/mainSpecialMovie.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>Golden State & NBA player들의 스페셜한 Play</h2>
						<p>- Special Movie 게시판 -</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card">
 <form id="frmSMV" name="frmSMV" class="form-horizontal" action="specialMovie03.do" method="post" >
    <div class="content">
         <legend>Special Movie 게시판 작성하기 </legend>	
	<input type="hidden" name="pageName" value="menu8" />
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">TITLE</label>
                 <div class="col-sm-8">
                     <input class="form-control" type="text" name="title" required="required" placeholder="제목란"/>
                 </div>
                 <div class="col-sm-2"><code>제목</code></div>
             </div>
         </fieldset>

         <fieldset>
             <div class="form-group">
                 <label class="col-sm-2 control-label">CONTENT</label>
                 <div class="col-sm-8">
                     <textarea rows="5" name="content" style="width: 100%;" placeholder="내용란"></textarea>
                 </div>
                 <div class="col-sm-2"><code>내용</code></div>
             </div>
         </fieldset>

         <fieldset>
             <div class="form-group">
                 <label class="col-sm-2 control-label">MOVIE</label>
                 <div class="col-sm-8">                 	 
                     <input class="form-control" type="text" name="movie" required="required" placeholder="https://"/>
                 </div>
                 <div class="col-sm-2"><code>URL(YOUTUBE 동영상)</code></div>
             </div>
         </fieldset>         
           
     </div>
     <div class="footer text-center">
         <button type="submit" class="btn btn-info btn-fill btn-lg">등록</button>
         <button type="reset" class="btn btn-default btn-fill btn-lg">다시작성</button>
         <button type="button" class="btn btn-danger btn-fill btn-lg" onclick="history.back();">취소</button>
     </div>
 </form>
</div>

<script type="text/javascript">
$(document).ready(function() {	

  $('#frmSMV').validate();

});
</script>