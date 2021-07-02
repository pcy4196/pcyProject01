<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- playerProfile CSS     -->
<link href="css/style.css" rel="stylesheet" />
<!-- dialog CSS and JS     -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


<script type="text/javascript">



$(document).ready(function() {
	
});

var initDialog = 
{
	showContent : function(type) {	
		
		<c:forEach var="profile" items="${profile}" varStatus="status">
		if (type == '${profile.id}') {			
		
			$("#"+'${profile.id}').dialog({
				closeOnEscape: false, // ESC 버튼 적용 되지 않게 하기
				show: "slide",
				hide: "slide",
				width : "600",
				height : "880",
				open: function() { 
		            $(".ui-dialog-titlebar-close", $("#"+'${profile.id}').parent()).hide(); // dialog 창 x 버튼 없애기(해당 창에 한에서)
		    	},		
				buttons: [ { 
								text: "하이라이트 영상 보기", 
								click: function() { //클릭이벤트발생시 동작 
									var params = "?id=${profile.id}";
									var url = "playerVideo.do";
									var opt = "width=650,height=450,left=200,top=100";
									
									window.open(url + params, "", opt);						
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
			
		}
		</c:forEach>
	
	}
}
</script>

<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/playerProfile/mainPlayerProfile.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>선수 사진을 클릭하면 선수 개인의 프로필을<br /> 확인 할 수 있습니다</h2>
						<p>- Player Profile View -</p>
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
               	<div class="content">
                   	<div class="home-sale-off">
						<div class="products-sale animation-element fade-in">
							<ul>
								<li>
									<a href="javascript:initDialog.showContent('playerA')">
										<img src="images/playerProfile/player-photo1.png" alt="">
										<span class="price">
											<ins><span class="amount" style="font-size: 20px;">스테판 커리</span></ins>
											<del>PG</del>
										</span>
									</a>
								</li>
		
								<li>
									<a href="javascript:initDialog.showContent('playerB')">
										<img src="images/playerProfile/player-photo2.png" alt="">
										<span class="price">
											<ins><span class="amount" style="font-size: 20px;">케빈 듀란트</span></ins>
											<del>SF</del>
										</span>
									</a>
								</li>
		
								<li>
									<a href="javascript:initDialog.showContent('playerC')">
										<img src="images/playerProfile/player-photo3.png" alt="">
										<span class="price">
											<ins><span class="amount" style="font-size: 20px;">클레이 톰슨</span></ins>
											<del>SG</del>
										</span>
									</a>
								</li>						
							</ul>
						</div>				
					</div><!-- .home-sale-off -->
               	</div>			
				<div class="clearfix"></div>				
			</div>
			<div class="footer"></div>	
		</div>	<!--  end card  -->
	</div> <!-- end col-md-12 -->
</div> <!-- end row -->

<c:forEach var="profile" items="${profile}" varStatus="status">
	<div id="<c:out value='${profile.id}'/>" style="display: none;" title="<c:out value='${profile.name}'/>" class="text-center">
		<img src="images/playerProfile/playerImage/<c:out value='${profile.fname}'/>" />
		<br /><br />
		<table class="table table-hover table-striped table-bordered" >
			<tr>
				<th width="30%" style="text-align: center;">생년월일</th>
				<td width="70%" style="text-align: center;"><c:out value='${profile.birthday}'/></td>
			</tr>
			<tr>
				<th width="30%" style="text-align: center;">출신학교</th>
				<td width="70%" style="text-align: center;"><c:out value='${profile.school}'/></td>
			</tr>
			<tr>
				<th width="30%" style="text-align: center;">신장, 체중</th>
				<td width="70%" style="text-align: center;"><c:out value='${profile.body}'/></td>
			</tr>
			<tr>
				<th width="30%" style="text-align: center;">포지션</th>
				<td width="70%" style="text-align: center;"><c:out value='${profile.position}'/></td>
			</tr>
			<tr>
				<th width="30%" style="text-align: center;">등번호</th>
				<td width="70%" style="text-align: center;"><c:out value='${profile.bnumber}'/></td>
			</tr>
			<tr>
				<th width="30%" style="text-align: center;">수상 내역</th>
				<td width="70%" style="text-align: center;"><c:out value="${profile.award}" escapeXml="false"/></td>
			</tr>
		</table>
	</div>
</c:forEach>