<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row">
    <div class="col-md-8">
        <div class="card">
            <div class="header">
                <h4 class="title">ADMINISTRATOR PROFILE</h4>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>회원아이디</label>
                            <input type="text" class="form-control" placeholder="Username" readonly value="admin" />
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="exampleInputEmail1">이메일 주소</label>
                            <input type="email" class="form-control" placeholder="Email" readonly value="pcy4196@naver.com" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control" placeholder="Company" readonly value="박찬유" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" class="form-control" placeholder="Last Name" readonly value="JAVALC" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>제작 이유</label>
                            <input type="text" class="form-control" placeholder="Reason" readonly value="골든스테이트를 전문적으로 좋아하고 싶어서..." />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>주소</label>
                            <input type="text" class="form-control" placeholder="address" readonly value="서울특별시 은평구 통일로67길 15" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>상세주소</label>
                            <input type="text" class="form-control" placeholder="detail address" readonly value="제이타워4 904호" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>우편번호</label>
                            <input type="number" class="form-control" placeholder="ZIP Code" readonly value="03396" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>About Me</label>
                            <textarea rows="5" class="form-control" placeholder="Here can be your description" style="text-align: left;">모든 NBA 팬분들이 골든스테이트를 좋아할때까지 계속 제작하고 NBA를 다들 좋아하게 만들겠습니다!!
                            </textarea>                            
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card card-user">
            <div class="image">
                <img src="images/bootstrap/background-image-1.jpg" alt="..."/>
            </div>
            <div class="content">
                <div class="author">
                     <a href="#">
                    <img class="avatar border-gray" src="images/bootstrap/default-logo.PNG" alt="..."/>
                      <h3 class="title">워리워스 FAN PAGE<br />
                         <small>새로운 역사를 만들어가는 NBA TEAM</small>
                      </h3>
                    </a>
                </div>
                <p class="description text-center" style="font-size: 20px;"> 
                	"절대 포기하면 안된다" <br>
                    3년 연속 우승을 <br />
                                        거두는 그 순간까지 <br />
                    FAN PAGE는 계속 유지 될 것입니다!<br />
                                       내년에도 우승하기를 기도합니다! <br />
                </p>
            </div>
            <hr>            
        </div>
    </div>
</div>