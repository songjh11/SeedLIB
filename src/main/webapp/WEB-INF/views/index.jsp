<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/main.css">
<link rel="shortcut icon" href="/images/favicon.png">
<link rel="stylesheet" type="text/css" href="/css/calendar/calendar.css"/>
<script src="/js/calendar/calendar.js"></script>

<title>꿈이 싹트는 정원 : 씨앗도서관</title>

<style>
	#searchBtn:hover {
		cursor: pointer;
	}

	td .fc-day-mon{
		background-color: #ff4c4c !important;
	}
	
	.fc .fc-toolbar.fc-header-toolbar {
    	margin-bottom: 0;
	}		

	td {
    font-size: smaller !important;
	font-weight: bolder;
	}

	#slide > li:hover{
		cursor: pointer;
	}

</style>
</head>

<body>
<div id="wrap">

<!-- 헤더 -->
<c:import url="./temp/header.jsp"></c:import>
<!-- 헤더 -->

	<div id="container" class="main">

		<section id="section1">
			<h2 class="blind">메인상단</h2>

			<div class="backImg">
				<ul class="popupList thumb">
					<li style="z-index: 99; display: list-item;"></li>
					<li style="display: list-item; z-index: 100; background-color: #ffffff33;"></li>
					<li style="display: list-item; z-index: 99;"></li>
				</ul>
			</div>

			<div class="sectionGroup">
				<div class="sectionGroup" >
					<p class="slogan" style="color: white; text-shadow: 1px 1px 3px rgb(0 0 0 / 50%);">
						<span style="font-size: 22px;">시민에게 행복과 감동을 주는</span>
						<br>
						<span style="font-size: 52px; font-weight: bold; text-shadow: 1px 1px 3px rgb(0 0 0 / 50%);">씨앗도서관</span>
					</p>
					
					<!-- 통합검색 -->
					

					<div class="mainSearchWrap">
						<div class="mainSearchForm clearfix">
							<form action="./search/simpleresult" name="mainSearchForm" id="searchForm" method="get">
								

								<fieldset>
									<legend class="blind">통합검색 영역</legend>
									<div class="searchRadi mainBestKeyword mobileHide" id="mainBestKeyword">
					
										<div style="width: 200px;">

											<!-- <div class="controlArea" style="padding: 17px;">
												<a href="#" id="btnUp" class="upupup" title="인기검색어 위로 넘기기"><span class="blind">위</span></a>
												<a href="#" id="btnDwon" class="sfsdf" title="인기검색어 아래로 넘기기"><span class="blind">아래</span></a>
											</div> -->
											<div class="keywordListWrap" >
												<ol class="keywordList">


													<c:forEach items="${popular}" var="list" varStatus="status">
														<li><a href="./search/simpleresult?search=${list.word}" title="${list.word}"><i>${status.count}</i><span style="margin-left: 5px;">${list.word}</span></a></li>
													</c:forEach>
													<!-- <li><a href="./search/simpleresult?search=제목" title="불편한 편의점"><i>1</i>조낸조낸조낸불편한 편의점</a></li>
													<li><a href="#link" onclick="" title="흔한남매"><i>2</i>흔한남매</a></li> -->
												</ol>
											</div>
										</div>

										<script>
											

											function Silsigan(){
												let iindex = 1;
												let count = $('.keywordList li').length;
												let height = ($('.keywordList li').height()+0.5)*2;
												

												function step(index) {
													$('.keywordList').delay(2000).animate({
														top: -height * index,
													}, 500, function() {
														step((index + 1) % count);
														iindex = index;
														
													});
													// console.log(count);
													// console.log(height);
												}

												step(1);

												// const updownbtn = document.querySelector('.controlArea');
												// updownbtn.addEventListener('click', ssSlide);


												/* 버튼 클릭 */
												function ssSlide(event) {
													event.preventDefault();
													if (event.target.className === 'upupup') {
														// if (currentIdx === slideLis.length -1) {
														// 	slider.style.transform = "translateX(0px)";
														// 	currentIdx = 0;
														// 	translate = 0;
														// 	return
														// };
														// move(-1);

														let cutop = $('.keywordList').css("top").replace(/[^0-9]/g, "");
														$('.keywordList').css("top", -(cutop-67))
														let zzz = parseInt($('.keywordList').css("top").replace(/[^0-9]/g, "")/67);
														console.log("현재의 top"+zzz);
														step(iindex+1);

													} else {
														// if (currentIdx === 0) {
														// 	slider.style.transform = "translateX(-1401px)";
														// 	currentIdx = slideLis.length-1;
														// 	translate = -1401;
															
														// 	return
														// };
														// 	move(1);
														// }
														let cutop = $('.keywordList').css("top").replace(/[^0-9]/g, "");
														$('.keywordList').css("top", -(cutop+67))
														let zzz = parseInt($('.keywordList').css("top").replace(/[^0-9]/g, "")/67);
														console.log("현재의 top"+zzz);
														step(iindex-1);

													}
												}
											};

											Silsigan();

										</script>
										
									</div>
									<div class="mainSearchKeywordWrap">
										<div class="mainSearchKeyword">
											
											<label for="mainSearchKeyword" class="blind">검색어 입력</label>
											<input type="text" onkeyup="enterkey()" title="검색어 입력" class="form-ele" id="totalSearchValue" name="search" style="height: 68px; font-size: 1.3rem; padding: 0px 20px;" placeholder="검색어를 입력하세요">
											<a id="searchBtn" title="검색" class="btnSearch" style="text-align: center;">검색</a>
										</div>
									</div>

									<script src="/js/search.js"></script>
									
								</fieldset>
							</form>
						</div>
					</div>
					
					<!-- //통합검색 -->

				<!-- 주요서비스 -->
				<div class="shortcut">
					<ul class="shortcutList clearfix">
						<li class="svc1"><a href="/resources/"><img src="/images/m_calendar.png"><br>문화행사신청</a></li>
						<li class="svc2"><a href="/hope/hopeInfo"><img src="/images/m_books.png"><br>희망도서신청</a></li>
						<li class="svc3"><a href="/studyroom/roomInfo"><img src="/images/m_room.png"><br>열람실현황조회</a></li>
						<li class="svc4"><a href="/guide/manners"><img src="/images/m_info.png"><br>도서관안내</a></li>
						<li class="svc5"><a href="/info/bookStatus"><img src="/images/m_library.png"><br>도서관소개</a></li>
						<li class="svc6"><a href="/info/map"><img src="/images/m_map.png"><br>찾아오는길</a></li>
						<li class="svc7"><a href="/mypage/myIndex"><img src="/images/m_reading.png"><br>도서이용내역</a></li>
					</ul>
				</div>
				<!-- //주요서비스 -->

				<!-- 도서관 바로가기 -->
				<form name="ebookForm" method="post" target="_blank" action="https://elib.anyang.go.kr/ebookPlatform/Homepage/SSOLoginDL.do">
					<input type="hidden" name="libCode" value="141077">
					<input type="hidden" name="userId" value="">
					<input type="hidden" name="userName" value="">
					<input type="hidden" name="smartLogin" value="ID">
				</form>
			</div>
		</section>


		<section id="section5">
			<h2 class="blind">섹션5</h2>

			<div class="sectionGroup">

			<!-- 팝업존 -->
			<!-- <script>
				$(function(){
					//팝업존
					$(".popupZone .popupList").slider({
						resolution : "480x400",
						usePager : false,
						numbering : true
					});
				});
			</script> -->
	
				<div class="popupZone public">

					<h1 class="blind">팝업존</h1>
					
					<div class="controlGroup">
						<a href="#" class="btnSlidePrev" title="이전 슬라이드 보기"></a>
						<a href="#" class="btnSlideNext" title="다음 슬라이드 보기"></a>
						
					</div>
					<div class="arrowWrap">
						<div class="pp-controls">
							<li class="bbb"><a href=""></a></li>
							<li class="bbb"><a href=""></a></li>
							<li class="bbb"><a href=""></a></li>
							<li class="bbb"><a href=""></a></li>
						</div>
					</div>

					<ul id="slide" class="slidee" style="height: 340px;">
						<li><img onclick="location.href='/program/detail?proNum=5'" src="/images/main/l_winterNight.png" alt="뭐지1" class="slide"></li>
						<li><img onclick="location.href='/program/detail?proNum=3'" src="/images/main/l_coloring.png" alt="뭐지2" class="slide"></li>
						<li><img onclick="location.href='/program/detail?proNum=6'" src="/images/main/l_seed.png" alt="뭐지3" class="slide"></li>
						<li><img onclick="location.href='/program/detail?proNum=4'" src="/images/main/l_ding.png" alt="뭐지4" class="slide"></li>
					</ul>


					


					<script>
						window.onload = function() {
							const slider = document.querySelector('#slide');
							const slideLis = slider.querySelectorAll('li')
							const moveButton = document.querySelector('.controlGroup');
							let bbb = document.querySelectorAll(".bbb");

							// 주요변수 초기화
							let currentIdx = 0;
							let translate = 0;
							const speedTime = 500;

							/* ul 넓이 계산 */
							const liWidth = slideLis[0].clientWidth;
							const sliderWidth = liWidth * slideLis.length;
							slider.style.width = sliderWidth+'px' ;
							
							/* 리스너 설치하기 */
							moveButton.addEventListener('click', moveSlide);

							function showbullet() {
								for(let i=0; i<slideLis.length;i++) {
									bbb[i].style.color="#00000070";
									if(currentIdx == i) {
										bbb[i].style.color="white";
									}
								}
							}

							function move(gogogo) {
								currentIdx += (-1 * gogogo);
								translate += liWidth * gogogo;
								slider.style.transform = "translateX("+translate+"px)";
								slider.style.transition = "all "+speedTime+"ms ease";
								showbullet();
							}

							/* 버튼 클릭 */
							function moveSlide(event) {
							event.preventDefault();
							if (event.target.className === 'btnSlideNext') {
								if (currentIdx === slideLis.length -1) {
									slider.style.transform = "translateX(0px)";
									currentIdx = 0;
									translate = 0;
									return
								};
								move(-1);
							} else {
								if (currentIdx === 0) {
									slider.style.transform = "translateX(-1401px)";
									currentIdx = slideLis.length-1;
									translate = -1401;
									
									return
								};
									move(1);
								}
							}

							function sliding() {
								if (currentIdx === slideLis.length -1) {
									slider.style.transform = "translateX(0px)";
									currentIdx = 0;
									translate = 0;
									showbullet();
									return
								};
								move(-1);
							}

							function showSliding() {
								setInterval(sliding, 3000);
							}

							showSliding();
							showbullet();
						}
					</script>

					
					

				</div>
				<!-- //팝업존 -->

				<!-- 공지사항 -->
				<div class="noticeZone">
					<h5>공지사항</h5>
					<ul class="articleList">
					<c:forEach items="${nN}" var="nN">
						<li>
							<a href="/board/detail?boardNum=${nN.boardNum}">
							<span class="lib childFB">[씨앗]</span>
								${nN.title}
							</a>
						</li>
					</c:forEach>
				
					
				
					
					</ul>
					<div class="more"><a href="/board/list" title="공지사항 더보기"><span class="blind">더보기</span></a></div>
				</div>
				<!-- //공지사항 -->

				<c:choose>
					<c:when test="${memberVO.name eq null}">
						<!-- 회원 로그인 -->
						<div class="serviceZone before">
						<sec:authorize access="!isAuthenticated()">	
							<h5>회원 로그인</h5>
							<p>로그인을 하시면 더욱 편리하게<br class="mobileHide"> 이용할 수 있습니다.</p>
							<ul class="clearfix">
							
								<li><a href="/member/login">로그인</a></li>
								<li><a href="/member/agree">회원가입</a></li>
							
								
								</sec:authorize>
							<sec:authorize access="isAuthenticated()">	
							<h5>준회원</h5>
							
							<p><strong>${vo.name}</strong>님, 안녕하세요</p>
							<br>
								<li><span>아이디</span> : ${vo.username} </li>
								<li><span>회원가입일</span> : ${vo.regDate} </li>
								<li><span>휴대폰번호</span> : ${vo.phone} </li>
							</ul>
						</sec:authorize>
							
						</div>
						<!-- //회원 로그인 -->
					</c:when>
					<c:when test="${memberVO.name ne null}">
						<!-- 미니 내정보 -->
						<div class="serviceZone">
							<h5>서비스 이용현황</h5>
							<ul class="myInfo clearfix">
								<li><p><strong>${memberVO.name} 님,</strong><br> 반갑습니다.</p></li>
								<li><p><strong>
									<c:choose>
										<c:when test="${memberVO.roleVOs[0].roleName eq 'ROLE_ADMIN'}">
											관리자
										</c:when>
										<c:when test="${memberVO.roleVOs[0].roleName eq 'ROLE_MEMBER'}">
											정회원
										</c:when>
								</c:choose>
							</strong></p></li>
							</ul>
							<div class="myInfoList">
								<dl>
									<dt>도서대출현황</dt>
									<dd>${loanCount}</dd>
								</dl>
								<dl>
									<dt>도서예약현황</dt>
									<dd>${revCount}</dd>
								</dl>
								<dl>
									<dt>수강신청현황</dt>
									<dd>${proCount}</dd>
								</dl>
								<dl>
									<dt>희망도서 신청현황</dt>
									<dd>${hopCount}</dd>
								</dl>
							</div>
							<div class="more"><a href="/mypage/myIndex" title="이용현황 더보기"><span class="blind">더보기</span></a></div>
						</div>
						<!-- 미니 내정보 -->

					</c:when>
				</c:choose>


			</div>
		</section>


		<section id="section2">
			<div class="sectionGroup">

				<!-- 문화프로그램 시작 -->
				<div class="cultureWrap">
					<h5>도서관 문화행사</h5>
					<!-- PC용-->
					<div class="service-inner mobileHide">
						<div class="swiper-container swiper-service swiper-container-initialized swiper-container-horizontal" style="cursor: grab;">
							<div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">
								<div class="swiper-slide swiper-slide-active" style="width: 750px;">
									<ul class="cultureList clearfix">

										<c:forEach items="${nP}" var="nP">
										<li>
											<a href="/program/detail?proNum=${nP.proNum}">
												<dl>
													<dt>${nP.proPlace}
														<c:choose>
															<c:when test="${nP.recStatus eq '예정'}">
																<span class="ready">접수예정</span>
															</c:when>
															<c:when test="${nP.recStatus eq '접수중'}">
																<span class="ing">접수중</span>
															</c:when>
															<c:when test="${nP.recStatus eq '마감'}">
																<span class="end">마감</span>
															</c:when>
															<c:otherwise>
																<span class="end">에러</span>
															</c:otherwise>

														</c:choose>
															
															
															
													</dt>
													<dd class="title">${nP.proTitle}</dd>
													<dd class="info">
														<span>대상 :</span>${nP.target}
														<br>
														<span>접수 :</span>${nP.prsDate} ~ ${nP.prlDate}
													</dd>
												</dl>
											</a>
										</li>
										</c:forEach>
										
									</ul>
								</div>
							</div>
						<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					</div>
					<!-- //PC용 -->

				</div>
				<!-- 문화프로그램 끝 -->

				<!-- <script>
					$(function(){
						//문화행사 PC버전
						var serviceSwiper = new Swiper('.swiper-service', {
							paginationElement: 'a',
							paginationClickable: true,
							grabCursor: true,
							autoplay: {
								delay: 5000,
							},
							pagination: {
								el: '.swiper-pagination',
								clickable: true,
							},
						});
						$('.service-play').click(function(){
							$(this).hide();
							$('.service-stop').show();
							serviceSwiper.autoplay.start();
							return false;
						});
						$('.service-stop').click(function(){
							$(this).hide();
							$('.service-play').show();
							serviceSwiper.autoplay.stop();
							return false;
						});

						//문화행사 Mobile버전
						var serviceSwiperM = new Swiper('.swiper-Mservice', {
							slidesPerView: 2,
							spaceBetween: 20,
							freeMode: true,
							autoplay: {
								delay: 5000,
							},
							navigation: {
								nextEl: '.swiper-button-next',
								prevEl: '.swiper-button-prev',
							},
						});
					});
				</script> -->

				<!-- 달력 & 이용안내 -->
				<div class="guideWrap" style="margin-top: 35px;">
					<!-- 도서관일정 -->
						<div id="calendarWrap" class="schedule">
							<div style="display: flex; flex-direction: column; align-items: center; ">
								<div id="calendar" style="width: 390px;">
								</div>
								<div class="guide_info">
									<ul style="text-align: end;	margin-top: 5px;">
										<li><i class="all"><span class="blind">원형 아이콘</span></i> 휴관일</li>
										<li><a href="/guide/calendar">🟢도서관 일정 더보기</a></li>
									</ul>
								</div>
							</div>
						</div>
					<!-- //도서관일정 -->

					<!-- 이용안내 -->
					<div class="timeGuide">
						<h5>이용안내</h5>
						<div class="infoBox">
							<dl>
								<dt>열람실</dt>
								<dd>평일 08시~23시 / 주말 08시~23시</dd>
							</dl>
							<dl>
								<dt>대출자료실</dt>
								<dd>평일 09시~22시 / 주말 09시~17시</dd>
							</dl>
							<dl>
								<dt>어린이실</dt>
								<dd>평일 09시~18시 / 주말 09시~17시</dd>
							</dl>
						</div>
						<div class="more"><a href="/guide/time">
							<span class="blind">이용안내 더보기</span></a>
						</div>
					</div>
					<!-- //이용안내 -->
				</div>
				<!-- //달력 & 이용안내 -->
			</div>
		</section>

					
							

		<script>
			function fnAccessionBookDetail(speciesKey, isbn, pubFormCode){
				var form = document.mainBookForm;
				form.speciesKey.value = speciesKey;
				form.isbn.value = isbn;
				form.pubFormCode.value = pubFormCode;
				form.action = "/seoksu/accessionBookDetail.do";
				form.submit();
			}

			function fnPopularBookMonthDetail(speciesKey, isbn, pubFormCode){
				var form = document.mainBookForm;
				form.speciesKey.value = speciesKey;
				form.isbn.value = isbn;
				form.pubFormCode.value = pubFormCode;
				form.action = "/seoksu/popularBookMonthDetail.do";
				form.submit();
			}
		</script>
		<form id="mainBookForm" name="mainBookForm" method="get">
			<input type="hidden" name="speciesKey">
			<input type="hidden" name="isbn">
			<input type="hidden" name="pubFormCode">
		</form>
	</div>


<!-- 인기도서 추천도서 신착도서 대출베스트 -->
	<section id="section3">
		<h2 class="blind">섹션3</h2>
		<div class="sectionGroup">
		
			<!-- 북리스트 -->
			<div class="bookZone">
				<ul class="tab book clearfix">
					<li id="b1" class="on"><a href="javascript:popularBook()">공공도서관 인기도서</a></li>
					<li id="b2"><a href="javascript:recommendBook();">추천도서</a></li>
					<li id="b3"><a href="javascript:accessionBook()">신착도서</a></li>
				</ul>
				
				<div id="popularBook" class="bookListWrap">
					<ul class="bookList clearfix">
						<c:forEach items="${popularBook}" var="list1">
						<li>
							<span class="cover">
								<a href="./book/detail?isbn=${list1.isbn}">
									<img src="${list1.image}" alt="${list1.title}">
								</a>
							</span>
							<span class="txt">${list1.title}</span>
						</li>
						</c:forEach>
					</ul>
				</div>
			
				<div id="recommendBook" class="bookListWrap" style="display: none;">
					<ul class="bookList clearfix">
						<li>
							<span class="cover">
								<a href="./book/detail?isbn=9791160947045">
									<img src="https://image.aladin.co.kr/product/25965/67/cover200/k892737124_2.jpg" alt="사이보그가 되다">
								</a>
							</span>
							<span class="txt">사이보그가 되다</span>
						</li>
						<li>
							<span class="cover">
								<a href="./book/detail?isbn=9791165213183">
									<img src="https://image.aladin.co.kr/product/25415/58/cover200/k032633114_1.jpg" alt="IT 엔지니어를 위한 네트워크 입문 =Introduction to networks for IT engineers" onerror="javascript:fnNoImgBook(this);">
								</a>
							</span>
							<span class="txt">IT 엔지니어를 위한 네트워크 입문 =Introduction to networks for IT engineers</span>
						</li>
						<li>
							<span class="cover">
								<a href="./book/detail?isbn=9791191043723">
									<img src="https://image.aladin.co.kr/product/29396/69/cover/k402837513_1.jpg" alt="어느 날 내 죽음에 네가 들어왔다" onerror="javascript:fnNoImgBook(this);">
								</a>
							</span>
							<span class="txt">어느 날 내 죽음에 네가 들어왔다</span>
						</li>
						<li>
							<span class="cover">
								<a href="./book/detail?isbn=9791191825084">
									<img src="https://image.aladin.co.kr/product/27920/22/cover200/k122734505_2.jpg" alt="기묘한 미술관 :아름답고 서늘한 명화 속 미스터리" onerror="javascript:fnNoImgBook(this);">
								</a>
							</span>
							<span class="txt">기묘한 미술관 :아름답고 서늘한 명화 속 미스터리</span>
						</li>
						<li>
							<span class="cover">
								<a href="./book/detail?isbn=9788954646079">
									<img src="http://image.aladin.co.kr/product/15533/81/cover/k852533629_1.jpg" alt="바깥은 여름 :김애란 소설" onerror="javascript:fnNoImgBook(this);">
								</a>
							</span>
							<span class="txt">바깥은 여름 :김애란 소설</span>
						</li>
					</ul>
				</div>
			
				<div id="accessionBook" class="bookListWrap" style="display: none;">
					<ul class="bookList clearfix">
						<c:forEach items="${accessionBook}" var="list3" >
						<li>
							<span class="cover">
								<a href="./book/detail?isbn=${list3.isbn}">
									<img src="${list3.image}" alt="${list3.title}">
								</a>
							</span>
							<span class="txt">${list3.title}</span>
						</li>
						</c:forEach>
					</ul>
				</div>
			
				
			</div>

			<script>
				function popularBook() {
					
					$("#b1").addClass("on");
					$("#b2").removeClass("on");
					$("#b3").removeClass("on");

					$("#recommendBook").hide();
					$("#accessionBook").hide();
					$("#popularBook").fadeIn();
				}

				function recommendBook() {
					
					$("#b2").addClass("on");
					$("#b1").removeClass("on");
					$("#b3").removeClass("on");
					$("#accessionBook").hide();
					$("#popularBook").hide();
					$("#recommendBook").fadeIn();
				}

				function accessionBook() {

					$("#b3").addClass("on");
					$("#b2").removeClass("on");
					$("#b1").removeClass("on");
					$("#popularBook").hide();
					$("#recommendBook").hide();
					$("#accessionBook").fadeIn();
				}

			</script>

		</div>
	</section>
</div>
		


<!-- footer -->
<c:import url="./temp/footer.jsp"></c:import>
<!-- //footer -->

<script>
	let calendar;

	document.addEventListener('DOMContentLoaded', function() {
	  let data = '${cl}';
	  let id = "";
	  data = JSON.parse(data);
	  let calendarEl = document.getElementById('calendar');
		  calendar = new FullCalendar.Calendar(calendarEl, {
		  height: 340,
		  fixedWeekCount:false,
		  initialView: 'dayGridMonth',
		  events: data
	  })
	  
	  calendar.render();
  
	  });
  
		$("#calendar").on("click", ".fc-next-button", function(){
		console.log("dddd");
	   })
  
	   $("#calendar").on("click", ".fc-prev-button", function(){
		console.log("dddd");
	   })
  
	function curDate(date){
		  let yyyy = date.getFullYear();
		  let mm = date.getMonth()+1;
		  let dd = date.getDate();
		  mm = mm > 10 ? mm:'0' + mm;
		  dd = dd > 10 ? dd:'0' + dd;
		  let dateString = yyyy+'-'+mm+'-'+dd
		  return dateString;
  }
  </script>

<!-- <input type="hidden" name="pbInitNo1" id="pbInitNo1" value="0">
<input type="hidden" name="pbInitNo2" id="pbInitNo2" value="0">
<input type="hidden" name="pbInitNo3" id="pbInitNo3" value="0">
<input type="hidden" name="pbInitNo4" id="pbInitNo4" value="0">
<input type="hidden" name="pbInitNo5" id="pbInitNo5" value="0">
<iframe name="hiddenFrame" id="hiddenFrame" title="빈프레임" style="display:none;"></iframe> -->

</body>

</html>