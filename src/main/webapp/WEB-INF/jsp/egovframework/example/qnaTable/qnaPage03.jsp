<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/qnaTable/qna/carousel.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>EDIT OF Q&A 게시판(답글)</h2>
						<p>- Q&A 게시판 -</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card">
 <form id="qnaFrm01" class="form-horizontal" action="qnaTable08.do" method="post" >
    <div class="content">
         <legend>Q & A 게시판 답글달기</legend>
	<c:forEach items="${qnaList}" var="qnaList" varStatus="status" begin="0" end="0">
	<input type="hidden" name="grpno" value="${qnaList.grpno}" />
	<input type="hidden" name="indent" value="${qnaList.indent}" />
	<input type="hidden" name="ansnum" value="${qnaList.ansnum}" />
	<input type="hidden" name="pageName" value="qnaTable02" />
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">NAME</label>
                 <div class="col-sm-8">
                     <input class="form-control" type="text" name="name" required="required" />
                 </div>
                 <div class="col-sm-2"><code>이름</code></div>
             </div>
         </fieldset>

         <fieldset>
             <div class="form-group">
                 <label class="col-sm-2 control-label">TITLE</label>
                 <div class="col-sm-8">
                     <input class="form-control" type="text" name="title" required="required" value="${qnaList.title}" />
                 </div>
                 <div class="col-sm-2"><code>제목</code></div>
             </div>
         </fieldset>

         <fieldset>
             <div class="form-group">
                 <label class="col-sm-2 control-label">CONTENT</label>
                 <div class="col-sm-8">
                 	 <%-- <textarea rows="5" cols="100%" name="content">${qnaList.content}</textarea> --%>
                     <input class="form-control" type="text" name="content" required="required" />
                 </div>
                 <div class="col-sm-2"><code>내용</code></div>
             </div>
         </fieldset>
         
         <fieldset>
             <div class="form-group">
                 <label class="col-sm-2 control-label">PASSWORD</label>
                 
               	 <%-- <textarea rows="5" cols="100%" name="content">${qnaList.content}</textarea> --%>
                <div class="col-sm-4">
                	<input class="form-control" id="passwd001" type="text" name="passwd" required="required" />
                </div>
                <div class="col-sm-4">
                	<input class="form-control" equalTo="#passwd001" type="text" name="passwd002" required="required" placeholder="비밀번호 확인"/>
                </div>
             
                 <div class="col-sm-2"><code>비밀번호</code></div>
             </div>
         </fieldset>
     </c:forEach>
     </div>
     <div class="footer text-center">
         <button type="submit" class="btn btn-info btn-fill btn-lg">답글</button>
         <button type="reset" class="btn btn-default btn-fill btn-lg">다시작성</button>
         <button type="button" class="btn btn-danger btn-fill btn-lg" onclick="history.back();">취소</button>
     </div>
 </form>
</div>

<script type="text/javascript">
$(document).ready(function() {	

  $('#qnaFrm01').validate();

});
</script>

