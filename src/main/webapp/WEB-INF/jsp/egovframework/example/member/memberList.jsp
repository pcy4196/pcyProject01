<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/qnaTable/qna/carousel.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>웹사이트 회원 목록 확인 PAGE</h2>
						<p>- 회원 목록 게시판 -</p>
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
						<th data-sortable="true" class="text-center">ID</th>
						<th class="text-center">Name</th>
						<th data-sortable="true" class="text-center">PHONENUMBER</th>
						<th class="text-center">Edit & View</th>						
						<th class="text-center">Delete</th>
					</thead>
					<tbody>
						<c:forEach items="${infoMemberList}" var="List" varStatus="status">
							<tr>
						<c:choose>
							<c:when test="${List.id eq 'admin'}">							
								<td><i class="fa fa-hand-o-right"></i> <c:out value="${List.id}"/></td>								
							</c:when>
							<c:otherwise>
								<td><c:out value="${List.id}"/></td>								
							</c:otherwise>
						</c:choose>
								<td><c:out value="${List.name}"/></td>
								<td><c:out value="${List.phonenumber}"/></td>
								<td><button class="btn btn-info btn-round btn-sm btn-fill" 
								onclick="javascript:memberList.editMember('${List.id}')">Edit & View</button></td>								
								<td><button class="btn btn-danger btn-round btn-sm btn-fill" 
								onclick="javascript:memberList.deleteMember('${List.id}')">Delete</button></td>
							</tr>
						</c:forEach>    					
					</tbody>
				</table>				
				<div class="clearfix"></div>
			</div>
			<div class="footer"></div>	
		</div>	<!--  end card  -->
	</div> <!-- end col-md-12 -->
</div> <!-- end row -->



<script type="text/javascript">
var memberList = 
{					
	editMember : function(id) {		
		
		$("#memberId").val(id);
		
		$("#memberFrm").attr("action", "member_update_admin.do");
		$("#memberFrm").submit();				
	},
	
	deleteMember : function(id) {
		
		$("#dialog").dialog({
			closeOnEscape: false, // ESC 버튼 적용 되지 않게 하기
			open: function() { 
	            $(".ui-dialog-titlebar-close", $("#dialog").parent()).hide(); // dialog 창 x 버튼 없애기(해당 창에 한에서)
	    	},		
			buttons: [ { 
							text: "네! 지울께요", 
							click: function() { //클릭이벤트발생시 동작 
								$(this).dialog( "close" );  // 확인 창 닫는 동작
								
								$("#memberId").val(id);
								
								$("#memberFrm").attr("action", "member_delete_admin.do");
								$("#memberFrm").submit();
							} 
						}, 
						{ 				
							text: "아니요", 
							click: function() { //클릭이벤트발생시 동작 
								$(this).dialog( "close" );								
							} 
						} 
					  ] 
		});			
	}
};	

var $table = $('#bootstrap-table');

$(document).ready(function() {		
	
	$('#dialog').hide();
	
	$table.bootstrapTable({
		toolbar : ".toolbar",
		clickToSelect : true,

		search : true,
		showToggle : true,
		showColumns : true,
		pagination : true,
		searchAlign : 'right',
		pageSize : 5,
		clickToSelect : false,
		pageList : [ 3, 5, 10, 15, 100 ],

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

});
</script>

<div id="dialog" title="확인창">
	아이디를 삭제 할까요?
</div>

<form id="memberFrm" name="memberFrm">
	<input type="hidden" id="pageNameM"  name="pageName" value="memberList"/>
	<input type="hidden" id="memberId"  name="memberId" />					
</form>