<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
function checkIdDuPl() {
	if($("#idCheckValue").val() == 'N') {
		alert("아이디 중복 검사를 하세요");
		return false;
	} 
}

$(document).ready(function() {	

	$('#memberFrm').validate();
	  
	$("#memberIdcheck").click(function() {
		
		if($("#id").val() == '') {
			alert("아이디를 입력하세요!");
			return false;
		} 
		
		$.ajax({
			url 	: 	"memberIdCheck.do",
			type 	: 	"POST",
			data 	: 	{"id" : $("#id").val() },
			async	: 	false,
			success	:	function(result) {
				
				if(result == 'NO') {
					
					$("#idCheckRsult").html("사용이 불가합니다");
					$("#idCheckValue").val('N');
				} else {
					
					$("#idCheckRsult").html("사용이 가능합니다");
					$("#idCheckValue").val('Y');
				}
			},
			error:function() {
	
				alert("아이디 체크 확인시 Error 발생");
			}
		})
		
	})

});
</script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
 
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
 
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>



<div class="card">
	<div class="content">
		<div id="theme-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active" align="center">
					<img src="images/member/memberCreate/carousel.jpg" alt="carousel2"
						style="width: 95%; margin-top: 5px; margin-bottom: 5px" />
					<div class="carousel-caption">
						<h2>아래에 항목을 추가해서 회원가입을 해주시길 바랍니다</h2>
						<p>회원가입</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card">
 <form id="memberFrm" class="form-horizontal" action="memberCreate.do" method="post" onsubmit="return checkIdDuPl()" >
 	<input type="hidden" id="idCheckValue" name="idCheckValue" value="N" />
    <div class="content">
         <legend>회원가입</legend>	
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">ID</label>
                 <div class="col-sm-4">
                     <input class="form-control" type="text" id="id" name="id" required="required" />
                 </div>
                 <div class="col-sm-1">                 		
                 	<button type="button" id="memberIdcheck" class="btn btn-danger btn-md btn-fill">중복 확인</button>                 	
                 </div>
                 <div class="col-sm-3">                 		
                 	<code><span id="idCheckRsult"></span></code>
                 </div>
                 <div class="col-sm-2"><code>아이디</code></div>
             </div>
         </fieldset>
         
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">NAME</label>
                 <div class="col-sm-4">
                     <input class="form-control" type="text" name="name" required="required" />
                 </div>
                 <div class="col-sm-4">
                     
                 </div>
                 <div class="col-sm-2"><code>이름</code></div>
             </div>
         </fieldset>        
         
         <fieldset>
             <div class="form-group">
                 <label class="col-sm-2 control-label">PASSWORD</label>
                 
               	 <%-- <textarea rows="5" cols="100%" name="content">${qnaList.content}</textarea> --%>
                <div class="col-sm-4">
                	<input class="form-control" id="passwd001" type="password" name="passwd" required="required" />
                </div>
                <div class="col-sm-4">
                	<input class="form-control" equalTo="#passwd001" type="password" name="passwd002" required="required" placeholder="비밀번호 확인"/>
                </div>
             
                 <div class="col-sm-2"><code>비밀번호</code></div>
             </div>
         </fieldset>  
         
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">PHONENUMBER</label>
                 <div class="col-sm-4">
                     <input class="form-control" type="text" name="phonenumber" required="required" />
                 </div>
                 <div class="col-sm-4">
                     
                 </div>
                 <div class="col-sm-2"><code>전화번호</code></div>
             </div>
         </fieldset>  
         
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">ZIPCODE</label>
                 <div class="col-sm-4">
                     <input class="form-control" type="text" id="zipcode" name="zipcode" required="required" />
                 </div>
                 <div class="col-sm-4">
                     <button type="button" class="btn btn-md btn-fill" onclick="execDaumPostcode()">우편번호 검색</button>
                 </div>
                 <div class="col-sm-2"><code>우편번호</code></div>
             </div>
         </fieldset>
         
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">ADDRESS1</label>
                 <div class="col-sm-8">
                     <input class="form-control" type="text" id="address1" name="address1" required="required" />
                 </div>                 
                 <div class="col-sm-2"><code>주소</code></div>
             </div>
         </fieldset> 
         
         <fieldset>
             <div class="form-group" >
                 <label class="col-sm-2 control-label">ADDRESS2</label>
                 <div class="col-sm-8">
                     <input class="form-control" type="text" id="address2" name="address2" required="required" />
                 </div>                 
                 <div class="col-sm-2"><code>상세주소</code></div>
             </div>
         </fieldset>  
     </div>
     <div class="footer text-center">
         <button type="submit" class="btn btn-info btn-fill btn-lg">회원가입</button>
         <button type="reset" class="btn btn-default btn-fill btn-lg">다시작성</button>
         <button type="button" class="btn btn-danger btn-fill btn-lg" onclick="history.back();">취소</button>
     </div>
 </form>
</div>

