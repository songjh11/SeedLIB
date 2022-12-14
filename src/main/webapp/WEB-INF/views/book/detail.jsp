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
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
    
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/board.css">
    <link rel="stylesheet" href="/css/button.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/sub.css">
    <link rel="stylesheet" href="/css/new_search.css">
    
    <!-- 프린트신청 팝업창 css -->
   	<link rel="stylesheet" href="/css/admin/modal.css">
	<link rel="stylesheet" href="/css/admin/adcommon.css">
	<link rel="stylesheet" href="/css/admin/modalutil.css">
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<!-- 프린트신청 팝업창 여는 버튼, 모달 창 버튼 js -->
	<script type="text/javascript" defer="defer" src="/js/admin/modal.js"></script>
	<!-- SweetAlert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <script type="text/javascript" defer src="/js/common.js"></script>

    <link rel="icon" href="/images/favicon.png">
	<title>통합검색 : 씨앗도서관 ☘️ </title>
	<c:import url="../temp/header.jsp"></c:import>
</head>


<body>
	<input type="hidden" id="isbn" value="${bookVO.isbn}">
	<input type="hidden" id="userName" value="${member.userName}">

	<div id="container" class="sub">	
		<div class="sVisualWrap">
			<div class="sVisual">
				<h3>통합검색</h3>
				<h3>${member}</h3>
			</div>
		</div>
		
		<div id="contentGroup">
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
							<c:set var="admin" value="false"></c:set>
							<c:if test="${empty member}">
										<li>
										<a href="#snsGroup" id="sns" title="SNS 공유하기(확장됨)" class="snsShare"><span class="blind">SNS 공유하기</span></a>
											<div id="snsGroup" class="snsList clearfix" style="display: block; right: 45px; opacity: 1;">
												<a href="#" id="print2" title="제본신청">
													<img alt="책프린트" src="/images/printer.png">
													<span class="">현재 책 프린트</span>
												</a>
											</div>
										<c:set var="admin" value="true"></c:set>
										</li>	
									</c:if>
									<c:if test="${not empty member}">
										<c:forEach items="${member.roleVOs}" var="r">
												<c:if test="${r.roleName eq 'ROLE_ADMIN'}">
													<li style="display: flex;">
														<div style="display: flex; align-items: center; flex-direction: column;">
															<a href="../admin/book/boUpdate?isbn=${bookVO.isbn}" id="bookUpdate" title="도서 수정" class="snsShare">
																<img alt="수정" src="/images/refresh.png">
															</a>
															<p style="color: #444444;font-size: 13px;height: 20px;margin-top: 10px;">수정</p>
														</div>
														<div style="display: flex; align-items: center; flex-direction: column;">
															<button type="button" id="bookDelete" title="도서 삭제" class="snsShare" value="${bookVO.isbn}">
																<img width="40px;" alt="삭제" src="/images/trash.png">
															</buton>
															<p style="color: #444444;font-size: 13px;height: 20px;margin-top: 10px;">삭제</p>
														</div>
													<c:set var="admin" value="true"></c:set>
													</li>
												</c:if>
										</c:forEach>	
									<c:if test="${admin eq 'false'}">
											<a href="#snsGroup" id="sns" title="SNS 공유하기(확장됨)" class="snsShare"><span class="blind">SNS 공유하기</span></a>
											<div id="snsGroup" class="snsList clearfix" style="display: block; right: 45px; opacity: 1;">
												<a href="#" id="print" title="제본신청">
													<img alt="책프린트" src="/images/printer.png">
													<span class="">현재 책 프린트</span>
												</a>
											</div>
										</c:if>
									</c:if>
							</li>
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
								<div class="bookImg">
									<img alt="" src="${bookVO.image}">
								</div>
								<div class="book_name" id="title" val="${bookVO.title}">${bookVO.title}</div>
								
								<!-- 간략보기 -->
								<div class="simpleView viewTab open">
									<div class="book_publisher">
										<span class="bk_writer">${bookVO.writer}</span>
										<span class="bk_publish">${bookVO.publisher}</span>
										<span class="bk_date">${bookVO.bookDate}</span>
									</div>
									
									<div class="book_publisher">
										<span class="bk_writer">ISBN : ${bookVO.isbn}</span>
									</div>
							
									<div class="thisBookCategory">
										<dl>
											<dt>한국십진분류</dt>
											<dd>
												<span>
													<c:choose>
														<c:when test="${bookVO.category eq 0}">총류</c:when>
														<c:when test="${bookVO.category eq 1}">철학</c:when>
														<c:when test="${bookVO.category eq 2}">종교</c:when>
														<c:when test="${bookVO.category eq 3}">사회과학</c:when>
														<c:when test="${bookVO.category eq 4}">자연과학</c:when>
														<c:when test="${bookVO.category eq 5}">기술과학</c:when>
														<c:when test="${bookVO.category eq 6}">예술</c:when>
														<c:when test="${bookVO.category eq 7}">언어(어학)</c:when>
														<c:when test="${bookVO.category eq 8}">문학</c:when>
														<c:when test="${bookVO.category eq 9}">역사</c:when>
													</c:choose>
												</span>
											</dd>
										</dl>
									</div>
									
									<div class="book_publisher">
										<span class="bk_writer">대출 횟수 : ${bookVO.bookCount}</span>
										<span class="bk_publish">추천 순위 : ${bookVO.num}</span>
									</div>
									
									<div class="keyword">
										<c:if test="${not empty member}">
											<c:if test="${isShelfExist eq false}">											
												<button type="button" class="btn white small" id="addShelfBtn">책꽂이 담기</button>
											</c:if>	
											<c:if test="${isShelfExist}">											
												<button type="button" class="btn white small" id="addBookBtn">책꽂이 담기</button>
											</c:if>	
											
											<c:if test="${isLikeExist eq false}">
												<button type="button" class="btn white small" id="likeBtn">좋아요</button>
											</c:if>
											<c:if test="${isLikeExist}">
												<button type="button" class="btn white small" id="unlikeBtn">좋아요 취소</button>
											</c:if>
										</c:if>
										
										<c:if test="${empty member}">
											<a href="/member/login"><button type="button" class="btn white small">책꽂이 담기</button></a>
											<a href="/member/login"><button type="button" class="btn white small">좋아요</button></a>
										</c:if>
										<span>💚 ${like}</span>
									</div>
								</div>
								<!-- // 간략보기 -->
							</div>
							<!-- 하단 책 상세정보 -->
							<div class="tabMove">
								<ul class="cateTab col-4 clearfix">
									<li class="choiced"><a href="#tabGo1">소장정보</a></li>
									<li><a href="#tabGo2">책소개</a></li>
									<li><a href="#tabGo3">같은 장르 도서</a></li>
									<li><a href="#tabGo4">같은 작가 도서</a></li>
								</ul>
							</div>
							
							
							<!-- 소장 정보 -->
							<div class="dropBookData" id="tabGo1">
								<div class="dropBookData" id="tabGo1">
									<h5 class="htitle">소장정보</h5>
									<div class="dropContainerBox">
										<div class="whereLibrary webViewOnly">
											<div class="thisBook-libraryselecter">
												<c:forEach var="lib" items="${lib.libVOs}">
													<a href="" class="${lib.libName}" data-name="${lib.libName}">${lib.libName}</a>
												</c:forEach>
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
																<th scope="col">자료실</th>
															</tr>
														</thead>
														<tbody>
														
															<c:forEach var="li" items="${lib.bookLibVOs}">
																<c:set var="where" value="${li.libNum}"/>
																<c:set var="quan" value="${li.quantity}" />
																<c:set var="able" value="${li.able}" />
																
																<tr class="MA">
																	<td>
																		<c:choose>
																			<c:when test="${where == 0}">씨앗도서관</c:when>
																			<c:when test="${where == 1}">새싹도서관</c:when>
																			<c:when test="${where == 2}">쑥쑥도서관</c:when>
																			<c:when test="${where == 3}">새봄도서관</c:when>
																			<c:when test="${where == 4}">도란도란도서관</c:when>
																			<c:when test="${where == 5}">뿌리도서관</c:when>
																		</c:choose>
																	</td>
																	
																	<!-- 씨앗 도서관일 때 : 대출 가능 / 대출 불가능 - 예약
																		타 도서관일 때 : 상호대차 가능 / 대출 불가능 - X -->
																	<td>
																		<c:choose>
																			<c:when test="${quan >= 1}">
																				대출 가능
																				<h6>(대출 가능 권수 : ${quan})</h6>
																			</c:when>
																			<c:when test="${quan eq 0}">
																				대출 불가능
																			</c:when>
																		</c:choose>
																	</td>
																	
																	<td>
																		<c:choose>
																			<c:when test="${where == 0}">
																				<c:if test="${rtDate != null}"><input type="hidden" class="enableDate" value="${rtDate}">${rtDate}</c:if>
																				<c:if test="${rtDate == null}">-</c:if>
																			</c:when>
																			<c:otherwise>해당 도서관으로 문의 바랍니다.</c:otherwise>
																		</c:choose> 
																	</td>
																	
																	<td>
																		<c:if test="${not empty member}">
																			<c:if test="${where == 0}">
																				<input type="hidden" class="libNumL" value="${where}">
																				<c:if test="${quan >= 1}">
																					<button type="button" class="btn white small" id="LoanAlretBtn" title="대출신청">대출신청</button>
																				</c:if>
																				<c:if test="${quan == 0}">
																					<button type="button" class="btn white small" id="ResAlretBtn" title="예약신청">예약신청</button>
																				</c:if>
																			</c:if>
																				
																			<c:if test="${where != 0}">
																				<c:if test="${quan >= 1}">
																					<input type="hidden" class="libNumM" value="${where}">
																					<button type="button" class="btn white small" id="MuAlretBtn" title="상호대차 신청">상호대차</button>
																				</c:if>
																				<c:if test="${quan == 0}">
																					대출 불가능
																				</c:if>
																			</c:if>
																		</c:if>
																			
																		<c:if test="${empty member}">
																			<c:if test="${where == 0}">
																				<c:if test="${quan >= 1}">
																					<a href="/member/login"><button type="button" class="btn white small" title="대출신청">대출신청</button></a>
																				</c:if>
																				<c:if test="${quan == 0}">
																					<a href="/member/login"><button type="button" class="btn white small" title="예약신청">예약신청</button></a>
																				</c:if>
																			</c:if>	
																			
																			<c:if test="${where != 0}">
																				<c:if test="${quan >= 1}">
																					<a href="/member/login"><button type="button" class="btn white small">상호대차</button></a>
																				</c:if>
																				<c:if test="${quan == 0}">대출 불가능</c:if>
																			</c:if>
																		</c:if>
																	</td>
																	
																	<td>
																		<c:choose>
																			<c:when test="${where eq 0}">스마트도서관</c:when>
																			<c:when test="${where eq 1}">2층 일반 자료실</c:when>
																			<c:when test="${where eq 2}">3층 일반 자료실2</c:when>
																			<c:when test="${where eq 3}">2층 보존 서고</c:when>
																			<c:when test="${where eq 4}">스마트도서관</c:when>
																			<c:when test="${where eq 5}">4층 보존서고</c:when>
																			<c:when test="${where eq 6}">2층 일반 자료실</c:when>
																		</c:choose>
																	</td>
																</tr>
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
								<h5 class="htitle" id="htitle">책소개
									
								</h5>
								<div class="dropContainerBox">
									<div class="bookInformation" id="bookInformation">
										
									</div>
								</div>
							</div>
							
							<!-- 같은 장르 자료 -->
							<div id="tabGo3" class="dropBookData">
								<h5 class="htitle">같은 장르의 자료</h5>
								
								<div class="dropContainerBox">
									<div class="swipeGallery">
										<div class="swiper-container swiper01 MA swiper-container-initialized swiper-container-horizontal" style="display: block;">
											<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
												
												<c:forEach var="sc" items="${cate}">
													<div class="swiper-slide swiper-slide-active" style="width: 138.333px; margin-right: 20px;">
														<a href="/book/detail?isbn=${sc.isbn}">
														<div class="bookImg" style="height: 161px;">
															<img alt="" src="${sc.image}" onerror="javascript:fnNoImgBook(this); return false;">
														</div>
														<div class="bookData">
															<div class="book_dataInner">
																<p class="book_name" title="${sc.title}"><strong>${sc.title}</strong></p>
																<p class="book_writers">
																	<span class="bk_writer">${sc.writer}</span>
																	<span class="bk_publish">${sc.publisher}<br>${sc.bookDate}</span>
																</p>
															</div>
														</div>
														</a>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>	
								</div>
															
							<!-- 같은 작가 도서 -->
							<div id="tabGo4" class="dropBookData">
								<hr style="margin-top: 30px;">
								<h5 class="htitle">같은 작가의 자료</h5>
								
								<div class="dropContainerBox">
									<div class="swipeGallery">
										<div class="swiper-container swiper01 MA swiper-container-initialized swiper-container-horizontal" style="display: block;">
											<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
												
												<c:forEach var="sw" items="${wri}">
													<div class="swiper-slide swiper-slide-active" style="width: 138.333px; margin-right: 20px;">
														<a href="/book/detail?isbn=${sw.isbn}">
														<div class="bookImg" style="height: 161px;">
															<img alt="" src="${sw.image}" onerror="javascript:fnNoImgBook(this); return false;">
														</div>
														<div class="bookData">
															<div class="book_dataInner">
																<p class="book_name" title="${sw.title}"><strong>${sw.title}</strong></p>
																<p class="book_writers">
																	<span class="bk_writer">${sw.writer}</span>
																	<span class="bk_publish">${sw.publisher}<br>${sw.bookDate}</span>
																</p>
															</div>
														</div>
														</a>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>	
								</div>
					</div>
					<!-- 책 디테일 끝 -->
				</div>
			</div>
			<form action="../print/boAdCart" id="postFrm" class="pFrm"  method="post">
				<!-- 팝업 : 우편복사 신청 -->
				<div class="layer_popup_wrap layer_popup_wrap3" data-layer="layer_post_copy" style="display:none" id="grpBtns_apply">
					<div class="layer_popup basket_layer">
						<div class="popup_header" style="background-image: linear-gradient(to right, #9be15d, #00e3ae)">
							<h1 class="popup_title">복사 신청</h1>
						</div>
						<div class="popup_contents">
							<div class="post_copy_wrap">
								<form action="#">
									<fieldset>
										<legend>복사 신청</legend>
										<div class="post_info_wrap">
											<div class="btn_wrap">
												<button type="button" style="background: #02d4498f" class="btn">복사신청 안내</button>
											</div>
											<div class="inner">
												<ul class="post_info_list">
													<li>도서관에 방문하지 못할 경우 인터넷으로  복사물을 우편으로 제공받는 서비스</li>
													<li>대상자료: 일반도서 및 연속 간행물, 학위논문
														<p class="mark">※ 비도서, 신문, 마이크로필름, 특수자료, 귀중본자료 제외</p>
													</li>
													<li>신청책수: 1인 5책 이하(1일 1건 기준) 단, 서고자료신청대 양장족보는 1인 3종 이하
														<p class="mark">※ 접수완료 : 평일(주말 및 휴관일 제외)</p>
													</li>
												</ul>
												<p class="asterisk"><span class="point">* 저작권법에 의거하여 부분복제(1/3)만 가능</span></p>
											</div>
										</div>
										<!-- //우편복사신청 안내 -->
										<!-- 입금 정보 -->
										<div class="post_info_wrap">
											<div class="btn_wrap">
												<button type="button" style="background: #02d4498f" class="btn">요금 정보</button>
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
																	<td><span>70원</span></td>
																	<td><span>90원</span></td>
																</tr>
																<tr>
																	<td class="title"><span>칼라</span></td>
																	<td><span>500원</span></td>
																	<td><span>800원</span></td>
																</tr>
															</tbody>
														</table>
													</li>
													<li>
														<p>요금 문의전화 : (복사실) 02-xxxx-xxxx</p>
													</li>
												</ul>
											</div>
										</div>
										<!-- //입금 정보 -->
										<!-- 신청정보 입력 -->
										<div class="post_info_wrap">
											<div class="btn_wrap">
												<button type="button" class="btn" style="background: #02d4498f">신청 정보 입력</button>
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
															<col>
															<col>
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
																	<span id="prinBook">${bookVO.title}</span>
																</td>
																<td>
																	<span>${bookVO.bookDate}</span>
																</td>
																<td>
																	<input type="hidden" id="ipIsbn" name="isbn" value="${bookVO.isbn}">
																	<span id="prinIsbn">${bookVO.isbn}</span>
																</td>
																<td>
																	<div class="input_select_wrap2">
																		<select title="복사 색상 선택" name="caColor" id="prColor">
																			<option value="N">흑백</option>
																			<option value="Y">컬러</option>
																		</select>
																	</div>
																</td>
																<td>
																	<div class="input_select_wrap2">
																		<select title="용지크기 선택" name="caSize" id="prSize">
																			<option value="A4">A4</option>
																			<option value="B5">B4</option>
																		</select>
																	</div>
																</td>
																<td>
																	<div class="input_text_wrap">
																		<label for="copyNum">
																			<span class="ir_text">복사 시작 페이지</span>
																		</label>
																		<input type="text" id="ipCaStPage" name="caStPage" class="input_text" style="border: 1px solid #fff0" aria-label="복사 시작 페이지" placeholder="시작 쪽">
																	</div>
																</td>
																<td>
																	<div class="input_text_wrap">
																		<label for="copyNum">
																			<span class="ir_text">복사 끝 페이지</span>
																		</label>
																		<input type="text" id="ipCaLsPage" name="caLsPage" class="input_text" style="border: 1px solid #fff0" aria-label="복사 끝 페이지" placeholder="끝 쪽">
																	</div>
																</td>
																<td>
																	<div class="input_text_wrap">
																		<label for="copyNum">
																			<span class="ir_text">복사 총 페이지</span>
																		</label>
																		<input type="text" readonly id="ipCaTtPage" name="caTtPage" class="input_text" style="border: 1px solid #fff0" aria-label="복사 총 페이지" placeholder="총 페이지">
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div 
													id="ipResult"
													style="margin-top: 1;
														   margin-bottom: 1;
														   color: red;"	
												>
												</div>
												<p class="mt5">※ 용지 크기 선택 시 확대, 축소 등은 별도 요청해야 함.</p>
												<p>※ 양면, 단면 비용 동일</p>
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
																		<select title="우편복사 수령방법" id="binding">
																			<option value="N">제본 하지 않음</option>
																			<option value="Y">스프링 제본함</option>
																		</select>
																	</div>
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
																		<input type="hidden" id="ipUserName" value="${member.userName}">
																		<input type="text" readonly id="ipPhone" name="phone" class="input_text" value="${member.phone}" style="border: 1px solid #fff0" aria-label="휴대폰번호" />
																		<label for="hpTel" class="placeholder">입력예: 01012345678</label>
																	</div>
																	<p class="notice_text">*입력 예 : 01012345678</p>
																</td>
															</tr>
															<tr>
																<th scope="row">
																	<label for="post1st">이메일</label>
																</th>
																<td>
																	<div class="input_text_wrap input_phone_wrap">
																		<input type="text" readonly id="ipEmail" name="email" class="input_text" value="${member.email}" style="border: 1px solid #fff0" aria-label="이메일"/>
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
															<!-- //우편복사 수령 정보 -->
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<!-- //신청정보 입력 -->
										<div class="btn_wrap center mb30">
											<button type="button" id="applyBtn" class="btn btn_apply" style="background-image: linear-gradient(to right, #9be15d, #00e3ae)">확인</button>
										</div>
										<!-- 입금 정보 -->
										<div style="display: none;" id="order">
											<div class="post_info_wrap">
												<div class="btn_wrap">
													<button type="button" style="background: #02d4498f" class="btn">결제 내역</button>
												</div>
												<div class="inner">
													<ul class="post_info_list">
														<li>
															<strong class="tit">복사 요금(복사면 단위)</strong>
															<table class="tbl_copy_charge">
																<caption><span class="ir_text">복사 서비스 복사요금(면당)</span></caption>
																<colgroup>
																	<col>
																	<col>
																	<col>
																	<col>
																	<col>
																	<col>
																</colgroup>
																<thead>
																	<tr>
																		<th scope="col">제본</th>
																		<th scope="col">총 페이지</th>
																		<th scope="col">1장 가격</th>
																		<th scope="col">총페이지 가격</th>
																		<th scope="col">제본 가격</th>
																		<th scope="col">결제 금액</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td class="title"><span>${bookVO.title}</span></td>
																		<td id="tdTtp"><span></span></td>
																		<td id="tdPa"><span></span></td>
																		<td id="tdTtpPrice"><span></span></td>
																		<td id="tdPrinPay"><span></span></td>
																		<td id="tdTtPay"><span id="prAmount"></span></td>
																		<input type="hidden" name="caAmount" id="ipCaAmount">
																	</tr>
																</tbody>
															</table>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<input type="hidden" id="prinImp" value="${imp}">
									</fieldset>
									<div class="btn_wrap center mb30" id="payBtnWrap" style="display: none;">
										<button type="button" id="payBtn" class="btn btn_apply" onclick="requestPay()" style="transform: translateX(410px); background-image: linear-gradient(to right, #9be15d, #00e3ae)">결제하기</button>
									</div>
								</form>
							</div>
						</div>
						<button type="button" class="btn_close closeLayer" id="close"><span class="sp">닫기</span></button>
					</div>
				</div>
			</form>
			<!-- //팝업 : 우편복사 신청 -->
		</div>
	</div>
</div>
</div>
	<c:import url="../temp/footer.jsp"></c:import> 
</div>
	
	<script type="text/javascript" src="/js/bookDetail.js"></script>
    <script type="text/javascript" src="/js/bookLoan.js"></script>
    <script type="text/javascript">
    	bookSearch();
    </script>
	<script>
		$("#bookDelete").click(function(){
			const title = $("#title").attr("val");
			const isbn = $(this).attr("value");
			console.log(title,isbn);
			let check = window.confirm("해당 도서: "+title+" 를 삭제하시겠습니까?");
			if(check){
				$.ajax({
					type:"POST",
					url:"/admin/book/boDelete",
					data:{
						isbn:isbn
					},success:function(data){
						console.log(data.msg);
						alert(data.msg);
						location.href="../";
					},error:function(data){
						alert(data.msg);
					}
				});
			}else{
				return;
			}
		})
	</script>
</body>
</html>