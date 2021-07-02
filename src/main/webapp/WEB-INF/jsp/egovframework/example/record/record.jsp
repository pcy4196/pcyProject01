<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script type="text/javascript">
$(document).ready(function() {
	var table = $('#datatables').DataTable({
		"pagingType" : "full_numbers",
		"lengthMenu" : [ [ 5, 3, 10, -1 ],
						 [ 5, 3, 10, 'ALL' ] ],
		sort : false,
		responsive : true,
		language : {
			search : "_INPUT_",
			searchPlaceholder : "검색",
		}

	});
	
	
});
</script>
<div class="card">
	<div class="header">
		<h3 class="title">영광의 순간 OF 골든스테이트 워리어스</h3>
		<p class="category text-info" style="font-size: 20px;">우승의 순간들을 사진으로</p>
	</div>
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#theme-carousel" data-slide-to="0" class="active"></li>
				<li data-target="#theme-carousel" data-slide-to="1"></li>
				<li data-target="#theme-carousel" data-slide-to="2"></li>
				<li data-target="#theme-carousel" data-slide-to="3"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/record/carousel2.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>2016 - 2017 NBA CHAMPION</h2>
						<p>CHAMPION</p>
					</div>
				</div>
				<div class="item" align="center">
					<img src="images/record/carousel1.jpg" alt="carousel1"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>2016 - 2017 NBA CHAMPION</h2>
						<p>CHAMPION</p>
					</div>
				</div>
				<div class="item" align="center">
					<img src="images/record/carousel3.jpg" alt="carousel3"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px">
					<div class="carousel-caption">
						<h2>2016 - 2017 NBA CHAMPION</h2>
						<p>CHAMPION</p>
					</div>
				</div>
				<div class="item" align="center">
					<img src="images/record/carousel4.jpg" alt="carousel4"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px">
					<div class="carousel-caption">
						<h2>2016 - 2017 NBA CHAMPION</h2>
						<p>CHAMPION</p>
					</div>
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#theme-carousel" role="button"
				data-slide="prev"></a> <a class="right carousel-control"
				href="#theme-carousel" role="button" data-slide="next"></a>
		</div>
	</div>
</div>

<div class="card">	
	<div class="content">
	<div class="pull-right">  
		<div class="category text-info" style="font-size: 20px;">Column 선택해서 보기 [보고 싶은 Column Check]</div><br />		
	</div> 
	<div class="clearfix"></div> 		
	<div class="pull-right">  	
		<form id="frmRec" action="record01.do" class="form-horizontal">
            <input type="hidden" id="pageName"  name="pageName" value="record" />                
               		                
                <label class="checkbox checkbox-inline" style="font-size: 18px">
                    <input type="checkbox" name="pcy" data-toggle="checkbox" value="Season">Season
                </label>

                <label class="checkbox checkbox-inline" style="font-size: 18px">
                    <input type="checkbox" name="pcy" data-toggle="checkbox" value="Wins">Wins
                </label>

                <label class="checkbox checkbox-inline" style="font-size: 18px">
                    <input type="checkbox" name="pcy" data-toggle="checkbox" value="Losses">Losses
                </label>
                
                <label class="checkbox checkbox-inline" style="font-size: 18px">
                    <input type="checkbox" name="pcy" data-toggle="checkbox" value="Win">Win%
                </label>
                
                <label class="checkbox checkbox-inline" style="font-size: 18px">
                    <input type="checkbox" name="pcy" data-toggle="checkbox" value="Result">Result
                </label>
                            
                <label class="checkbox checkbox-inline">                    
                </label>                               
                <input type="submit" class="btn btn-primary btn-fill btn-lg" value="   VIEW   " />              
		</form>
	</div>
	<div class="clearfix"></div>
	</div> 
	<div class="footer">	
	</div>
	<div class="clearfix"></div>
</div>

<div class="card">
	<div class="header">
       	<h3 class="title">Season Record Of Golden State Warriors</h3>
       	<p class="category text-info" style="font-size: 20px;">최근 10년간 성적</p>          	
    </div>
	<div class="content">
		<div class="toolbar pull-right">
			<!--        Here you can write extra buttons/actions for the toolbar              -->
		</div>
		<div class="fresh-datatables">
			<table id="datatables" 
				class="table table-striped table-no-bordered table-hover"
				cellspacing="0" width="100%" style="width: 100%; font-size: 20px;">
				<thead>
					<tr>
						<th class="text-center" style="font-size: 20px;">Season</th>
						<th class="text-center" style="font-size: 20px;">Wins</th>
						<th class="text-center" style="font-size: 20px;">Losses</th>
						<th class="text-center" style="font-size: 20px;">Win%</th>						
						<th class="disabled-sorting text-center" style="font-size: 20px;">Result</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th class="disabled-sorting text-center" style="font-size: 20px;">시즌</th>
						<th class="disabled-sorting text-center" style="font-size: 20px;">승리</th>
						<th class="disabled-sorting text-center" style="font-size: 20px;">패배</th>
						<th class="disabled-sorting text-center" style="font-size: 20px;">승률</th>						
						<th class="disabled-sorting text-center" style="font-size: 20px;">결과</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${resultGSW}" var="resultGSW" varStatus="status">
	               		<tr>
	                   		<td class="disabled-sorting text-center" style="font-size: 20px;"><c:out value="${resultGSW.season-1} - ${resultGSW.season}"/></td>
	                   		<td class="disabled-sorting text-center" style="font-size: 20px;"><c:out value="${resultGSW.wins}"/></td>
	                   		<td class="disabled-sorting text-center" style="font-size: 20px;"><c:out value="${resultGSW.losses}"/></td>
	                   		<td class="disabled-sorting text-center" style="font-size: 20px;"><c:out value="${resultGSW.winss} % "/></td>
	                   		<td class="disabled-sorting text-center" style="font-size: 20px;"><c:out value="${resultGSW.result}"/>	                   		
	                   	</tr>                   		
                   	</c:forEach>                   										
				</tbody>
			</table>
		</div>
	</div><!-- end content-->
	<div class="footer"></div>
</div><!--  end card  -->



