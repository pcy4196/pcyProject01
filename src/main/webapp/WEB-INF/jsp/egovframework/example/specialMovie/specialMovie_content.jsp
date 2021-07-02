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
<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/specialMovie/mainSpecialMovie.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>Golden State & NBA player들의 스페셜한 Play</h2>
						<p>- Special Movie 게시판 -</p>
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
           	   	<div class="table-responsive table-full-width">
	               	<table class="table table-hover">                       
	            		<tr>                     	
		                 	<th width="10%" class="th001">NO</th>
		             		<td width="10%" class="td001"><c:out value="${smvTable.tableno}"/></td>
		             		<th width="15%" class="th001">DATE</th>
		             		<td width="15%" class="th001"><c:out value="${smvTable.tabledate}"/></td>
		             		<th width="10%" class="th001">작성자</th>
		             		<td width="10%" class="th001">관리자</td>
	            		</tr>
	            		<tr>  
	            			<th colspan="1" class="th001">TITLE</th>
	             			<td colspan="3" class="th001"><c:out value="${smvTable.title}"/></td>
	             			<th class="th001">VIEW</th>
	             			<td class="th001"><c:out value="${smvTable.tableview}"/></td>     		 
	            		</tr>
	            		<tr> 
	            			<td colspan="6" height="750px;" class="th001">
		            			<iframe src="<c:out value="${smvTable.movie}"/>?rel=0&amp;showinfo=0?ecver=2&autoplay=1" 
								frameborder="1" style="width:80%;height:85%;" ></iframe>
							</td>
	            		</tr>
	            		<tr> 
	            			<td colspan="6" class="th001" style="vertical-align: middle;">
		            			<h5 class="text-success"><c:out value="${smvTable.content}"/></h5>
							</td>
	            		</tr>	               		             		                                       	
	               	</table>
	           	</div>
	           	<br /><br />	           	
				<div class="clearfix"></div>										
				<form action="specialMovie.do" id="frmSMC" name="frmSMC">
					<input type="hidden" name="pageName" value="menu8" />
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
					</div>
					<div class="clearfix"></div>
				</form>
			</div>			
			<div class="footer"></div>	
		</div>	<!--  end card  -->
	</div> <!-- end col-md-12 -->
</div> <!-- end row -->