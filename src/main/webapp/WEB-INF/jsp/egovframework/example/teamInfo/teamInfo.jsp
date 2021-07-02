<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script type="text/javascript">
function initialize() {
	var mapProp = {
		center : new google.maps.LatLng(37.750487, -122.203049),
		zoom : 15,
		scrollwheel : false,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("googleMap"),
			mapProp);

	var marker = new google.maps.Marker({
		position : new google.maps.LatLng(37.750487, -122.203049)
	});

	marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);

</script>
<form id="frm" name="frm"></form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h3 class="title">Team Information Of Golden State Warriors</h3>
					<p class="category text-info" style="font-size: 20px;">골든 스테이트
						워리어스에 대한 정보</p>
				</div>
				<div class="content">
					<div class="typo-line">
						<p>
							<span class="category">NAME</span>골든스테이트 워리어스(Golden State
							Warriors)
						</p>
					</div>
					<div class="typo-line">
						<p>
							<span class="category">LEAGUE</span>NBA
						</p>
					</div>
					<div class="typo-line">
						<p>
							<span class="category">CONFERENCE</span>WEST CONFERENCE
						</p>
					</div>
					<div class="typo-line">
						<p>
							<span class="category">DIVISION</span>퍼시픽 DIVISION
						</p>
					</div>
					<div class="typo-line">
						<p>
							<span class="category">창단</span>1946년
						</p>
					</div>
					<div class="typo-line">
						<p>
							<span class="category">연고지</span>캘리포니아 주 오클랜드
						</p>
					</div>
					<div class="typo-line">
						<p>
							<span class="category">경기장</span>오라클 아레나
						</p>
					</div>
					<div class="typo-line">
						<p>
							<span class="category">감독</span>스티브 커
						</p>
					</div>
					<div class="typo-line">
						<p>
							<span class="category">우승</span> 5 (1947, 1956, 1975, 2015, 2017)<br />
							[시즌의 뒷 해로 표기 -> 2006-07 시즌의 경우 2007로 표기]
						</p>
					</div>
				</div>
				<div class="footer"></div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h3 class="title" style="text-align: center;">TEAM LOGO</h3>
				</div>
				<div class="content" align="right">
					<img src="images/image1.png" class="img-responsive" width="90%"
						height="100%;" />
				</div>
				<div class="footer"></div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="card">
				<div class="header"></div>
				<div class="content">
					<div class="typo-line">
						<span class="category">역사</span>
						<p class="text-primary">팀 창단</p>
						워리어스는 1946년 BAA의 창립멤버로 필라델피아 워리어스로 창단한다. 소유주는 피터 타렐과 스티븐 킴이었는데 이들은
						미국 하키 리그 필라델피아 로키츠도 소유하고 있었다. 타렐은 감독이자 제너럴 매니저로 에디 고틀립을 선임했는데, 에디는
						필라델피아 지역에서 오랜기간 농구 프로모터로 활동했다. 에디는 필라델피아 초창기 프로팀에서 팀 이름을 가져왔다.
						워리어스는 워싱턴 레드스킨스와 클리블랜드 인디언스와 같이 미국의 아메리카 원주민의 이름을 따온 얼마 안되는 팀들 중
						하나이다. <br />
						<p class="text-primary">1946~1962 : 필라델피아 워리어스</p>
						1946-47시즌에 워리어스는 시카고 스탕스를 4승 1패로 물리치면서 우승한다.(BAA는 49년에 NBA가 된다.)
						고틀립은 1951년에 워리어스를 매입한다. 1955-56시즌에 워리어스는 포트웨인 피스톤스를 4승 1패로 이기면서 다시
						우승한다. 당시 워리어스의 스타선수는 훗날 명예의 전당 회원이 되는 폴 아리진, 톰 골라 그리고 네일 존스턴이었다.
						1959년에 워리어스는 드래프트에서 지명한 윌트 체임벌린과 입단계약을 체결한다. ‘장다리 월트’로 알려진 체임벌린은
						NBA 득점기록들을 갈아치우고 경기 방식을 바꾸면서 6번의 득점왕을 차지한다. 1962년 워리어스의 홈 경기로 열린
						펜실베이니아 주 허쉬에 있는 중립 경기장 경기에서 뉴욕 닉스를 상대로 한 경기 100득점을 기록했다.
						<p class="text-primary">1962~1971 : 샌프란시스코 워리어스</p>
						1962년 프랭클린 미울리는 팀의 지분 대부분을 매입하면서 프랜차이즈를 샌프란시스코 베이 에어리어로 이전하고 팀 이름도
						‘샌프란시스코 워리어스’로 변경한다. 1964-65 시즌에 워리어스는 윌트 챔벌레인을 필라델피아 세븐티식서스로
						트레이드시켰으며 그 대가로 코니 더킹, 리 샤퍼, 폴 노이먼 그리고 현금 15만 달러를 받았지만, 시즌 17승만을
						기록한다. 1965년 워리어스는 1라운드에서 릭 베리를 지명했는데, 베리는 신인왕이 되고 팀을 결승전으로 이끌었다.
						<p class="text-primary">2011 ~ 현재 : 리/커리/보거트 트리오</p>
						2012년 7월 11일 가드 재럿 잭이 삼각 트레이드를 통해 워리어스로 이적하는데, 이 과정에서 골든스테이트에서는 도렐
						라이트가 필라델피아 세븐티식서스로 이적한다. 2012년 8월 1일 뉴올리언스 호니츠와 1년 계약이 종료된 포워드 칼
						랜드리와 계약한다. 2012년 신인 드래프트에서 1라운드 전체 7위로 해리슨 반스를 지명한다. 페서스 에젤리는 전체
						30위, 드레이몬드 그린은 전체 35위로 지명한다.
					</div>
				</div>
				<div class="footer"></div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h3 class="title" style="text-align: center;">오라클 아레나</h3>
				</div>
				<div class="content" align="center">
					<img src="images/image1.jpg" class="img-responsive" width="90%" style="border: 3px solid gold; border-radius: 7px;" />
				</div>
				<div class="footer"></div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h3 class="title" style="text-align: center;">LOCATION</h3>
				</div>
				<div class="content" align="center">
					<div id="googleMap" style="height: 400px; width: 100%;"></div>
				</div>
				<div class="footer"></div>
			</div>
		</div>
	</div>
</div>