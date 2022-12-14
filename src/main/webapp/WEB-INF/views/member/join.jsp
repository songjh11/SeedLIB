<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/member/agree.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/icheck-material@1.0.0/icheck-material.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<!--  달력 -->
 <link rel="shortcut icon" href="/images/favicon.png">
    <title>회원가입 : 씨앗도서관 ☘</title>
</head>
<body>
 
    <div class="loginForm">
        <form id="form" name="form" action="./join" method="post"> 
    
            <fieldset>
                <legend>로그인</legend>
                <div class="langSelect"></div>
                <p class="logo"><img src="/images/logo200.png" alt="씨앗도서관"></p>
                <div class="join2">
                    <div class="inputIdPw">
                        <p class="inputId"><label for="input_ID">아이디(<span>*</span>)<span class="accessibility">필수항목</span></label>
                        <input id="input_ID" name="userName" title="아이디 (영문 소문자,숫자 5~15자 이내)" type="text" required="required" minlength="5" maxlength="15" placeholder="5~15자(영문(소대문자), 숫자로 조합)">
                        <div id="userNameResult"> </div>
<!--                           
                          <span class="error" id="error_web_id" style="display: none;">ID중복확인 실시하지 않았습니다.</span>
                        <span class="error" id="error_web_id2" style="display: none;">이미 존재하는 아이디입니다.</span> -->
                        
                        </p>
                        <p class="inputPw"><label for="password">비밀번호(<span>*</span>)<span class="accessibility">필수항목</span></label>
                        <input name="password" title="비밀번호 (영문,숫자,특수문자 중 2종류 이상 조합 10~15자 이내)" id="password" type="password" minlength="4" maxlength="8" placeholder="4~8자(영문,숫자, 특수문자 중 2종류 이상 조합)" required="required"></p>
                        <p class="inputPwRe"><label for="passwordChk">비밀번호확인(<span>*</span>)<span class="accessibility">필수항목</span></label>
                        <input name="passwordChk" title="비밀번호확인" id="passwordChk" type="password" maxlength="8" required="required"></p>
                        <div id="passwordChkResult"> </div>

                        
                    </div>
                    <div class="inputProfile">
                        <div>
                            <p class="name"><label for="user_name">이름</label>
                               <input type="text" name="name" id="user_name"  class="textInput" required="required"></p>
                            
                            <p class="birth"><label for="birthd_year">생년월일</label>
                               <input type="date" name="birth" id="birthd_year" maxlength="2022"></p>
                          
                            <p class="gender"><label for="gen">성별</label>
					
						    <span class="icheck-material-teal">
							<label for="teal1">  남자</label>
							 <input type="radio" id="teal1" name="gender" title="남" value="남">
					
							</span>
							<span class="icheck-material-teal">
							 <label for="teal2">여자</label>
							   <input type="radio" id="teal2" name="gender" title="여" value="여">
						
							</span>                                   
                              <p>


                                <label for="phone">휴대폰번호(<span>*</span>)<span class="accessibility">필수항목</span></label>
                                <select name="phone1" title="휴대폰번호 국번 선택" id="phone1">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                    <option value="000">-없음-</option>
                                </select>
                                
                                    <input id="mobile_no_2" name="phone2" class="phone" title="휴대폰번호 앞자리" onkeyup="fnCheckkNum('mobile_no_2');" type="text" maxlength="4" placeholder="앞-4자리" required="required">
                                
                                
                                    <input id="mobile_no_3" name="phone3" class="phone" title="휴대폰번호 뒷자리" onkeyup="fnCheckkNum('mobile_no_3');"  type="text"  maxlength="4" placeholder="뒤-4자리" required="required">
                                
                                <input type="hidden" name="phone" value= phone1+"-"phone2"> 
                                
                                
                            </p>
                        </div>
                        	
                        <div class="form">
                            <p><label for="email">이메일 주소</label>
                                    
                                    <input type="text" id="email1" name="email"  title="이메일 입력" class="form-ele auto eng-mode" required="required" >
                                    <span class="mobileShow3">@</span>
                                    <input type="text"  readonly id="email2" name="email" title="이메일 도메인 입력"  >
                            
                                    <select name="domainList" id="domainList" title="이메일 도메인 선택" class="form-ele">
                                        
                                            <option value="daum.net">daum.net</option>
                                        
                                            <option value="dreamwiz.com">dreamwiz.com</option>
                                        
                                            <option value="gmail.com">gmail.com</option>
                                        
                                            <option value="hanmail.net">hanmail.net</option>
                                        
                                            <option value="hotmail.com">hotmail.com</option>
                                        
                                            <option value="korea.com">korea.com</option>
                                        
                                            <option value="lycos.co.kr">lycos.co.kr</option>
                                        
                                            <option value="msn.com">msn.com</option>
                                        
                                            <option value="nate.com">nate.com</option>
                                        
                                            <option value="naver.com" selected="selected">naver.com</option>
                                        
                                            <option value="yahoo.co.kr">yahoo.co.kr</option>
                                        
                                        <option value="etc">직접입력</option>
                                    </select>
                            </p>
                        </div>
                        <p class="info" style="padding:0 10px;">* 이메일 주소는 회원정보 재동의(2년 주기) 알림에 이용됩니다.</p><br>
                        <div>
                            
                            
                            <p><label for="addrs">기본주소(<span>*</span>)<span class="accessibility">필수항목</span></label>
                               
                               <input type="text" id="postcode" name="post" placeholder="우편번호" style="width: 180px;">
                             <input type="button" class="loginBtn1" id="idCheckBtn" value="우편번호검색" target="epost" onclick="joinPostcode()" title="우편번호검색 새창으로열림" style="width: 120px;">
                             
      					     <input type="text" id="address" name="address1" placeholder="기본주소(*)" title="기본주소" onclick="fn_useAddrSrch();" class="textInput" value="">                                
                             </p>
             
                            <p class="addressInput"><label for="addrs_detail">상세주소(<span>*</span>)<span class="accessibility">필수항목</span></label>
                           <input type="text" id="detailAddess" name="address2" placeholder="상세주소(*)" title="상세주소" class="textInput textInput2" value="" required="required">                      
                                
                                 </p>
                       
                        </div>
                    </div>
                    <div class="additionalService">
                        <div class="receiveAgree">
                            <p>문자 수신동의 <label class="check" id="sms_label"><input type="checkbox" id="sms_input" name="sms_yn" title="문자 수신동의" checked="checked" required="required"></label></p>
                            <p>이메일 수신동의 <label class="check" id="mail_label"><input type="checkbox" id="mail_input" name="mail_yn" title="이메일 수신동의" checked="checked" required="required"></label></p>
                        </div>
                        <p class="detail">씨앗도서관의 소식지 및 유용한 정보를 발송시 받아볼 수 있습니다.</p>
                        <p class="detail"><span>기본서비스(대출/반납. 예약, 연체알림등)와 관련된안내는 수신동의 여부와 관계없이 발송됩니다.</span></p>
                    </div>
                    <p class="joinBtn"><input type="submit" title="가입하기" value="가입하기" id="joinB"></p>
                </div>
            </fieldset>

            
        </form>
    </div>
 <script src="/js/address.js"></script>
  <script src="/js/join.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



</body>
</html>