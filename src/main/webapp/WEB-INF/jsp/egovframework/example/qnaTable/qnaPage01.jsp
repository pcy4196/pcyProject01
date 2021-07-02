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
						<h2>NBA, GOLDEN STATE WARRIORS에 관한 질문 PAGE</h2>
						<p>- Q&A 게시판 -</p>
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
				<table id="bootstrap-table" class="table">
					<thead>
						<th data-sortable="true" class="text-center">IDX</th>
						<th class="text-center">Name</th>
						<th data-sortable="true" class="text-center">Title</th>
						<th class="text-center">Edit</th>
						<th class="text-center">Reply</th>
						<th class="text-center">Delete</th>
					</thead>
					<tbody>
						<c:forEach items="${qnaList}" var="qnaList" varStatus="status">
							<tr>
						<c:choose>
							<c:when test="${qnaList.indent > 0}">							
								<td><c:out value="${qnaList.idx}"/></td>
								<td><i class="fa fa-hand-o-right"></i> <c:out value="${qnaList.name}"/></td>
								<td><a href = "#" onclick="javascript:initSwal.showContent('<c:out value="${qnaList.idx}"/>')">
								<c:out value="${qnaList.title}"/> <i class="fa fa-comment"></i></a></td>
							</c:when>
							<c:otherwise>
								<td><c:out value="${qnaList.idx}"/></td>
								<td><c:out value="${qnaList.name}"/></td>
								<td><a href = "#" onclick="javascript:initSwal.showContent('<c:out value="${qnaList.idx}"/>')">
								<c:out value="${qnaList.title}"/></a></td>
							</c:otherwise>
						</c:choose>
								<td><button class="btn btn-success btn-round btn-sm btn-fill" 
								onclick="javascript:initSwal.showContent('edit00<c:out value="${qnaList.idx}"/>')">Edit</button></td>
								<td><button class="btn btn-primary btn-round btn-sm btn-fill"
								onclick="javascript:initSwal.showContent('reply00<c:out value="${qnaList.idx}"/>')">Reply</button></td>
								<td><button class="btn btn-danger btn-round btn-sm btn-fill"
								onclick="javascript:initSwal.showContent('delete00<c:out value="${qnaList.idx}"/>')">Delete</button></td>
							</tr>
						</c:forEach>    					
					</tbody>
				</table>
				
				<div class="text-center"><button class="btn btn-round btn-lg btn-fill " id="button001">등록</button></div>
				<div class="clearfix"></div>
			</div>
			<div class="footer"></div>	
		</div>	<!--  end card  -->
	</div> <!-- end col-md-12 -->
</div> <!-- end row -->

<script type="text/javascript">
function inputCheck(f){
	if (f.name.value=="" || f.title.value=="" || f.content.value=="" || f.passwd.value==""){
		alert("값을 전부다 입력해야 합니다");
		return false;
	}	
}

var initSwal = 
{
	showContent : function(type) {
		
		<c:forEach items="${qnaList}" var="qnaList" varStatus="status">
			if (type == '${qnaList.idx}') {
				swal({title :  'CONTENT',
						html : '<h4><c:out value="${qnaList.title}"/></h4><br />' +
								 '<h4><c:out value="${qnaList.content}"/></h4>'
				});
			}
		</c:forEach>   
		
		<c:forEach items="${qnaList}" var="qnaList" varStatus="status">
			if (type == 'edit00${qnaList.idx}') {
				swal({title :  '비밀번호를 입력하세요',
					  html	:
			              '<form class="form-horizontal" id="qnaFrm" action="qnaTable04.do" method="post"> ' +
			              '<input type="hidden" name="idx" value="${qnaList.idx}" />' +
			              '<input type="hidden" name="pageName" value="menu7" /> ' +
			              '<div class="form-group">' +
			              '<label class="col-md-3 control-label">PASSWORD</label>' +
			              '<div class="col-md-9">' +
			              '<input type="password" placeholder="비밀번호" class="form-control" size="60" name="passwd">' +
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
			}
		</c:forEach>
		
		<c:forEach items="${qnaList}" var="qnaList" varStatus="status">
		if (type == 'delete00${qnaList.idx}') {
			swal({title :  '비밀번호를 입력하세요',
				  html	:
		              '<form class="form-horizontal" id="qnaFrm" action="qnaTable06.do" method="post"> ' +
		              '<input type="hidden" name="idx" value="${qnaList.idx}" />' +
		              '<input type="hidden" name="pageName" value="menu7" /> ' +
		              '<div class="form-group">' +
		              '<label class="col-md-3 control-label">PASSWORD</label>' +
		              '<div class="col-md-9">' +
		              '<input type="password" placeholder="비밀번호" class="form-control" size="60" name="passwd">' +
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
		}
		</c:forEach>
		
		<c:forEach items="${qnaList}" var="qnaList" varStatus="status">
		if (type == 'reply00${qnaList.idx}') {
			swal({title :  '비밀번호를 입력하세요',
				  html	:
		              '<form class="form-horizontal" id="qnaFrm" action="qnaTable07.do" method="post"> ' +
		              '<input type="hidden" name="idx" value="${qnaList.idx}" />' +
		              '<input type="hidden" name="pageName" value="menu7" /> ' +
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
		}
		</c:forEach>
	}
}


var $table = $('#bootstrap-table');

$(document).ready(function() {	
		 
	
	$("#button001").click(function() {
		swal({ title	: 'Q & A 게시판 글 등록하기',
          		html	:
			              '<form class="form-horizontal" id="qnaFrm" action="qnaTable03.do" ' +
			              'method="post" onsubmit="return inputCheck(this)"> ' +
			              '<input type="hidden" name="pageName" value="menu7" /> ' +
			              '<div class="form-group">' +
			              '<label class="col-md-3 control-label">NAME</label>' +
			              '<div class="col-md-9">' +
			              '<input type="text" placeholder="이름" class="form-control" size="60" name="name">' +
			              '</div>' +
			              '</div>' +
			              '<div class="form-group">' +
			              '<label class="col-md-3 control-label">TITLE</label>' +
			              '<div class="col-md-9">' +
			              '<input type="text" placeholder="제목" class="form-control" size="60" name="title">' +
			              '</div>' +
			              '</div>' +
			              '<div class="form-group">' +
			              '<label class="col-md-3 control-label">CONTENT</label>' +
			              '<div class="col-md-9">' +
			              '<textarea rows="10" cols="39" name="content" placeholder="내용"></textarea>'+			             
			              '</div>' +
			              '</div>' +	
			              '<div class="form-group">' +
			              '<label class="col-md-3 control-label">PASSWORD</label>' +
			              '<div class="col-md-9">' +
			              '<input type="password" placeholder="비밀번호" class="form-control" size="60" name="passwd">' +
			              '</div>' +
			              '</div>' +
			              '<div class="form-group">' +
			              '<label class="col-md-3"></label>' +
			              '<div class="col-md-9">' +
			              '<button type="submit" class="btn btn-fill btn-info">등록</button>' +
			              '<button type="button" class="btn btn-fill btn-danger" onclick="history.back()">취소</button>' +
			              '</div>' +
			              '</div>' +
			              '</form>',
			        showConfirmButton: false,
			        allowOutsideClick: false
		 });			
	});
	
	$table.bootstrapTable({
		toolbar : ".toolbar",
		clickToSelect : true,

		search : true,
		showToggle : true,
		showColumns : true,
		pagination : true,
		searchAlign : 'left',
		pageSize : 4,
		clickToSelect : false,
		pageList : [ 2, 4, 8, 10, 100 ],

		formatShowingRows : function(pageFrom, pageTo, totalRows) {
			//do nothing here, we don't want to show the text "showing x of y from..."
		},
		formatRecordsPerPage : function(pageNumber) {
			return pageNumber + " rows visible";
		},
		icons : {

			toggle : 'fa fa-th-list',
			columns : 'fa fa-columns',
		}
	});

	$(window).resize(function() {
		$table.bootstrapTable('resetView');
	});	

	
	<c:if test="${message != null && message != ''}">
		swal("${message}"); // 인사말 = 여러가지 옵션으로 변경 가능
	</c:if>
	
});
</script>
