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

function fnGoPaging(rpage) {
	
	$("#replyList").empty();
	$("#paging").empty();
	fap.ajaxReply(rpage, '<c:out value="${fanPageContent.no}"/>');
}

var fap = {
	
	editFn : function() {
		
		if ('${sessionScope.id}' == 'admin' || '${sessionScope.id}' == '${fanPageContent.wname}') {
			
			$("#no").val("${fanPageContent.no}");
			$("#frmFAP").attr("action", "fanPageUpdate.do");
			$("#frmFAP").submit();
		} else {
			
			alert("작성자 혹은 관리자만 수정가능합니다");
		}
	},
	
	deleteFn : function() {
		
		if ('${sessionScope.id}' == 'admin' || '${sessionScope.id}' == '${fanPageContent.wname}') {
			
			if (confirm("정말 삭제하시겠습니까??") == true) {
				
				$("#no").val("${fanPageContent.no}");
				$("#frmFAP").attr("action", "fanPagedelete.do");
				$("#frmFAP").submit();
			}			
		} else {
			
			alert("작성자 혹은 관리자만 삭제 가능합니다");
		}
	},
	
	ajaxReply : function(rpage, no) {				
		
		$.ajax({
			
			type		:	"POST"
			,url		:	"fapReplyList.do"
			,data		:	{"rpage" : rpage, "no" : no}
			,async		: 	false
			,success	: 	function(result) {
				
				var jsonRes = JSON.parse(result);
				
				var str = "";
				
				$.each(jsonRes.list, function(i, item) {					
					
					str += "<tr id='" + item.rnum + "'>"
              				+ "<td class='td001'>" + item.wname + "</td>"
              				+ "<td class='td001'>" + item.content + "</td>"              				
              				+ "<td class='td001'>"
              					+ "<button type='button' class='btn btn-info btn-round btn-sm btn-fill'"
					 			+ "onclick='fap.reditFn(\"" + item.rnum + "\", \"" + rpage + "\", \"" + item.content + "\", \"" + item.wname + "\")'>수정</button>"
							+ "</td>"
              				+ "<td class='td001'>"
              					+ "<button type='button' class='btn btn-danger btn-round btn-sm btn-fill'"
					 			+ "onclick='fap.rdeleteFn(\"" + item.rnum + "\", \"" + rpage + "\", \"" + item.wname + "\", \"" + item.r + "\")'>삭제</button>"
							+ "</td>"
              			  + "</tr>";     
				});
				
				$("#replyList").append(str);
				
				var paging = "";
				
					paging += "<ul class='pagination'>";
					
				if (parseInt(jsonRes.resMap.pageGroup) > 1) {
					
					paging += "<li>"
								+ "<a href='javascript:fnGoPaging(\"" + jsonRes.resMap.prePage + "\")'>«</a>"
							+ "</li>";
				}
				
				
				for (var i = 1; i <= (parseInt(jsonRes.resMap.endPage) > parseInt(jsonRes.resMap.totalPage) ? parseInt(jsonRes.resMap.totalPage) : parseInt(jsonRes.resMap.endPage)) ; i++) {
					
					if (jsonRes.resMap.page == i) {
						
						paging += "<li class='active'>"
									+ "<a href='javascript:fnGoPaging(\"" + i + "\")'>" + i + "</a>"
								+ "</li>";
					} else {
						
						paging += "<li>"
									+ "<a href='javascript:fnGoPaging(\"" + i + "\")'>" + i + "</a>"
								+ "</li>";
					}
				}
				
				if (parseInt(jsonRes.resMap.nextPage) < parseInt(jsonRes.resMap.totalPage)) {
					
					paging += "<li>"
								+ "<a href='javascript:fnGoPaging(\"" + jsonRes.resMap.nextPage + "\")'>»</a>"
							+ "</li>";
				}
				
					paging += "</ul>";
					
				$("#paging").append(paging);
			}
			,error:function() {

				alert("reply 조회시 Error 발생");
			}
			
		});
		
	},
	
	ajaxReplyCreate : function() {
		
		if ('${sessionScope.id}' != null && '${sessionScope.id}' != '') {
			
			var $content = $("#content");
			
			if ($content.val() == "" || $content.val() == null) {
				
				alert("내용을 입력하세요!");
				$content.focus();
			}
			
			var jsonObjCreate = {};
			
			jsonObjCreate.no = '${fanPageContent.no}';
			jsonObjCreate.wname = '${sessionScope.id}';
			jsonObjCreate.content = $content.val();
			
			$.ajax({

				type		: "POST"
				,url		: "fapReplyCreate.do"
				,datatype	: "json"
				,data		: {"reviewsOne" : JSON.stringify(jsonObjCreate)}
				,async		: false
				,success	: function(result) {
					
					var result = JSON.parse(result);
					
					if(result.result == 'success') {
						
						$("#replyList").empty();
						$("#paging").empty();
						fap.ajaxReply('1', '<c:out value="${fanPageContent.no}"/>');
						
						$("#content").val("");
						
						alert("글을 등록했습니다.");
					} else {
						
						alert("글을 등록하지 못 했습니다.");
					}					
				}
				,error:function() {

					alert("reply 등록시 Error 발생");
				}
			});
			
		} else {
			
			alert("로그인을 해주세요");
			
			location.href = "memberLogin.do";
		}
	},
	
	reditFn : function(rnum, rpage, content, wname) {
		
		if ('${sessionScope.id}' == wname || '${sessionScope.id}' == 'admin') {
			
			$("#content").val(content);
			$("#replyBtn").val("Reply 수정");
			$("#replyBtn").attr("onclick", "fap.ajaxReplyEdit(\""+rnum+"\", \""+rpage+"\", \""+wname+"\")");
		} else {
			
			alert("작성자 혹은 관리자만 수정 가능합니다.");
		}
	},
	
	rdeleteFn : function(rnum, rpage, wname, r) {
		
		if ('${sessionScope.id}' == wname || '${sessionScope.id}' == 'admin') {
			
			if (confirm("정말로 삭제할까요?") == true) {
				
				$.ajax({

					type		: "POST"
					,url		: "fapReplyDelete.do"					
					,data		: {"rnum" : rnum}
					,async		: false
					,success	: function(result) {
						
						var result = JSON.parse(result);
						
						if(result.result == 'success') {
							
							$("#replyList").empty();
							$("#paging").empty();
							
							if (parseInt(r) % 5 == 1 && parseInt(r) != 1) { // 페이지 당 자료 하나만 남을 경우
								
								fap.ajaxReply(parseInt(rpage) - 1, '<c:out value="${fanPageContent.no}"/>');
							} else {
								
								fap.ajaxReply(rpage, '<c:out value="${fanPageContent.no}"/>');
							}					
							
							$("#content").val("");
							$("#replyBtn").val("Reply 작성");
							$("#replyBtn").attr("onclick", "fap.ajaxReplyCreate()");
							
							alert("글을 삭제했습니다.");
						} else {
							
							alert("글을 삭제하지 못 했습니다.");
						}					
					}
					,error:function() {

						alert("reply 수정 시 Error 발생");
					}
				});
			}
		} else {
			
			alert("작성자 혹은 관리자만 삭제 가능합니다.");
		}
	},
	
	ajaxReplyEdit : function(rnum, rpage, wname) {		
			
		var $content = $("#content");
		
		if ($content.val() == "" || $content.val() == null) {
			
			alert("내용을 입력하세요!");
			$content.focus();
		}
		
		var jsonObjEdit = {};
		
		jsonObjEdit.no = '${fanPageContent.no}';
		jsonObjEdit.rnum = rnum;
		jsonObjEdit.wname = wname;
		jsonObjEdit.content = $content.val();
		
		$.ajax({

			type		: "POST"
			,url		: "fapReplyEdit.do"
			,datatype	: "json"
			,data		: {"reviewsOne" : JSON.stringify(jsonObjEdit)}
			,async		: false
			,success	: function(result) {
				
				var result = JSON.parse(result);
				
				if(result.result == 'success') {
					
					$("#replyList").empty();
					$("#paging").empty();
					fap.ajaxReply(rpage, jsonObjEdit.no);
					
					$("#content").val("");
					$("#replyBtn").val("Reply 작성");
					$("#replyBtn").attr("onclick", "fap.ajaxReplyCreate()");
					
					alert("글을 수정했습니다.");
				} else {
					
					alert("글을 수정하지 못 했습니다.");
				}					
			}
			,error:function() {

				alert("reply 수정 시 Error 발생");
			}
		});			
		
	},
}


$(document).ready(function() {	
	
	fap.ajaxReply('<c:out value="${param.rpage}"/>', '<c:out value="${fanPageContent.no}"/>');
	
	$("#content").click(function() {
		
		if ('${sessionScope.id}' == '' || '${sessionScope.id}' == null) {
			
			alert("로그인을 해주세요");
			
			location.href = "memberLogin.do";
		} 
	});
});
</script>

<form id="frmFAP" name="frmFAP">				
	<input type="hidden" name="pageName" value="menu10" />
	<input type="hidden" id="no"  name="no" />
	<input type="hidden" name="page" value="${param.page}"/>
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
			<div class="header">	                 	
           	</div>
           	<div class="content">   
           	   	<div class="content table-full-width">
	               	<table class="table table-bordered table-hover">                       
	            		<tr>                     	
		                 	<th width="10%" class="th001">NO</th>
		             		<td width="10%" class="td001"><c:out value="${fanPageContent.no}"/></td>
		             		<th width="15%" class="th001">DATE</th>
		             		<td width="15%" class="th001"><c:out value="${fanPageContent.wdate}"/></td>
		             		<th width="10%" class="th001">작성자</th>
		             		<td width="10%" class="th001"><c:out value="${fanPageContent.wname}"/></td>
	            		</tr>
	            		<tr>  
	            			<th colspan="1" class="th001">TITLE</th>
	             			<td colspan="3" class="td001"><c:out value="${fanPageContent.title}"/></td>
	             			<th class="th001">VIEW</th>
	             			<td class="td001"><c:out value="${fanPageContent.viewcnt}"/></td>     		 
	            		</tr>
	            		<tr> 
	            			<td colspan="6">
	            				<c:out value="${fanPageContent.content}" escapeXml="false"/>
	            			</td>	            			
	            		</tr>	            			               		             		                                       	
	               	</table>	               
	           	</div>
	           	<br /><br />	           	
				<div class="clearfix"></div>										
				<form action="fanPage.do">
					<input type="hidden" name="pageName" value="menu10" />
					<c:choose>
						<c:when test="${param.page eq null || param.page eq ''}">
							<input type="hidden" id="page" name="page" value="1"/>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="page" name="page" value="${param.page}"/>
						</c:otherwise>
					</c:choose>							
					<div class="text-center">
						<button class="btn btn-round btn-lg btn-fill">목록</button>
						<button type="button" onclick="fap.editFn()" class="btn btn-info btn-round btn-lg btn-fill">수정</button>
						<button type="button" onclick="fap.deleteFn()" class="btn btn-danger btn-round btn-lg btn-fill">삭제</button>
					</div>
					<div class="clearfix"></div>
				</form>
			</div>			
			<div class="footer">
				<div class="container content table-responsive">
                   	<table class="table table-hover">
                       	<thead>                           
                       		<th width="20%" class="th001">WNAME</th>
                       		<th width="60%" class="th001">CONTENT</th>                       		
                       		<th width="10%" class="th001">EDIT</th>
                       		<th width="10%" class="th001">DELETE</th>
                       	</thead>                       
                       	<tbody id="replyList">             			
              				                    	
                       	</tbody>
                   	</table>
                   	<br />
	               	<div class="text-center" id="paging">     
	               	
	               	</div> 
                   	<br /> <br />
	               	<div class="text-center" style="font-size: 20px;">
	               	<p class="category text-success" style="font-size: 20px;">후기글 작성</p>                 
	                   	<div class="col-md-10">
	                   		내용               		
	                   	</div>                   
	                   	<div class="col-md-2">
	                   		Button                		
	                   	</div>
	                   	<br />						
	                   	<div class="col-md-10">
	                   		<input type="text" id="content" name="content" style="width: 100%;" />                 		
	                   	</div>
	                   	<div class="col-md-2">
	                   		<input type="button" id="replyBtn" class="btn btn-warning btn-md btn-fill" onclick="fap.ajaxReplyCreate()" value="Reply 작성" />                		
	                   	</div>
					</div>
               	</div> 
          		        	
			</div>	
		</div>	<!--  end card  -->
	</div> <!-- end col-md-12 -->
</div> <!-- end row -->