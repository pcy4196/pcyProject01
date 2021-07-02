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
</script>


<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/member/memberCreate/carousel.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>비밀번호를 입력하면 회원 삭제가 가능합니다</h2>
						<p>회원삭제</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card">
 <form id="memberFrm" class="form-horizontal" action="member_delete.do" method="post" onsubmit="return checkIdDuPl()" >
 	<input type="hidden" id="idCheckValue" name="idCheckValue" value="N" />
    <div class="content">
         <legend>회원삭제</legend>	
           
         <fieldset>
             <div class="form-group">
                 <label class="col-sm-2 control-label">PASSWORD</label>
                                	 
                <div class="col-sm-4">
                	<input class="form-control" type="password" name="passwd" required="required" />
                </div>
                <div class="col-sm-2">
                	
                </div>
                <div class="col-sm-4">
                	<code>비밀번호를 입력하면 회원 삭제가 가능합니다.</code>
                </div>
             </div>
         </fieldset>  
                  
     </div>
     <div class="footer text-center">
         <button type="submit" class="btn btn-danger btn-fill btn-lg">회원삭제</button>
         <button type="reset" class="btn btn-default btn-fill btn-lg">다시작성</button>
         <button type="button" class="btn btn-success btn-fill btn-lg" onclick="history.back();">취소</button>
     </div>
 </form>
</div>

