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
<title>하이라이트 영상</title>
</head>
<body>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#dialog").hide();
	
	interval = setInterval(popPartnerDialog.limitCount, 10000);
		
});

var popPartnerDialog = 
{
		limitCount : function() {
			
			var $youtube = $('#player')[0].contentWindow; // youtube 영상 변수화
			
			$youtube.postMessage('{"event":"command","func":"pauseVideo","args":""}','*'); // 창이 뜨면서 player 잠시 멈춤
			
			$("#dialog").dialog({
				closeOnEscape: false, // ESC 버튼 적용 되지 않게 하기
				open: function() { 
		            $(".ui-dialog-titlebar-close", $("#dialog").parent()).hide(); // dialog 창 x 버튼 없애기(해당 창에 한에서)
		    	},		
				buttons: [ { 
								text: "네, 계속 볼께요!", 
								click: function() { //클릭이벤트발생시 동작 
									$(this).dialog( "close" );  // 확인 창 닫는 동작
									interval = setInterval(popPartnerDialog.limitCount, 10000); // interval 재설정
									$youtube.postMessage('{"event":"command","func":"playVideo","args":""}','*'); // 버튼 클릭시 다시 재생
								} 
							}, 
							{ 				
								text: "아니요", 
								click: function() { //클릭이벤트발생시 동작 
									$(this).dialog( "close" ); 
									self.close(); // 팝업창 닫는 동작
								} 
							} 
						  ] 
			});
			
			clearInterval(interval);	// 창이 떠 있는동안 interval 해제
			
		}	
}


function buttonClose() {
	
	self.close();
}
</script>
<div class="text-center container-fluid">
	<iframe id="player" width="100%" height="500px" src="${url}?autoplay=1&enablejsapi=1" frameborder="0"></iframe>	
	<input type="button" class="btn btn-primary" onclick="buttonClose()" value="닫기" />					
</div>
	<div id="dialog" title="확인창">
		재미있게 보고 있나요?
	</div>
</body>
</html>
