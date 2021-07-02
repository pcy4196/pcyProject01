<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- dialog CSS and JS     -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<style type="text/css">
.th001 {
	text-align: center
}
.td001 {
	text-align: center
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	main.ajaxReviews();
	
	$("#iconSelect").change(function() {
		
		var $str = $("#iconSelect option:selected").val();
		
		$("#iconImg").attr("src", $str);
	});
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
					
					$("#reviewsList").empty(); // 자식 태그 요소 삭제
					
					$("#wname").val("");
					$("#content").val("");
					$("#passwd").val("");
					$("#iconSelect option:eq(0)").attr("selected", "selected");					
					$("#iconImg").attr("src", "images/main/emo01.gif");
					
					main.ajaxReviews();
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

var main = 
{
	mainReviewTotal : function() {		
		
		var scWidth = screen.availWidth;
		var scHeight = screen.availHeight;

		var left = (parseInt(scWidth)-650)/2;   // 창의 왼쪽 간격을
		var top = (parseInt(scHeight)-600)/2; 	//창의 높이를
		
		var url = "reviewMain.do?page=1";
		var opt = "width=800,height=600,top="+top+",left="+left+"";
		
		window.open(url, "", opt);
	},	
		
	ajaxReviews : function() {				
		
		$.ajax({
			
			type		:	"POST"
			,url		:	"mainReviewsList.do"
			,async		: 	false
			,success	: 	function(result) {
				
				var jsonRes = JSON.parse(result);
				
				var str = "";
				
				$.each(jsonRes, function(i, item) {					
					
					str += "<tr id='" + item.no + "'>"
              				+ "<td class='td001'>" + item.no + "</td>"
              				+ "<td class='td001'>"
              					+ "" + item.wname + " &nbsp; <img src='" + item.icon + "' style='width: 20px;height: 20px;' />"
              				+ "</td>"
              				+ "<td class='td001'>" + item.content + "</td>"
              				+ "<td class='td001'>"
              					+ "<button class='btn btn-info btn-round btn-sm btn-fill'"
					 			+ "onclick='main.ajaxReviewsEdit(\"" + item.no + "\")'>EDIT</button>"
							+ "</td>"
              				+ "<td class='td001'>"
              					+ "<button class='btn btn-danger btn-round btn-sm btn-fill'"
					 			+ "onclick='main.ajaxReviewsDelte(\"" + item.no + "\")'>Delete</button>"
							+ "</td>"
              			  + "</tr>";             		
				});
				
				$("#reviewsList").append(str);

			}
			,error:function() {

				alert("main reviews 조회시 Error 발생");
			}
			
		});
		
	},
	
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
	    													+ "<button class='btn btn-default btn-round btn-sm btn-fill'"
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
	    									
	    									main.ajaxReviewsDelteProc($no);
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
					
					$("#reviewsList").empty(); // 자식 태그 요소 삭제
										
					main.ajaxReviews();
				} else {
					
					alert("글을 삭제하지 못했습니다");
				}
			}
			,error:function() {

				alert("main reviews 삭제시 Error 발생");
			}
		
		});
	},
	
	ajaxReviewsCreate : function() {
		
		var that = this;
		
		var $wname = $("#wname");
		var $content = $("#content");
		var $passwd = $("#passwd");
		
		if ($wname.val() == '' || $wname.val() == null) {
			
			alert("작성자를 입력해 주세요");
			
			$wname.focus();
			
			return false;
		} else if ($content.val() == '' || $content.val() == null) {
			
			alert("내용을 입력해 주세요");
			
			$content.focus();
			
			return false;
		} else if ($passwd.val() == '' || $passwd.val() == null) {
			
			alert("비밀번호를 입력해 주세요");
			
			$passwd.focus();
			
			return false;
		}
		
		var jsonObjCreate = {};
		
		jsonObjCreate.wname = $wname.val();
		jsonObjCreate.content = $content.val();
		jsonObjCreate.passwd = $passwd.val();
		jsonObjCreate.iconImg = $("#iconImg").attr("src");
		
		$.ajax({

			type		: "POST"
			,url		: "mainReviewsCreate.do"
			,datatype	: "json"
			,data		: {"reviewsOne" : JSON.stringify(jsonObjCreate)}
			,async: false
			,success: function(result) {
				
				var result = JSON.parse(result);
				
				if(result.result == 'success') {
					
					alert("글이 등록되었습니다.");
					
					$("#reviewsList").empty(); // 자식 태그 요소 삭제
					
					$("#wname").val("");
					$("#content").val("");
					$("#passwd").val("");
					$("#iconSelect option:eq(0)").attr("selected", "selected");					
					$("#iconImg").attr("src", "images/main/emo01.gif");
					
					main.ajaxReviews();
				}
			}
			,error:function() {

				alert("main reviews 등록시 Error 발생");
			}
		});

	},
}
</script>
<div class="card" >
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel" >
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#theme-carousel" data-slide-to="0" class="active"></li>
				<li data-target="#theme-carousel" data-slide-to="1"></li>
				<li data-target="#theme-carousel" data-slide-to="2"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" >
				<div class="item active" align="center">
					<img src="images/carousel2.jpg" alt="carousel2" style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>"성공은 어느날 우연처럼 벌어지는 것이 아니다"</h2>
						<p> - 스테판 커리 - </p>
					</div>
				</div>
				<div class="item" align="center">
					<img src="images/carousel1.jpg" alt="carousel1" style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>"나는 거의 모든 시간을 체육관에서 보낸다. 그런 날 이상하게 보는 사람도 많다. 하지만 
						최고를 꿈꾼다면 그렇게 해야 한다. 그리고 내가 그런 선수라는 게 기쁘다."</h2>
						<p> - 케빈 듀란트 - </p>
					</div>
				</div>
				<div class="item" align="center"	>
					<img src="images/carousel3.jpg" alt="carousel3" style="width: 95%; margin-top: 5px; margin-bottom: 5px">
					<div class="carousel-caption">
						<h2>"NBA 한쿼터 최다득점 기록 보유자,<br /> 
						황금군단의 슈팅마스터"</h2>
						<p>- 클레이 탐슨 -</p>
					</div>
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#theme-carousel" role="button" data-slide="prev"></a> 
			<a class="right carousel-control" href="#theme-carousel" role="button" data-slide="next"></a>
		</div>
	</div>
</div>

<div class="card" >
	<div class="container">
		<div class="row" >
			<div class="col-lg-8">
				<h1 class="text-danger">Welcome!</h1>
				<h2>Warriors Fan Page</h2>
				<p class="text-justify" style="font-size: 20px;">'Warriors Fan Page' 입니다. 워리어스와 관련된 정보와
				워리어스 선수들에 대한 영상 및 커뮤니티 게시판을 통해 Golden State Warriors
				Team의 팬이 될 것이고 커리, 듀란트 및 워리어스 선수들에 대한 관심이 더욱더
				커질것입니다.</p>
			</div>
			<div class="col-lg-4 text-center">
				<img src="images/image1.png" class="img-responsive" />
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row" >
			<div class="content" >
				<div class="col-lg-12" style="height: 700px;">
						<h1 class="text-danger">Best Part Of Warriors</h1>
						<iframe src="https://www.youtube.com/embed/NzR70dZErdQ?rel=0&amp;showinfo=0?ecver=2&autoplay=1" 
						frameborder="2" style="width:100%;height:85%;" ></iframe>
				</div>
			</div>
		</div>
	</div>
	<div class="footer"></div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="content">
				<div class="header">
				<div class="row">
                   	<h3 class="title">Site Reviews</h3>
					<p class="category text-info" style="font-size: 20px;">이용하면서 느낀 후기글 모음</p>
					<div class="pull-right" style="margin-top: -60px; margin-right: 30px;">  
						<button class="btn btn-success btn-lg btn-fill" onclick="main.mainReviewTotal()">전체 보기</button>  		
					</div>
				</div>
               	</div>
               	<div class="content table-responsive">
                   	<table class="table table-hover">
                       	<thead>
                           	<th width="10%" class="th001">NO</th>
                       		<th width="20%" class="th001">WNAME</th>
                       		<th width="50%" class="th001">CONTENT</th>                       		
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
              			                           	
                       	</tbody>
                   	</table>
               	</div>
               	<br /> <br />
               	<div class="text-center" style="font-size: 20px;">
               	<p class="category text-success" style="font-size: 20px;">후기글 작성</p>
               		<div class="col-md-2">
                   		ICONS              		           		
                   	</div>
                   	
                   	<div class="col-md-2">
                   		작성자               		
                   	</div>
                   	<div class="col-md-5">
                   		내용               		
                   	</div>
                   	<div class="col-md-2">
                   		비밀번호               		
                   	</div>
                   	<div class="col-md-1">
                   		Button                		
                   	</div>
                   	<br /><br />
               		<div class="col-md-2">
                   		<select id="iconSelect" name="icon" style="width:60%; height:40px; ">
                   			<option value="images/main/emo01.gif">아이콘1</option>
						    <option value="images/main/emo02.gif">아이콘2</option>
						    <option value="images/main/emo03.gif">아이콘3</option>
						    <option value="images/main/emo04.gif">아이콘4</option>
						    <option value="images/main/emo05.gif">아이콘5</option>
						    <option value="images/main/emo06.gif">아이콘6</option>
                   		</select>
                   		&nbsp;
                   		<img src="images/main/emo01.gif" id="iconImg" style="width: 30px; height: 30px;" />                   		           		
                   	</div>
                  	
					<div class="col-md-2">
                   		<input type="text" id="wname" name="wname" style="width: 100%; height: 40px;"/>                 		
                   	</div>
                   	<div class="col-md-5">
                   		<input type="text" id="content" name="content" style="width: 100%; height: 40px;" />                 		
                   	</div>
                   	<div class="col-md-2">
                   		<input type="password" id="passwd" name="passwd" style="width: 100%; height: 40px;" />                 		
                   	</div>
                   	<div class="col-md-1">
                   		<button class="btn btn-warning btn-md btn-fill" onclick="main.ajaxReviewsCreate()">Reviews 작성</button>                		
                   	</div>
				</div>
              
				<div class="clearfix"></div>				
			</div>
			<div class="footer">
			
			</div>	
		</div>	<!--  end card  -->
	</div> <!-- end col-md-12 -->
</div> <!-- end row -->

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