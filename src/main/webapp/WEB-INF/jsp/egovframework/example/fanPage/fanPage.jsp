<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
.th001 {
	text-align: center
}
.td001 {
	text-align: center
}
</style>

<script type="text/javascript">
function fnGoPaging(page) {
	
	location.href = "fanPage.do?pageName=menu10&page=" + page; // 페이지 관련 자바스크립트
}

var fap = {
		
	createPage : function() {
		
		if ('${sessionScope.id}' != '' && '${sessionScope.id}' != null) {
			
			location.href = "fanPageCreate.do?page=${param.page}&pageName=${param.pageName}";
		} else {
			
			alert("로그인을 해주세요");
			
			location.href = "memberLogin.do";
		}
	},
	
	pageSubmitFn : function(no) {
		
		location.href = "fanPageContent.do?page=${param.page}&pageName=${param.pageName}&no=" + no + "&rpage=1";
	}
}

$(document).ready(function() {	
	
});
</script>

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
<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="content">
				<div class="header">
                   	
               	</div>
               	<div class="content table-responsive table-full-width">
                   	<table class="table table-hover table-striped">
                       	<thead>
                           	<th width="10%" class="th001">NO</th>
                           	<th width="20%" class="th001">WNAME</th>
                       		<th width="30%" class="th001">TITLE</th>
                       		<th width="30%" class="th001">DATE</th>                       		
                       		<th width="10%" class="th001">VIEW</th>                       		
                       	</thead>
                       	<tfoot>
                           	<td width="10%" class="th001">번호</td>
                           	<td width="20%" class="th001">작성자</td>
                       		<td width="30%" class="th001">제목</td>
                       		<td width="30%" class="th001">날짜</td>                       		
                       		<td width="10%" class="th001">조회수</td>                       		
                       	</tfoot>
                       	<tbody>  
	                       	<c:forEach items="${fanPageList}" var="fanPageList" varStatus="status">                      	
	                       		<tr>
	                          		<td class="td001"><c:out value="${fanPageList.no}"/></td>
	                          		<td class="td001"><c:out value="${fanPageList.wname}"/></td>
	                          		<td class="td001">
	                          			<a href="#" onclick="javascript:fap.pageSubmitFn('<c:out value="${fanPageList.no}"/>')">
	                          				<c:out value="${fanPageList.title}"/>
	                          			</a>
	                          			&nbsp; 
	                          			<c:if test="${fanPageList.recnt > 0}">
	                          				<span style="color: red;">( ${fanPageList.recnt} )</span>
	                          			</c:if>
	                          		</td>
	                          		<td class="td001"><c:out value="${fanPageList.wdate}"/></td>
	                          		<td class="td001"><c:out value="${fanPageList.viewcnt}"/></td>	                          		
	                          	</tr> 
	                        </c:forEach>                 	
                       	</tbody>
                   	</table>
               	</div>
               	<br />
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
					<button class="btn btn-round btn-lg btn-fill" onclick="fap.createPage()">등록</button>
				</div>
				<div class="clearfix"></div>				
			</div>
			<div class="footer"></div>	
		</div>	<!--  end card  -->
	</div> <!-- end col-md-12 -->
</div> <!-- end row -->

