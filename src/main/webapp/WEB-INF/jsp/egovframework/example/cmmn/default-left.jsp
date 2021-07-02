<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

var left = 
{		
	findMainMenuFn : function() {
		
		ajaxCl.ajaxCallFn({url: "mainMenuList.do", FCGubun : "F"});
	},
		
	pageSubmitFn : function(pageName, action) {		
		
		if (pageName == 'menu8' || pageName == 'menu9' || pageName == 'menu10') {
			
			$("#pageNameS").val(pageName);
			
			$("#frmS").attr("action", action);		
			$("#frmS").submit();
			
			
		} else {
			
			$("#pageName").val(pageName);
			
			$("#frm").attr("action", action);		
			$("#frm").submit();
		}		
	}
}

var ajaxCl = 
{
	ajaxCallFn : function(options) {
		
		var that = this;
		
		var settings = {

			url : "mainMenuList.do",
			FCGubun : "F"
		}

		settings = $.extend({}, settings, options);

		$.ajax({

			type:"POST",
			url:settings.url,
			async: false,
			beforesend:function(xhr) {

			},
			success:function(result) {

				var jsonRes = JSON.parse(result);
				
				$.each(jsonRes, function(i, item) {
					
					if (item.collapseYn == 'Y') {
						
						strSubMenu = that.ajaxSubCallFn({url: "subMenuList.do", FCGubun : "C", menuId : item.menuId});
						
						var strMenu = "";
						
						strMenu += "<li>"
		                			+ "<a data-toggle='collapse' href='#" + item.menuUrl + "' aria-expanded='true' id='menu" + item.menuId + "'>"               
	                    				+ "<i class='" + item.menuClass + "'></i>"
	                    				+ "<p>" + item.menuNm + "<b class='caret'></b></p>"
	                				+ "</a>"
	                				+ "<div class='collapse in' id='" + item.menuUrl + "'>"
	                    				+ "<ul class='nav'>"
	                        				+ strSubMenu
	                    				+ "</ul>"
	                				+ "</div>"
	            				+ "</li>";
						
						$("#targetMenu").append(strMenu);
						
					} else {
						
						var strMenu = "";

						strMenu += "<li prop='menu' class='active' id='menu" + item.menuId + "'>"
		                			+ "<a href='#' onclick='javascript:left.pageSubmitFn(\"menu" + item.menuId + "\" , \"" +item.menuUrl+ "\")'>"
	                    				+"<i class='" + item.menuClass + "'></i>"
	                    				+ "<p>" + item.menuNm + "</p>"
	               					+ "</a>"
	            				+ "</li>";
	            		
						$("#targetMenu").append(strMenu);
					}
					
				});

			},
			error:function() {

				alert("main menu 조회시 Error 발생");
			}

		});		
	},
	
	ajaxSubCallFn : function(options) {
				
		var settings = {

			url : "subMenuList.do",
			FCGubun : "F",
			menuId : ""
		}

		settings = $.extend({}, settings, options);

		var subMenu = "";
		
		$.ajax({

			type	:	"POST",
			url		:	settings.url,
			data 	: 	{"menuId" : settings.menuId},
			async	: 	false,
			beforesend:function(xhr) {

			},
			success:function(result) {

				var jsonRes = JSON.parse(result);
				
				$.each(jsonRes, function(i, item) {
					
					subMenu += "<li prop='menu' class='active' id='submenu" + item.menuId + "'>"
                				+ "<a href='#' onclick='javascript:left.pageSubmitFn(\"submenu" + item.menuId + "\", \"" +item.menuUrl + "\")'>"
                					+ item.menuNm
                				+ "</a>"
                    		+ "</li>";
				});								
			},
			error:function() {

				alert("sub menu 조회시 Error 발생");
			}

		});	
		
		return subMenu;
		
	},
}

$(document).ready(function(){	
	
	left.findMainMenuFn(); // DB화된 메뉴를 불러온다

	var pageName = "<c:out value="${param.pageName}"/>";
	
	$("[prop=menu]").removeClass("active");	
	$("#"+pageName).addClass("active");		
});
</script>

<form id="frm" name="frm">
	<input type="hidden" id="pageName"  name="pageName" />		
</form>

<form id="frmS" name="frmS">
	<input type="hidden" id="pageNameS"  name="pageName" />
	<input type="hidden" id="pageS"  name="page" value="1" />			
</form>


<div class="sidebar" data-color="blue" data-image="images/bootstrap/background-image-1.jpg">
	<div class="logo">
        <a href="http://www.warriorsworld.net/" class="logo-text" target="_blank">
            Warriors HomePage
        </a>
    </div>
	<div class="logo logo-mini">
		<a href="http://www.warriorsworld.net/" class="logo-text">
			Wh
		</a>
	</div>
    <div class="sidebar-wrapper">
        <div class="user">
            <div class="photo">
                <img src="images/bootstrap/default-logo.PNG" />
            </div>
            <div class="info">
                <a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
                    ADMINISTRATOR
                    <b class="caret"></b>
                </a>
                <div id="collapseExample" class="collapse in">
                    <ul class="nav">
                        <li prop="menu" class="active" id="adProfile">
                        	<a href="#" onclick="javascript:left.pageSubmitFn('adProfile', 'adProfile.do')">Profile</a>
                        </li>
                        <c:if test="${sessionScope.id eq 'admin'}">
	                        <li prop="menu" class="active" id="memberList">
	                        	<a href="#" onclick="javascript:left.pageSubmitFn('memberList', 'memberList.do')">Member List</a>
	                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <c:choose>
				<c:when test="${sessionScope.id != null && sessionScope.id != 'admin'}" >
		            <div class="info">
		                <a data-toggle="collapse" href="#collapseExample00" aria-expanded="true">
		                    Member Information
		                    <b class="caret"></b>
		                </a>
		                <div id="collapseExample00" class="collapse in">
		                    <ul class="nav">
		                        <li prop="menu" class="active" id="member_myInfo">
		                        	<a href="#" onclick="javascript:left.pageSubmitFn('member_myInfo', 'member_myInfo.do')">My info</a>
		                        </li>
		                        <li prop="menu" class="active" id="member_deleteCheck">
		                        	<a href="#" onclick="javascript:left.pageSubmitFn('member_deleteCheck', 'member_deleteCheck.do')">Member Delete</a>
		                        </li>
		                    </ul>
		                </div>
		            </div>
	            </c:when>
            </c:choose>
        </div>
        <ul class="nav" id="targetMenu">
            <!-- <li>
                <a data-toggle="collapse" href="#componentsExamples"  aria-expanded="false">
                    <i class="pe-7s-plugin"></i>
                    <p>5주차 에요~
                       	<b class="caret"></b>
                    </p>
                </a>
                <div class="collapse" id="componentsExamples">
                    <ul class="nav">
                        <li prop="menu" class="active" id="welcomeWebMap">
                        	<a href="#" onclick="javascript:left.pageSubmitFn('welcomeWebMap')">시작해봅시다.</a>
                        </li>
                    </ul>
                </div>
            </li> -->
        </ul>        
	</div>	
</div>
