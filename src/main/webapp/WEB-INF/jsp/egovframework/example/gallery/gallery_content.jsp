<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="js/jquery-confirm.min.js"></script> 
<link rel="stylesheet" type="text/css" href="css/jquery-confirm.min.css"/>
<script type="text/javascript">

$(document).ready(function() {		
	
});

function downFile(filename) {
		
	location.href = "download?dir=images/gallery&filename=" + filename;
}

var galleryCt = 
{
		editFn : function() {
			
			$("#frmGE").submit();
		},
		
		deleteFn : function() {
			
			var confirmJs = $.confirm({
				
				title : "확인창",
				content : "삭제버튼을 클릭하면 삭제가 됩니다! 삭제할까요?",
				buttons : {
					
					삭제 : {
						action : function() {
							
							$("#frmGD").submit();
						}
					},
					
					아니요 : {
						action : function() {
							
							confirmJs.close();						
						}
						
					}
				}
				
			});			
		}
}

</script>

<style type="text/css">
.th001 {
	text-align: center
}
.td001 {
	text-align: center
}
</style>

<c:if test="${sessionScope.id eq galleryContent.wname || sessionScope.id eq 'admin'}">
	<form action="galleryEdit.do" id="frmGE" name="frmGE">
		<input type="hidden" name="pageName" value="menu9" />												
		<input type="hidden" name="tableno" value="${param.tableno}">
		<input type="hidden" name="page" value='<c:out value="${param.page}"/>' />										
	</form>
	
	<form action="galleryDelete.do" id="frmGD" name="frmGD" >
		<input type="hidden" name="pageName" value="menu9" />												
		<input type="hidden" name="tableno" value="${param.tableno}">
		<input type="hidden" name="fname" value="<c:out value="${galleryContent.fname}"/>">	
		<input type="hidden" name="page" value='<c:out value="${param.page}"/>' />									
	</form>
</c:if>

<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/playerProfile/mainPlayerProfile.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>NBA Player들의 사진 및 GIF <br />파일을 볼 수 있습니다</h2>
						<p>- Gallery -</p>
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
                   	<h3 class="title">Gallery content</h3>					
               	</div>
               	<div class="content">
                    <div class="table-responsive table-full-width ">
	               	<table class="table table-hover table-bordered ">                       
	            		<tr>                     	
		                 	<th width="10%" class="th001">NO</th>
		             		<td width="10%" class="td001"><c:out value="${galleryContent.tableno}"/></td>
		             		<th width="15%" class="th001">DATE</th>
		             		<td width="15%" class="th001"><c:out value="${galleryContent.tabledate}"/></td>
		             		<th width="10%" class="th001">작성자</th>
		             		<td width="10%" class="th001"><c:out value="${galleryContent.wname}"/></td>
	            		</tr>
	            		<tr>  
	            			<th colspan="1" class="th001">TITLE</th>
	             			<td colspan="3" class="th001"><c:out value="${galleryContent.title}"/></td>
	             			<th class="th001">VIEW</th>
	             			<td class="th001"><c:out value="${galleryContent.viewcnt}"/></td>     		 
	            		</tr>
	            		<tr> 
	            			<td colspan="6" class="th001">
		            			<img alt="<c:out value="${galleryContent.title}"/>" src="images/gallery/<c:out value="${galleryContent.fname}"/>" style="width:80%;" />
							</td>
	            		</tr>
	            		<tr> 
	            			<td colspan="6" class="th001" height="100px;" style="vertical-align: middle;">
		            			<h5 class="text-success"><c:out value="${galleryContent.content}" escapeXml="false"/></h5>
							</td>
	            		</tr>	               		             		                                       	
	               	</table>
	           		</div>
	           		<br /><br />
           			<div class="clearfix"></div> 
	           		<form action="gallery.do" id="frmGC" name="frmGC">
						<input type="hidden" name="pageName" value="menu9" />	
						<input type="hidden" name="page" value='<c:out value="${param.page}"/>' />											
						<div class="text-center">
							<button class="btn btn-round btn-lg btn-fill">목록</button>
							<button type="button" class="btn btn-round btn-success btn-lg btn-fill" onclick="downFile('<c:out value="${galleryContent.fname}"/>')" >다운로드</button>
							<c:if test="${sessionScope.id eq galleryContent.wname || sessionScope.id eq 'admin'}">
								<button type="button" onclick="galleryCt.editFn()" class="btn btn-info btn-round btn-lg btn-fill">수정</button>
								<button type="button" onclick="galleryCt.deleteFn()" class="btn btn-danger btn-round btn-lg btn-fill">삭제</button>
							</c:if>
						</div>										
					</form>	                	
               	</div>							
			</div>			
			<div class="footer">							
			</div>					
		</div>	<!--  end card  -->
	</div> <!-- end col-md-12 -->
</div> <!-- end row -->