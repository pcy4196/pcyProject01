<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ include file="../cmmn/common_lib.jsp" %>

<!-- Bootstrap core CSS     -->
<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet" /> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<style type="text/css">
.th001 {
	text-align: center
}
.td001 {
	text-align: center
}
</style>

<title>review 전체보기</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	
		
});

$(document).on("change", "#iconSelectChange", function() {
	
	var $str = $("#iconSelectChange option:selected").val();
	
	$("#iconImgChage").attr("src", $str);
});

var changeRe = 
{
	editCancle	: function(no) {
		
		$('#changeReviewBox'+no).remove();
	},
	
	editGo		: function(no) {
		
		var $editWname = $("#editWname");
		var $editContent = $("#editContent");
		var $editPasswd = $("#editPasswd");
		
		if ($editWname.val() == '' || $editWname.val() == null) {
			
			alert("작성자를 입력해 주세요");
			
			$editWname.focus();
			
			return false;
		} else if ($editContent.val() == '' || $editContent.val() == null) {
			
			alert("내용을 입력해 주세요");
			
			$editContent.focus();
			
			return false;
		} else if ($editPasswd.val() == '' || $editPasswd.val() == null) {
			
			alert("비밀번호를 입력해 주세요");
			
			$editPasswd.focus();
			
			return false;
		}
		
		var $no = no;
		
		var jsonObjEdit = {};
		
		jsonObjEdit.no		= $no;
		jsonObjEdit.wname 	= $("#editWname").val();
		jsonObjEdit.content = $("#editContent").val();
		jsonObjEdit.passwd 	= $("#editPasswd").val();
		jsonObjEdit.iconImg = $("#iconImgChage").attr("src");
		
		$.ajax({
			
			type		:	"POST"
			,url		:	"mainReviewsEdit.do"
			,datatype	: 	"json"
			,data		: 	{"reviewsEditOne" : JSON.stringify(jsonObjEdit)}
			,async		: 	false
			,success	: 	function(result) {
				
				var result = JSON.parse(result);
				
				if (result.result == "success") {
					
					alert("글을 수정했습니다");
					
					location.href = "reviewMain.do?page=<c:out value='${resMap.page}'/>";
							
				} else {
					
					alert("글을 수정하지 못 했습니다");
				}

			}
			,error:function() {

				alert("main reviews 조회시 Error 발생");
			}
			
		});
	}
}

var reviewMain = {
	
	ajaxReviewsEdit : function(no) {
		
		var $no = no; // 테이블 번호
		
		$("#edit").dialog({
			closeOnEscape: false, // ESC 버튼 적용 되지 않게 하기
			show: "slide",
			hide: "slide",
			width : "500",				
			open: function() { 
	            $(".ui-dialog-titlebar-close", $("#edit").parent()).hide();
	    	},
	    	buttons: [ {
	    					text: "확인", 
	    					click: function() {
	    						if ($("#editPasswdCk").val() == null || $("#editPasswdCk").val() == '') {
									alert("비밀번호를 입력해주세요");
									return false;
								}
	    						
	    						
	    						var passwd = $("#editPasswdCk").val();
	    						
	    						$.ajax({

	    							type		: "POST"
	    							,url		: "mainReviewsCheck.do"
	    							,data		: {	"no" : $no,
	    											"passwd" : passwd }
	    							,async		: false
	    							,success	: function(result) {
	    								
	    								var result = JSON.parse(result);
	    								
	    								if (result.result == "success") {
											
	    									alert("비밀번호가 일치합니다");
	    									
	    									var str = "<tr id='changeReviewBox"+$no+"'>"
	    												+ "<td class='td001' style='font-size: 14px;'>"
	    													+ "<select id='iconSelectChange' name='icon' style='width:70%; height:30px;'>"
	    				       									+ "<option value='images/main/emo01.gif'>아이콘1</option>"
	    							    						+ "<option value='images/main/emo02.gif'>아이콘2</option>"
	    							    						+ "<option value='images/main/emo03.gif'>아이콘3</option>"
	    							    						+ "<option value='images/main/emo04.gif'>아이콘4</option>"
	    							    						+ "<option value='images/main/emo05.gif'>아이콘5</option>"
	    							    						+ "<option value='images/main/emo06.gif'>아이콘6</option>"
	    				       								+ "</select> &nbsp;"
	    				       								+ "<img src='images/main/emo01.gif' id='iconImgChage' style='width:20px; height:20px;'/>"  
	    												+ "</td>"
	    												+ "<td class='td001'>"
	    													+ "<input type='text' id='editWname' placeholder='작성자' name='editWname' style='width:80%;'>"
	    												+ "</td>"
	    												+ "<td class='td001'>"
	    													+ "<input type='text' id='editContent' placeholder='내용' name='editContent' style='width: 75%;'>"
	    													+ "&nbsp; <input type='text' id='editPasswd' placeholder='비밀번호' name='editPasswd' style='width: 20%;'>"
	    												+ "</td>"
	    												+ "<td class='td001'>"
	    													+ "<button class='btn btn-success btn-round btn-sm btn-fill'"
	    													+ "onclick='changeRe.editGo(\"" + $no + "\")'>수정하기</button>"
	    												+ "</td>"
	    												+ "<td class='td001'>"
	    													+ "<button class='btn btn-danger btn-round btn-sm btn-fill'"
	    													+ "onclick='changeRe.editCancle(\"" + $no + "\")'>취소</button>"
	    												+ "</td>"
	    											 + "</tr>";
	    						
	    								 
				    					 	if ($('#changeReviewBox'+no).length == 0) {
				    					 		
				    					 		$('#'+no).after(str);
				    						}
										} else {
											
											alert("비밀번호가 일치하지 않습니다");
										}
	    							}
	    							,error:function() {

	    								alert("main reviews 비밀번호 체크시 Error 발생");
	    							}
	    						
	    						});
	    						$(this).dialog( "close" );
	    					}
	    				},
	    				{ 				
							text: "닫기", 
							click: function() { //클릭이벤트발생시 동작 
								$(this).dialog( "close" );								
							} 
						} 								    				
	    			 ]								    	
		});	
	},
	
	ajaxReviewsDelte : function(no) {
		var $no = no; // 테이블 번호
		
		$("#delete").dialog({
			closeOnEscape: false, // ESC 버튼 적용 되지 않게 하기
			show: "slide",
			hide: "slide",
			width : "500",				
			open: function() { 
	            $(".ui-dialog-titlebar-close", $("#delete").parent()).hide();
	    	},
	    	buttons: [ {
	    					text: "확인", 
	    					click: function() {
	    						if ($("#deletePasswdCk").val() == null || $("#deletePasswdCk").val() == '') {
									alert("비밀번호를 입력해주세요");
									return false;
								}
	    						
	    						
	    						var passwd = $("#deletePasswdCk").val();
	    						
	    						$.ajax({

	    							type		: "POST"
	    							,url		: "mainReviewsCheck.do"
	    							,data		: {	"no" : $no,
	    											"passwd" : passwd }
	    							,async		: false
	    							,success	: function(result) {
	    								
	    								var result = JSON.parse(result);
	    								
	    								if (result.result == "success") {
											
	    									alert("비밀번호가 일치합니다");
	    									
	    									reviewMain.ajaxReviewsDelteProc($no);
										} else {
											
											alert("비밀번호가 일치하지 않습니다");
										}
	    							}
	    							,error:function() {

	    								alert("main reviews 비밀번호 체크시 Error 발생");
	    							}
	    						
	    						});
	    						$(this).dialog( "close" );
	    					}
	    				},
	    				{ 				
							text: "닫기", 
							click: function() { //클릭이벤트발생시 동작 
								$(this).dialog( "close" );								
							} 
						} 								    				
	    			 ]								    	
		});		
	},
	
	ajaxReviewsDelteProc : function(no) {
		
		var $no = no;
		
		$.ajax({

			type		: "POST"
			,url		: "mainReviewsDelete.do"
			,data		: {	"no" : $no }
			,async		: false
			,success	: function(result) {
				
				var result = JSON.parse(result);
				
				if (result.result == "success") {
					
					alert("글을 삭제 했습니다");	
															
					location.href = "reviewMain.do?page=<c:out value='${resMap.page}'/>";
					
				} else {
					
					alert("글을 삭제하지 못했습니다");
				}
			}
			,error:function() {

				alert("main reviews 삭제시 Error 발생");
			}
		
		});
	},
}

function fnGoPaging(page) {

	location.href = "reviewMain.do?page=" + page;
}


function buttonClose() {
	
	window.opener.$("#reviewsList").empty() // main 페이지 자식요소 삭제
	
	window.opener.main.ajaxReviews();		// main 페이지 review 새로 요청(ajax)
	
	self.close();
}
</script>
<div class="text-center container">
	<br />
	<h3>Review 글 전체보기</h3>
	<div class="content table-responsive">
       	<table class="table table-hover">
           	<thead>
               	<th width="20%" class="th001">NO</th>
           		<th width="20%" class="th001">WNAME</th>
           		<th width="40%" class="th001">CONTENT</th>                       		
           		<th width="10%" class="th001">EDIT</th>
           		<th width="10%" class="th001">DELETE</th>
           	</thead>
           	<tfoot>
               	<td width="10%" class="th001">번호</td>
           		<td width="20%" class="th001">작성자</td>
           		<td width="50%" class="th001">내용</td>                       		
           		<td width="10%" class="th001">수정</td>
           		<td width="10%" class="th001">삭제</td>
           	</tfoot>
           	<tbody id="reviewsList">
	           	<c:forEach var="reviewsList" items="${reviewsList}" varStatus="status">             			
	  			  <tr id='${reviewsList.no}'>
	  			  	<td class='td001'><c:out value="${reviewsList.no}"/></td>
	  			  	<td class='td001'>
	  			  		<c:out value="${reviewsList.wname}"/>  &nbsp; <img src='<c:out value="${reviewsList.icon}"/>' style='width: 20px;height: 20px;' />	
	  			  	</td>
	  			  	<td class='td001'><c:out value="${reviewsList.content}"/></td>
	  			  	<td class='td001'>
	  			  		<button class='btn btn-info btn-round btn-sm btn-fill'
	  			  		onclick="reviewMain.ajaxReviewsEdit('<c:out value="${reviewsList.no}"/>')">EDIT</button>
	  			  	</td>
	  			  	<td class='td001'>
	  			  		<button class='btn btn-danger btn-round btn-sm btn-fill'
	  			  		onclick="reviewMain.ajaxReviewsDelte('<c:out value="${reviewsList.no}"/>')">Delete</button>
	  			  	</td>
	  			  </tr>
	  			</c:forEach>                         	
           	</tbody>
       	</table>
   	</div>	
	<div class="content text-center">
    	<ul class="pagination">
			<c:if test="${resMap.pageGroup > 1}">
				<li>
					<a href="javascript:fnGoPaging('<c:out value="${resMap.prePage}"/>')">≪</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${resMap.startPage}" 
			   end="${resMap.endPage > resMap.total ? resMap.total : resMap.endPage}">
				<c:choose>
					<c:when test="${resMap.page eq i}">
						<li class=“active" >
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
       		<c:if test="${resMap.nextPage <= resMap.total}">
				<li>
					<a href="javascript:fnGoPaging('<c:out value="${resMap.nextPage}"/>')">≫</a>
				</li>
			</c:if>       		
    	</ul>
    </div>
	<input type="button" class="btn btn-primary" onclick="buttonClose()" value="닫기" />					
</div>

<div id="edit" style="display: none;" title="EDIT">	
	<div style="font-size: 20px; text-align: center;">
		<p class="text-primary" style="font-style:italic;">
			비밀번호를 입력해 주세요<br />
			(관리자와 작성자만 수정 가능합니다)
		</p>
		<input class="form-control" type="password" name="passwd" id="editPasswdCk" />
	</div>
</div>

<div id="delete" style="display: none;" title="DELETE">	
	<div style="font-size: 20px; text-align: center;">
		<p class="text-primary" style="font-style:italic;">
			비밀번호를 입력해 주세요<br />
			비밀번호가 맞으면 삭제를 합니다<br />
			(관리자와 작성자만 삭제 가능합니다)
		</p>
		<input class="form-control" type="password" name="passwd" id="deletePasswdCk" />
	</div>
</div>

</body>
</html>
