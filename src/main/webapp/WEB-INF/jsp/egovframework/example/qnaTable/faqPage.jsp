<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	$(document).ready(function() {

		$('.widget-content').hide();

		/* Widget close */

		$('.wclose').click(function(e) {
			e.preventDefault();
			var $wbox = $(this).parent().parent().parent();
			$wbox.hide(100);
		});

		/* Widget minimize */

		$('.wminimize').click(function(e) {
			e.preventDefault();
			var $wcontent = $(this).parent().parent().next('.widget-content');
			if ($wcontent.is(':visible')) {
				$(this).children('i').removeClass('fa fa-chevron-up');
				$(this).children('i').addClass('fa fa-chevron-down');
			} else {
				$(this).children('i').removeClass('fa fa-chevron-down');
				$(this).children('i').addClass('fa fa-chevron-up');
			}
			$wcontent.toggle(500);
		});
	});
</script>
<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/qnaTable/faq/carousel.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>
							NBA 관련한 기본적으로 많이 궁금한 사항에 관하여<br /> 알아보겠습니다
						</h2>
						<p>- NBA 기본적인 정보 -</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card">
	<div class="header">
		<h3 class="title">NBA 관련 기본적인 Q&A</h3>
		<p class="category text-info" style="font-size: 20px;">'v' 화살표를 눌러주세요</p>
	</div>
	<div class="content">
		<div class="col-md-12">
			<div class="widget wred">
				<div class="widget-head">
					<div class="pull-left">NBA 뜻은 어떻게 되나요?</div>
					<div class="widget-icons pull-right">
						<a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a>
						<a href="#" class="wclose"><i class="fa fa-times"></i></a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="widget-content">
					<div class="padd">
						<h5>
							전미 농구 협회(National Basketball Association, NBA)는 미국의 프로 농구 연맹이다. <br />
							NBA 리그는 야구의 MLB, 미식축구의 NFL, 아이스하키의 NHL와 더불어 미국의 4대 스포츠 리그 중 하나로
							여겨진다. <br /> 2006년 7월 기준으로 30개 팀으로 구성되어 있다.
						</h5>
					</div>
				</div>
				<div class="widget-foot">
					<div class="pagination pull-right">
						<h5>NBA 뜻은 어떻게 되나요?</h5>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
			<br />

			<div class="widget wlightblue">
				<div class="widget-head">
					<div class="pull-left">NBA 팀은 몇개가 있고 어떻게 되나요?</div>
					<div class="widget-icons pull-right">
						<a href="#" class="wminimize"><i class="fa fa-chevron-down"></i></a>
						<a href="#" class="wclose"><i class="fa fa-times"></i></a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="widget-content">
					<div class="padd">
						<h5>
							NBA는 1946년에 11개의 팀으로 시작하였으며 그 이후 팀들이 늘어갔다. 현재 30개의 NBA 팀이<br />
							구성되어 있다. 30개 팀 중 29개 팀이 미국에서 만들어졌으며 나머지 1개 팀은 캐나다에 위치해 있다. <br />
							보스턴 셀틱스가 NBA에서 17번의 최다 챔피언을 기록한 바있다. 보스턴 셀틱스 다음의 성공적인 팀은<br />
							16번의 챔피언을 차지한 로스앤젤레스 레이커스이다. 세 번째로는 6번의 챔피언을 차지한 시카고 불스이다.<br />
							현재 NBA 리그 조직은 동부와 서부로 2개의 콘퍼런스로 분류되어 있고 각 콘퍼런스당 3개의 디비전으로 나뉘며 <br />
							각 디비전에 5개의 팀씩 구성 되어 있다. 따라서 30개의 모든 팀은 각각 지역 구분에 소속된다. <br />
							이러한 구분은 2004-2005년 시즌에 만들어졌다.
						</h5>
					</div>
					<div style="text-align: center; width: 100%;">	
						<img src="images/qnaTable/faq/001.jpg" />
					</div>
					<div class="pagination pull-right">** 골든 스테이트가 속한 디비전 **</div>
					<div class="table-responsive">
						<table class="table table-bordered ">
							<thead>
								<tr>
									<th style="text-align: center;">디비전</th>
									<th style="text-align: center;">구단명</th>
									<th style="text-align: center;">연고지</th>
									<th style="text-align: center;">경기장</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4" style="text-align: center;">서부 컨퍼런스</td>
								</tr>
								<tr>
									<td rowspan="5">퍼시픽</td>
									<td>골든스테이트 워리어스</td>
									<td>캘리포니아 주 오클랜드</td>
									<td>오라클 아레나</td>
								</tr>
								<tr>
									<td>로스앤젤레스 클리퍼스</td>
									<td rowspan="2">캘리포니아 주 로스앤젤레스</td>
									<td rowspan="2">스테이플스 센터</td>
								</tr>
								<tr>
									<td>로스앤젤레스 레이커스</td>
								</tr>
								<tr>
									<td>피닉스 선스</td>
									<td>애리조나 주 피닉스</td>
									<td>토킹 스틱 리조트 아레나</td>
								</tr>
								<tr>
									<td>새크라멘토 킹스</td>
									<td>캘리포니아 주 새크라멘토</td>
									<td>골든 1 센터</td>
								</tr>
							</tbody>
						</table>
					</div> 									
				</div>				
				<div class="widget-foot">
					<div class="pagination pull-right">
						<h5>NBA 팀은 몇개가 있고 어떻게 되나요?</h5>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
			<br />
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="footer"></div>
</div>


