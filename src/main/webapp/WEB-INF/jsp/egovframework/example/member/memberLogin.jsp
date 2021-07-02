<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row" style="margin-top: 10%;">
	<div class="col-md-6 col-sm-6 col-md-offset-3 col-sm-offset-3">
		<form method="post" action="memberLoginCheck.do">			
			<div class="card">
			<br /><br />
				<div class="header text-center">Login</div>
				<br /><br />
				<div class="content">
					<div class="form-group">
						<label class="col-sm-4 control-label text-center">ID</label>
						<div class="col-sm-8">
							<input type="text" placeholder="아이디" name="id" class="form-control">
						</div>
					</div>
					<br /><br />
					<div class="form-group">
						<label class="col-sm-4 control-label text-center">PW</label>
						<div class="col-sm-8">
							<input type="password" placeholder="비밀번호" name="passwd" class="form-control">
						</div>
					</div>				
				</div>
				<br /><br />
				<div class="footer text-center">
					<button type="submit" class="btn btn-fill btn-success btn-wd">로그인</button>
					<button type="reset" class="btn btn-fill btn-info btn-wd">다시 작성</button>
				</div>
				<br /><br />
			</div>
		</form>
	</div>
</div>


