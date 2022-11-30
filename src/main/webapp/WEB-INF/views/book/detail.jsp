<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <!-- 프린트신청 팝업창 -->
   	<link rel="stylesheet" href="/css/admin/modal.css">
	<link rel="stylesheet" href="/css/admin/adcommon.css">
	<link rel="stylesheet" href="/css/admin/modalutil.css">
    
    <script type="text/javascript" defer src="/js/common.js"></script>
    <script type="text/javascript" defer src="/js/bookDetail.js"></script>
    <script type="text/javascript" defer src="/js/bookLike.js"></script>
    
	<title>통합검색 : 씨앗도서관 ☘️ </title>
	<c:import url="../temp/header.jsp"></c:import>
</head>


<body>
	<div class = "vsc-initialized">
		<div class="container" class="sub">
			<div class="sVisualWrap">
				<div class="sVisual">
					<h3>통합검색</h3>
				</div>
			</div>
			
			<div id="contentGroup">
				<!-- 사이드바 -->
		       <c:import url="../sideBar/AsideBar.jsp"></c:import>
				
				<!-- 메인 내용 -->
				<div id="contentcore">
					<!-- 상단 메뉴 -->
					<div class="naviandtitle">
						<h3>통합검색</h3>
						
						<div class="navi">
							<a href="/" title="홈으로 이동" class="home"><span class="blind">홈</span></a>
							<i class="arrow"></i> 자료검색
							<i class="arrow"></i>소장자료검색
							<i class="arrow"></i>통합검색
						</div>
						
						<div class="snsFarm">
							<ul class="snsBtnArea clearfix">
								<li>
									<a href="#snsGroup" id="sns" title="SNS 공유하기(확장됨)" class="snsShare"><span class="blind">SNS 공유하기</span></a>
									<div id="snsGroup" class="snsList clearfix" style="display: block; right: 45px; opacity: 1;">
										<a href="#sns1" id="sns1" title="단축URL 복사하기" class="snsUrl" onclick="fnShorturlCopy();" data-clipboard-text="https://me2.do/FNlmGWJe">
											<span class="blind">단축URL</span>
										</a>
										<a href="#sns3" id="sns3" onclick="javascript:fnShareKakaoStory(''); return false;" title="카카오스토리에 공유하기 새창열림" class="snsStory">
											<span class="blind">카카오스토리</span>
										</a>
										<a href="#sns4" id="sns4" onclick="javascript:fnShareTwitter(''); return false;" title="트위터에 공유하기 새창열림" class="snsTwitter">
											<span class="blind">트위터</span>
										</a>
										<a href="#sns5" id="sns5" onclick="javascript:fnShareFaceBook(''); return false;" title="페이스북에 공유하기 새창열림" class="snsFacebook">
											<span class="blind">페이스북</span>
										</a>
									</div>
								</li>
								<li class="mobileHide"><a href="../print/boCart?isbn=" id="pprint" title="인쇄" class="snsPrint" onclick="javascript:fnPrintPopup('seed'); return false;"><span class="blind">현재화면 프린트</span></a></li>
							</ul>
						</div>
					</div> <!-- 상단 메뉴 끝 -->
					
					<!-- 메인 바디 -->
					<div id="contents" class="contentArea">
						<!-- Forced tab Show -->
						<div class="ttabWrap">
							<div class="virtSelect">
								<a href="#script">탭메뉴</a>
							</div>
							<ul id="ttab3" class="tnb clearfix">
								<li class="ttabLast"></li>
							</ul>
						</div>
						<div class="popblackBG" style="display:none;"></div>
						
						<!-- 책 디테일 -->
						<div class="bookDetailInformation">
						
						
							<div class="bookInforWrap cate_volume">
								<!-- 상단 책 정보 -->
								<div class="bookDataDiv">
								<c:forEach var="book" items="${vo}">
									<div class="bookImg">
										<img alt="" src="${book.image}">
									</div>

									<div class="book_name">${book.title}</div>
									
									
									<a href="#link" class="btn_optionView">
										<span class="blind">책정보 더보기</span>
									</a>
									<div class="snsFarm">
										<ul class="snsBtnArea clearfix">
											<li class="mobileHide">
												<!-- 복사 버튼 -->
												<a href="#" id="pprint" title="인쇄" class="snsPrint"><span>도서 프린트</span></a>								
											</li>
										</ul>
									</div>

									<!-- 간략보기 -->
									<div class="simpleView viewTab open">
										<div class="book_publisher">
											<span class="bk_writer">${book.writer}</span>
											<span class="bk_publish">${book.publisher}</span>
											<span class="bk_date">${book.bookDate}</span>
										</div>
										
										<div class="book_publisher">
											<span class="bk_writer">ISBN : ${book.isbn}</span>
										</div>
								
										<div class="thisBookCategory">
											<dl>
												<dt>한국십진분류</dt>
												<dd>
													<span>
														<a href="#search" onclick="fnSearchKdc('l600');">
															<c:choose>
																<c:when test="${book.category eq 1}">철학</c:when>
																<c:when test="${book.category eq 2}">종교</c:when>
																<c:when test="${book.category eq 3}">사회과학</c:when>
																<c:when test="${book.category eq 4}">자연과학</c:when>
																<c:when test="${book.category eq 5}">기술과학</c:when>
																<c:when test="${book.category eq 6}">예술</c:when>
																<c:when test="${book.category eq 7}">언어(어학)</c:when>
																<c:when test="${book.category eq 8}">문학</c:when>
																<c:when test="${book.category eq 9}">역사</c:when>
															</c:choose>
														</a>
													</span>
												</dd>
											</dl>
										</div>
										
										<div class="book_publisher">
											<span class="bk_writer">대출 횟수 : ${book.bookCount}</span>
											<span class="bk_publish">추천 순위 : ${book.num}</span>
										</div>
										
										<div class="keyword">
											<c:if test="not empty member">
											</c:if>
												<form>
													<input type="hidden" id="isbn" value="${book.isbn}">
													<input type="hidden" id="userName" value="bb">
												</form>
													
												<span id="addShelf"><a href="../shelf/addBook?isbn=${book.isbn}&userName=bb">책꽂이 담기</a></span>
												
												<c:if test="${isLikeExist eq false}">
													<button type="button" id="likeBtn">좋아요</button>
												</c:if>
												<c:if test="${isLikeExist}">
													<button type="button" id="unlikeBtn">좋아요 취소</button>
												</c:if>
											<span>💚 ${like}</span>
										</div>
									</div>
									<!-- // 간략보기 -->
								</c:forEach>
								</div>
								
								<!-- 하단 책 상세정보 -->
								<div class="tabMove">
									<ul class="cateTab col-4 clearfix">
										<li class="choiced"><a href="#tabGo1">소장정보</a></li>
										<li><a href="#tabGo2">책소개</a></li>
										<li><a href="#shelfBrowsing">같은 장르 도서</a></li>
										<li><a href="#tagCloude">같은 작가 도서</a></li>
									</ul>
								</div>
								
								<!-- 소장 정보 -->
								<div class="dropBookData" id="tabGo1">
									<div class="dropBookData" id="tabGo1">
										<h5 class="htitle">소장정보</h5>
										<div class="dropContainerBox">
											<div class="whereLibrary webViewOnly">
												<div class="thisBook-libraryselecter">
													<p>
														<input type="checkbox" id="collectionLibraryAll" name="collectionLibraryAll" value="collectionLibraryAll" class="check" checked="checked">
														<label for="collectionLibraryAll">전체 도서관</label>
													</p>
													<!--아래 span 클릭시 클릭한 span 과 같은 이름의 도서관 table list 삭제-->
													<c:forEach var="book" items="${vo}">
													<c:forEach var="lib" items="${book.libVOs}">
														<a href="#chk" class="MA" data-name="MA">${lib.libName}</a>
													</c:forEach></c:forEach>
													<button type="button" class="listDropdown"><span>리스트 보기</span></button>
												</div>
												<div class="thisBook-libraryList">
													<div class="tblWrap tblScroller scrollTable">
														<table class="tbl">
															<caption>이 책의 정보 및 소장 도서관 정보</caption>
															<colgroup>
																<col>
																<col>
																<col>
																<col>
																<col>
																<col>
																<col>
																<col>
															</colgroup>
															<thead>
																<tr>
																	<th scope="col">도서관</th>
																	<th scope="col">대출상태</th>
																	<th scope="col">반납 예정일</th>
																	<th scope="col">대출 및 예약</th>
																	<th scope="col">부록</th>
																</tr>
															</thead>
															<tbody>
																
																<c:forEach var="book" items="${vo}">
																<c:forEach var="lib" items="${book.libVOs}">
																<c:forEach var="bl" items="${book.bookLibVOs}">
																	<c:set var="where" value="${lib.libNum}"/>
																	<c:set var="quan" value="${bl.quantity}" />
																	<c:set var="able" value="${bl.able}" />
																	
																	<tr class="MA">
																		<td>${lib.libName}</td>
																		
																		<!-- 씨앗 도서관일 때 : 대출 가능 / 대출 불가능 - 예약
																			타 도서관일 때 : 상호대차 가능 / 대출 불가능-->
																		<td>
																			<c:choose>
																				<c:when test="${able eq 1}">
																					대출 가능
																					<h6>(대출 가능 권수 : ${quan})</h6>
																				</c:when>
																				<c:when test="${able eq 0}">
																					대출 불가능
																				</c:when>
																			</c:choose>
																		</td>
																		
																		<td>반납 예정일</td>
																		
																		<td>
																			<c:choose>
																				<c:when test="${where == 0}">
																					<c:choose>
																						<c:when test="${able eq 1}">
																							<a href="javascript:;" class="btn white small">대출하기</a>
																						</c:when>
																						<c:when test="${able == 0}">
																							<a href="javascript:;" class="btn white small">대출예약</a>
																						</c:when>
																					</c:choose>
																				</c:when>
																				
																				<c:when test="${where != 0}">
																					<c:choose>
																						<c:when test="${able eq 1}">
																							<a href="javascript:;" class="btn white small">상호대차</a>
																						</c:when>
																					</c:choose>
																				</c:when>
																			</c:choose>
																		</td>
																		
																		<td>부록 없음</td>
																	</tr>
																</c:forEach>
																</c:forEach>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div> <!-- 소장 정보 상세 내용 -->
								
								<!-- 책 소개 -->
								<div class="dropBookData" id="tabGo2">
									<h5 class="htitle">책소개
										<span>도서정보 상세보기 클릭 ☞
											<a href="https://search.shopping.naver.com/book/catalog/32439434396" target="_blank">
												<img src="/images/link_n.png" alt="네이버">
											</a>
										제공</span>
									</h5>
									<div class="dropContainerBox">
										<div class="bookInformation">
											내용
										</div>
										<button type="button" class="mobMoreView"><span>더보기</span></button>
									</div>
								</div>
								
								<!-- 같은 장르 자료 -->
								<div id="bookRelatedSubject" class="dropBookData">
									<h5 class="htitle">같은 장르의 자료</h5>
									<div class="dropContainerBox">
										<div class="swipeGallery">
											<div class="swiper-container swiper03 swiper-container-initialized swiper-container-horizontal">
												<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
													<div class="swiper-slide swiper-slide-active" style="width: 168px; margin-right: 30px;">
														<a href="javascript:;" onclick="fnDetail('105323926,105826127', '9788950901530', 'MO');"><div class="bookImg" style="height: 235.2px;"><img alt="(들썩들썩 지구를 흔드는)바이러스" src="https://shopping-phinf.pstatic.net/main_3360141/33601414637.20220726094755.jpg" onerror="javascript:fnNoImgBook(this); return false;"></div>
														<div class="bookData">
															<div class="book_dataInner">
																<p class="book_name" title="(들썩들썩 지구를 흔드는)바이러스"><strong>(들썩들썩 지구를 흔드는)바이러스</strong></p>
																<p class="book_writers">
																	<span class="bk_writer">폴 이언 크로스 글; 스티브 브라운 그림; 신동경 옮김</span>
																	<span class="bk_publish">아울북<br>2022</span>
																</p>
															</div>
														</div>
														</a>
													</div>
												</div>
												<!-- Add Arrows -->
												<div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></div>
												<div class="swiper-button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></div>
											<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
										</div>
									</div>
								</div>
																
								<!-- 같은 작가 도서 -->
								<div id="bookRelatedSubject" class="dropBookData">
									<h5 class="htitle">같은 작가의 도서</h5>
									<div class="dropContainerBox">
										<div class="swipeGallery">
											<div class="swiper-container swiper03 swiper-container-initialized swiper-container-horizontal">
												<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
													<c:choose>
														<c:when test="samesame">
															<div class="swiper-slide swiper-slide-active" style="width: 168px; margin-right: 30px;">
																<a href="javascript:;" onclick="fnDetail('105323926,105826127', '9788950901530', 'MO');">
																	<div class="bookImg" style="height: 235.2px;">
																		<img alt="(들썩들썩 지구를 흔드는)바이러스" src="https://shopping-phinf.pstatic.net/main_3360141/33601414637.20220726094755.jpg" onerror="javascript:fnNoImgBook(this); return false;">
																	</div>
																	<div class="bookData">
																		<div class="book_dataInner">
																			<p class="book_name" title="(들썩들썩 지구를 흔드는)바이러스"><strong>(들썩들썩 지구를 흔드는)바이러스</strong></p>
																			<p class="book_writers">
																				<span class="bk_writer">폴 이언 크로스 글; 스티브 브라운 그림; 신동경 옮김</span>
																				<span class="bk_publish">아울북<br>2022</span>
																			</p>
																		</div>
																	</div>
																</a>
															</div>
														</c:when>
														
														<c:otherwise>
															없으면 없음
														</c:otherwise>
													</c:choose>
												</div>
												<!-- Add Arrows -->
												<div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></div>
												<div class="swiper-button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></div>
											<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
										</div>
									</div>
								</div>
							</div>	
						</div>
						<!-- 책 디테일 끝 -->
					</div>
				</div>
				<form id="postFrm" name="postFrm" class="pFrm"  method="post">
					<!-- 팝업 : 우편복사 신청 -->
					<div class="layer_popup_wrap layer_popup_wrap3" data-layer="layer_post_copy" style="display:flex" id="grpBtns_apply">
						<div class="layer_popup basket_layer">
							<div class="popup_header">
								<h1 class="popup_title">복사 신청</h1>
							</div>
							<div class="popup_contents">
								<div class="post_copy_wrap">
									<form action="#">
										<fieldset>
											<legend>복사 신청</legend>
											<div class="post_info_wrap">
												<div class="btn_wrap">
													<button type="button" class="btn">복사신청 안내</button>
												</div>
												<div class="inner">
													<ul class="post_info_list">
														<li>도서관에 방문하지 못할 경우 인터넷으로  복사물을 우편으로 제공받는 서비스</li>
														<li>대상자료: 일반도서 및 연속 간행물, 학위논문
															<p class="mark">※ 비도서, 신문, 마이크로필름, 특수자료, 귀중본자료 제외</p>
														</li>
														<li>신청책수: 1인 5책 이하(1일 1건 기준) 단, 서고자료신청대 양장족보는 1인 3종 이하
															<p class="mark">※ 접수완료 및 발송: 평일(주말 및 휴관일 제외)</p>
														</li>
													</ul>
													<p class="asterisk"><span class="point">* 저작권법에 의거하여 부분복제(1/3)만 가능</span></p>
												</div>
											</div>
											<!-- //우편복사신청 안내 -->
											<!-- 입금 정보 -->
											<div class="post_info_wrap">
												<div class="btn_wrap">
													<button type="button" class="btn">입금 정보</button>
												</div>
												<div class="inner">
													<ul class="post_info_list">
														<li>
															<p>복사서비스: 복사요금</p>
															<strong class="tit">복사 요금(복사면 단위)</strong>
															<table class="tbl_copy_charge">
																<caption><span class="ir_text">복사 서비스 복사요금(면당)</span></caption>
																<colgroup>
																	<col>
																	<col>
																	<col>
																</colgroup>
																<thead>
																	<tr>
																		<th scope="col"></th>
																		<th scope="col">B5</th>
																		<th scope="col">A4</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td class="title"><span>흑백</span></td>
																		<td><span>60원</span></td>
																		<td><span>70원</span></td>
																	</tr>
																	<tr>
																		<td class="title"><span>칼라</span></td>
																		<td><span>400원</span></td>
																		<td><span>500원</span></td>
																	</tr>
																	<tr>
																		<td class="title"><span>고서</span></td>
																		<td><span>100원</span></td>
																		<td><span>120원</span></td>
																	</tr>
																</tbody>
															</table>
														</li>
														<li>
															<p>입금 문의전화 : (복사실) 02-xxxx-xxxx</p>
														</li>
													</ul>
												</div>
											</div>
											<!-- //입금 정보 -->
											<!-- 신청정보 입력 -->
											<div class="post_info_wrap">
												<div class="btn_wrap">
													<button type="button" class="btn">신청 정보 입력</button>
												</div>
												<div class="inner">
													<div class="notice_box">
														<!-- <strong class="notice_title">복사 범위</strong> -->
														<ul>
															<li><span class="as_is_txt">※ 저작권법에 의거하여 부분 복제 (전체 페이지수의 1/3 범위 이내) 가능</span></li>
															<li>- 전체 페이지수 확인 : 홈페이지 자료 검색 > 자료 상세화면 > 형태사항 참고 <a href="#none" class="btn_layer" data-layer="info_img_pop" data-img-src="/resource/templete/nl/img/sub/basket_ex_img.jpg" data-focus="img_ex_pop"><font color="blue">(예시보기)</font></a></li>
															<li>- 복사범위 기입 예시 : (연속 페이지) 1-30, (부분 페이지) 25, 30-45, 110</li>
														</ul>
														<!-- <span class="notice">(복사면 기입 방법 &gt; 연속페이지: 1-30 / 부분페이지: 1,25,39,56 or 목차 처음부터 1/3까지)</span> -->
													</div>
													<!-- [D]PC인 경우 -->
													<div class="ucmy8_modify_wrap basktet_table">
													<table>
														<caption><span class="ir_text">복사 신청한 도서 정보</span></caption>
														<colgroup>
															<col class="col2" style="width: 25%;">
															<col class="col3">
															<col class="col3" style="width: 10%;">
															<col >
															<col >
															<col>
															<col>
															<col>
														</colgroup>
														<thead>
															<tr>
																<th scope="col">자료명</th>
																<th scope="col">발행 년도</th>
																<th scope="col">청구 기호</th>
																<th scope="col">종류</th>
																<th scope="col">인쇄 방식</th>
																<th scope="col">시작 페이지</th>
																<th scope="col">끝 페이지</th>
																<th scope="col">총 페이지</th>
															</tr>
														</thead>
														<tbody id="contents_pc">
															<tr>
																<td>
																	<span>${bookVO.title}</span>
																</td>
																<td>
																	<span>${bookVO.bookDate}</span>
																</td>
																<td>
																	<span>${bookVO.isbn}</span>
																</td>
																<td>
																	<div class="input_select_wrap2">
																		<select title="복사 색상 선택" name="" id="prColor">
																			<option value="N">흑백</option>
																			<option value="Y">컬러</option>
																		</select>
																	</div>
																</td>
																<td>
																	<div class="input_select_wrap2">
																		<select title="용지크기 선택" name="" id="prSize">
																			<option value="A4">A4</option>
																			<option value="B5">B5</option>
																		</select>
																	</div>
																</td>
																<td>
																	<div class="input_text_wrap">
																		<label for="copyNum">
																			<span class="ir_text">복사 시작 페이지</span>
																		</label>
																		<input type="text" id="" name="" class="input_text" aria-label="복사 시작 페이지" placeholder="시작 쪽">
																	</div>
																</td>
																<td>
																	<div class="input_text_wrap">
																		<label for="copyNum">
																			<span class="ir_text">복사 끝 페이지</span>
																		</label>
																		<input type="text" id="" name="" class="input_text" aria-label="복사 끝 페이지" placeholder="끝 쪽">
																	</div>
																</td>
																<td>
																	<div class="input_text_wrap">
																		<label for="copyNum">
																			<span class="ir_text">복사 총 페이지</span>
																		</label>
																		<input type="text" id="" name="" class="input_text" aria-label="복사 총 페이지" placeholder="총 페이지">
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
													</div>
													<!-- [D]MO인 경우 -->
													<div class="ucmy8_modify_wrap ucmy8_mobile_modify_wrap">
														<ul class="ucmy8_list" id="contents_mo">
														</ul>
													</div>
													<p class="mt5">※ 용지 크기 선택 시 확대, 축소 등은 별도 요청해야 함.</p>
													<p>※ 양면, 단면 비용 동일</p>
													<p></p>
													<div class="post_copy_wrap">
														<table class="tbl_post_copy">
															<caption class="ir_text">제본여부선택</caption>
															<colgroup>
																<col class="col1">
																<col>
															</colgroup>
															<tbody>
																<tr>
																	<th scope="row">
																		<span>제본 여부 선택</span>
																	</th>
																	<td>
																		<div class="input_select_wrap2 input_txtSel_wrap">
				<!-- 																<select title="복사 수령방법" id="binding" name="binding" onchange="fn_binding(this);"> -->
																			<select title="우편복사 수령방법" id="binding" name="binding">
																				<!-- [D] 수정 전 선택된 옵션값 selected -->
																				<option value="N">제본 하지 않음</option>
																				<option value="Y">스프링 제본함</option>
																			</select>
																		</div>
				<!-- 															<div class="input_text_wrap input_selTxt_wrap" id="inputBinding" style="display:none;"> -->
				<!-- 																<input type="text" id="bindingDesc" name="bindingDesc" class="input_text" aria-label="제본 요청사항" required=""> -->
				<!-- 																<label for="bindingDesc" class="placeholder">제본 요청사항을 입력해주세요.</label>	 -->
				<!-- 															</div> -->
				<!-- 															<p class="policy_agree" id="bindingEx" style="display:none;">ex. 신청자료 모두 통합하여 한권으로 제본 요청</p>			 -->
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
													<p class="mt5">※ 스프링 제본 요금 : (50매 이내) 2,000원, (50~100매) 3,000원, (100매 이상) 4,000원</p>
				
													<div class="post_copy_wrap">
														<!-- 우편복사 수령 정보 -->
														<table class="tbl_post_copy">
															<caption class="ir_text">복사 수령 정보</caption>
															<colgroup>
																<col class="col1">
																<col>
															</colgroup>
															<tbody>
																<tr>
																	<th scope="row"><label>개인정보 수집동의</label></th>
																	<td>
																		<p class="mb5">&lt;개인정보 수집 및 이용에 대한 안내&gt;</p>
																		<div class="privacy_agree_wrap mt20">
																			<div class="privacy_agree_inner">
																				<ul class="privacy_agree_list">
																					<li>1. 수집 및 이용 목적 : 복사 서비스 제공을 위한 업무처리</li>
																				</ul>
																				<ul class="privacy_agree_list">
																					<li>2. 수집하는 개인정보 항목</li>
																					<li>&nbsp;&nbsp;(필수항목) 성명, 아이디, 휴대폰번호, 이메일, 도서정보(청구기호, 책제목 등)</li>
																					<li>&nbsp;&nbsp;(선택항목) 전달사항</li>
																				</ul>
																				<ul class="privacy_agree_list">
																					<li>3. 보유 및 이용기간 : <b class="txt_red" style="font-size: 20px">1년</b></li>
																				</ul>
																				<ul class="privacy_agree_list">
																					<li>4. 동의 거부권 및 거부에 따른 불이익 : 신청자는 개인정보 수집 및 이용에 거부할 권리가 있습니다. 단, 필수항목 동의를 거부할 경우 우편복사 서비스 이용이 불가능합니다.</li>
																				</ul>
																				<br/>
																				<div class="privacy_agree" style="text-align:left;">
																					<p style="position : relative;">
																						<b><span class="txt_red">(필수항목)</span>개인정보 수집 및 이용</b>에 동의합니다.
																						&nbsp;&nbsp;&nbsp;
																						<input type="checkbox" id="agree01" name="agree1" value="Y" class="normal_input" />
																						<label for="agree01">동의</label>
																						<input type="checkbox" id="agree03" name="agree1" value="N" class="normal_input" />
																						<label for="agree03">미동의</label>
																					</p>
																					<p style="position : relative;">
																						<b><span class="txt_red">(선택항목)</span>개인정보 수집 및 이용</b>에 동의합니다.
																						&nbsp;&nbsp;&nbsp;
																						<input type="checkbox" id="agree02" name="agree2" value="Y" class="normal_input" />
																						<label for="agree02">동의</label>
																						<input type="checkbox" id="agree04" name="agree2" value="N" class="normal_input" />
																						<label for="agree04">미동의</label>
																					</p>
																				</div>
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th scope="row">
																		<label for="hpTel">휴대폰번호</label>
																	</th>
																	<td>
																		<div class="input_text_wrap input_phone_wrap">
																			<input type="text" id="hpTel" name="hpTel" class="input_text" aria-label="휴대폰번호" required="" />
																			<label for="hpTel" class="placeholder">입력예: 01012345678</label>
																		</div>
																		<p class="notice_text">*입력 예 : 01012345678</p>
				
																		<span class="input_check_wrap">
																			<input type="checkbox" id="smsApply" name="smsApply" class="input_check" checked />
																			<label for="smsApply">접수내역 알림 신청</label>
																		</span>
																	</td>
																</tr>
																<tr>
																	<th scope="row">
																		<label for="post1st">이메일</label>
																	</th>
																	<td>
																		<div class="input_text_wrap input_phone_wrap">
																			<input type="text" id="hpTel" name="hpTel" class="input_text" aria-label="이메일" required="" />
																			<label for="hpTel" class="placeholder">입력예: seedlib1234@naver.com</label>
																		</div>
																		<p class="notice_text">*입력 예 : seedlib1234@naver.com</p>
				
																		<span class="input_check_wrap">
																			<input type="checkbox" id="smsApply" name="smsApply" class="input_check" checked />
																			<label for="smsApply">접수내역 알림 신청</label>
																		</span>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th scope="row">
																		<label for="etc">기타 전달사항 <span class="option_item">(선택)</span></label>
																	</th>
																	<td>
																		<div class="input_text_wrap">
																			<input type="text" id="etc" name="etc" class="input_text" aria-label="기타 전달사항" />
																		</div>
																	</td>
																</tr> <!-- //우편복사 수령 정보 -->
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<!-- //신청정보 입력 -->
											<div class="btn_wrap center mb30">
												<button type="submit" class="btn btn_apply" onclick="javascript:goPostApply();return false;">신청</button>
											</div>
										</fieldset>
									</form>
								</div>
							</div>
							<button type="button" class="btn_close closeLayer"><span class="sp">닫기</span></button>
						</div>
					</div>
				</form>
				<!-- //팝업 : 우편복사 신청 -->
			</div>
		</div>
	</div>


</body>
</html>