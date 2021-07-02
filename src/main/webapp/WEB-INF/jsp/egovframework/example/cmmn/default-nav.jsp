<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
var nav = 
{
	pageSubmitFn : function(pageName) {
		
		$("#frmNav").attr("method", "post");

		$("#frmNav").attr("action", pageName+".do");	
		
		$("#frmNav").submit();
	}
}

	

$(document).ready(function(){	
	
	<c:if test="${param.msg != null && param.msg != ''}">
		alert("${param.msg}"); // 회원 관련 인사말
	</c:if>	
		
	<c:if test="${sessionScope.msgLog != null && sessionScope.msgLog != ''}">
		alert("${sessionScope.msgLog}"); // 로그인 해제 관련 알림
		<c:remove var="msgLog" scope="session" />
	</c:if>	
});
</script>

<form id="frmNav" name="frmNav">
	
</form>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-minimize">
			<button id="minimizeSidebar"
				class="btn btn-warning btn-fill btn-round btn-icon">
				<i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i> <i
					class="fa fa-navicon visible-on-sidebar-mini"></i>
			</button>
		</div>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.do">GOLDEN STATE WARRIORS KOREA FAN PAGE</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
			<c:choose>
			<c:when test="${sessionScope.id eq null}" >
				<li>
					<button class="btn btn-success btn-md btn-fill"
					onclick="javascript:nav.pageSubmitFn('memberLogin')">로그인</button>					
				</li>
				<li>
					<button class="btn btn-info btn-md btn-fill"
					onclick="javascript:nav.pageSubmitFn('member')">회원가입</button>					
				</li>
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
					 <i class="fa fa-spin fa-spinner"></i>						
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li>
					<button class="btn btn-success btn-wd btn-fill">			
					<c:out value="${sessionScope.id}"/> 님 반갑습니다!</button>									
				<li>
					<button class="btn btn-info btn-md btn-fill"
					onclick="javascript:nav.pageSubmitFn('memberLogout')">로그 아웃</button>					
				</li>
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 					 						
					</a>
				</li>
			</c:otherwise>
			</c:choose>								
			</ul>
		</div>
	</div>
</nav>