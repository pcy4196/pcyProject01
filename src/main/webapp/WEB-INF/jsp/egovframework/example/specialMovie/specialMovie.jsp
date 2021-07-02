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

<script type="text/javascript">
function fnGoPaging(page) {
	
	location.href = "specialMovie.do?pageName=menu8&page="+page; // 페이지 관련 자바스크립트
}

var smv = 
{
	pageSubmitFn : function(no) {
		
		$("#tableNo").val(no);
		
		$("#frmSMV").attr("action", "specialMovie02.do");	
		
		$("#frmSMV").submit();
	}
}

var smvd = 
{
	pageSubmitFn : function(no) {
		
		swal({
			title: '비밀번호를 입력하세요',
			html: '<br /><input class="form-control" placeholder="관리자만 삭제 가능합니다" id="input-field">',
			showCancelButton: true,
			closeOnConfirm: false,
            allowOutsideClick: false
        }, function() {

            var passwd = $('#input-field').val();
           
            $("#tableNoD").val(no);
            
            $("#passwdD").val(passwd);
            
            $("#frmSMD").attr("method", "post");
            
            $("#frmSMD").attr("action", "specialMovie04.do");
            
            $("#frmSMD").submit(); 

        });
		
	}
}

$(document).ready(function() {
	
	$("#smvBtn").click(function() {		
		swal({title :  '비밀번호를 입력하세요',
			  html	:
	              '<form class="form-horizontal" id="frmSMC" name="frmSMC" action="specialMovie01.do" method="post"> ' +
	              '<input type="hidden" id="pageName"  name="pageName" value="menu8" />' +	              
	              '<div class="form-group">' +
	              '<label class="col-md-3 control-label">PASSWORD</label>' +
	              '<div class="col-md-9">' +
	              '<input type="password" placeholder="관리자만 작성가능합니다." class="form-control" size="60" name="passwd">' +
	              '</div>' +
	              '</div>' +
	              '<div class="form-group">' +
	              '<label class="col-md-3"></label>' +
	              '<div class="col-md-9">' +
	              '<button type="submit" class="btn btn-fill btn-info">확인</button>' +
	              '</div>' +
	              '</div>' +
	              '</form>',
	           showConfirmButton: false
	           
		});
	
	});
	
});
</script>

<form id="frmSMV" name="frmSMV">				
	<input type="hidden" id="pageName"  name="pageName" value="menu8" />
	<input type="hidden" id="tableNo"  name="tableNo" />
	<input type="hidden" id="pageSMV"  name="page" value="${param.page}"/>
</form>

<form id="frmSMD" name="frmSMD">				
	<input type="hidden" id="pageName"  name="pageName" value="menu8" />
	<input type="hidden" id="tableNoD"  name="tableNo" />
	<input type="hidden" id="passwdD"  name="passwd" />
	<input type="hidden" id="pageSMV"  name="page" value="${param.page}"/>
</form>

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
<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="content">
				<div class="header">
                   	
               	</div>
               	<div class="content table-responsive table-full-width">
                   	<table class="table table-hover table-striped table-bordered">
                       	<thead>
                           	<th width="10%" class="th001">NO</th>
                       		<th width="40%" class="th001">TITLE</th>
                       		<th width="30%" class="th001">DATE</th>                       		
                       		<th width="10%" class="th001">VIEW</th>
                       		<th width="10%" class="th001">DELETE</th>
                       	</thead>
                       	<tfoot>
                           	<td width="10%" class="th001">번호</td>
                       		<td width="40%" class="th001">제목</td>
                       		<td width="30%" class="th001">날짜</td>                       		
                       		<td width="10%" class="th001">조회수</td>
                       		<td width="10%" class="th001">삭제</td>
                       	</tfoot>
                       	<tbody>  
	                       	<c:forEach items="${smvTable}" var="smvTable" varStatus="status">                       	
	                       		<tr>
	                          		<td class="td001"><c:out value="${smvTable.tableno}"/></td>
	                          		<td class="td001">
	                          			<a href="#" onclick="javascript:smv.pageSubmitFn('${smvTable.tableno}')">
	                          			<c:out value="${smvTable.title}"/></a>
	                          		</td>
	                          		<td class="td001"><c:out value="${smvTable.tabledate}"/></td>
	                          		<td class="td001"><c:out value="${smvTable.tableview}"/></td>
	                          		<td class="td001"><button class="btn btn-danger btn-round btn-sm btn-fill"
									 onclick="javascript:smvd.pageSubmitFn('${smvTable.tableno}')">Delete</button></td>
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
					<button class="btn btn-round btn-lg btn-fill" id="smvBtn">등록</button>
				</div>
				<div class="clearfix"></div>				
			</div>
			<div class="footer"></div>	
		</div>	<!--  end card  -->
	</div> <!-- end col-md-12 -->
</div> <!-- end row -->

