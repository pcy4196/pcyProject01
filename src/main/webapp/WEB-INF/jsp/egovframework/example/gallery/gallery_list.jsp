<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">

$(document).ready(function() {		
	
});

var galleryList = 
{
	contentPage : function(no) {	
		
		$("#tableno").val(no);
		
		$("#frmGL").submit();
	}
}

function createGalleryContent() {
	var id = '${sessionScope.id}';
	
	if (id == '') {
		alert("회원만 등록이 가능합니다! \n로그인 해주세요!");
	} else {
		$("#frmGC").submit();
	}
}

function fnGoPaging(page) {
	
	location.href = "gallery.do?pageName=menu9&page="+page; // 페이지 페이지 관련 자바스크립트
}

</script>

<form id="frmGL" name="frmGL" action="galleryContent.do">
	<input type="hidden" name="pageName" value="menu9" />
	<input type="hidden" name="tableno" id="tableno" />
	<input type="hidden" name="page" value='<c:out value="${param.page}"/>' />
</form>

<form id="frmGC" name="frmGC" action="galleryCreate.do">
	<input type="hidden" name="pageName" value="menu9" />
	<input type="hidden" name="page" value='<c:out value="${param.page}"/>' />	
</form>

<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/playerProfile/mainPlayerProfile.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>NBA Player들의 사진 및 GIF <br />파일을 볼 수 있습니다</h2>
						<p>- Gallery -</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="content">
				<div class="header">
                   	<h3 class="title">Gallery 게시판</h3>
					<p class="category text-danger" style="font-size: 20px;">사진을 클릭하면 큰 화면으로 볼 수 있습니다</p>
               	</div>
               	<div class="content">
               	<c:forEach var="galleryList" items="${galleryList}">
                   	<div class="col-md-4">
                   		<a href="#" onclick="javascript:galleryList.contentPage('<c:out value="${galleryList.tableno}"/>')" class="thumbnail">
                   			<p><c:out value="${galleryList.title}"/></p>
                   			<img alt="<c:out value="${galleryList.title}"/>" 
                   			src="images/gallery/<c:out value="${galleryList.fname}"/>" style="width:200px; height: 150px;" />
                   		</a>                   		
                   	</div> 
                </c:forEach>                                    	
               	</div>
               	<br /><br />			
				<div class="clearfix"></div>
				<div class="text-center">
	               	<ul class="pagination">
	               		<c:if test="${resMap.pageGroup > 1}">
	               			<li>
	               				<a href="javascript:fnGoPaging('${resMap.prePage}')">«</a>
	               			</li>
	               		</c:if>
	               		<c:forEach var="i" begin="${resMap.startPage}" end="${resMap.endPage > resMap.totalPage ? resMap.totalPage : resMap.endPage }" varStatus="status">
	               			<c:choose>
	               			<c:when test="${resMap.page eq i}">
	               				<li class="active">
	               					<a href="javascript:fnGoPaging('${i}')">${i}</a>
	               				</li>
	               			</c:when>
	               			<c:otherwise>
	               				<li>
	               					<a href="javascript:fnGoPaging('${i}')">${i}</a>
	               				</li>
	               			</c:otherwise>
	               			</c:choose>
	               		</c:forEach>
	               		<c:if test="${resMap.nextPage < resMap.totalPage}">
	               			<li>
	               				<a href="javascript:fnGoPaging('${resMap.nextPage}')">»</a>
	               			</li>
	               		</c:if>
	               	</ul>
               	</div>	
				<div class="text-center">
					<button class="btn btn-round btn-lg btn-fill" onclick="createGalleryContent();">등록</button>
				</div>				
			</div>
			<div class="footer">				
			</div>	
		</div>	<!--  end card  -->
	</div> <!-- end col-md-12 -->
</div> <!-- end row -->