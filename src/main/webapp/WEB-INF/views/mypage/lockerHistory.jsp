<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script
			src="https://code.jquery.com/jquery-3.3.1.min.js"
			integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			crossorigin="anonymous">
	</script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<style>
		#searchBtn{
			width: 20%; 
			background-color: transparent;
		}

		.cncl{
			color: #666;
			background-color: #e9e9e9;
			border: 1px solid #e9e9e9;
			font-size: 1.063em;
			min-width: 110px;
			padding: 6px 15px;
		}
	</style>
<title>사물함 대여 조회 : 씨앗도서관 ☘️ </title>
</head>
<body>
	<!-- header -->
    <c:import url="../temp/header.jsp"></c:import>
<div id="container" class="sub">	
	<div class="sVisualWrap">
	<div class="sVisual">
		<h3>신청하기</h3>
	</div>
	</div>
<div id="contentGroup">
	<c:import url="../sideBar/FsideBar.jsp"></c:import>

<div id="contentcore">
<div class="naviandtitle">
	<h3>사물함 대여 조회</h3>
	<div class="navi"><a href="../" title="홈으로 이동" class="home"><span class="blind">홈</span></a><i class="arrow"></i> 마이페이지 <i class="arrow"></i>사물함 대여 조회</div>
</div>
<div id="contents" class="contentArea">


<div id="popblackBG"></div>
					<!--Real Contents Start-->
					<!-- 게시판 목록 -->
					<div class="articleWrap">
						<ul class="article-list reserve">
							<c:choose>
								<c:when test="${not empty locker}">
								</c:when>
								<c:when test="${empty locker}">
									<c:choose>
										<c:when test="${not empty pager.searchKeyword}">
								 			<li>[${pager.searchKeyword}] 의 검색 결과가 없습니다</li>
										</c:when>
										<c:when test="${empty pager.searchKeyword}">
								 			<li style="text-align: center;">사물함 대여 내역이 없습니다</li>
										</c:when>
									</c:choose>		
								</c:when>
							</c:choose>
							<c:forEach items="${locker}" var="list">	
								<li>
									<input type="hidden" id="merchant_uid${list.lockerNum}" merchant_uid="${list.merchant_uid}">
									<p class="title">사물함 번호: ${list.lockerNum}</p>
									<ul class="info">
										<li>
											<span id="stDate${list.lockerNum}" stDate="${list.stDate}">대여 시작일: ${list.stDate}</span>
											<span id="enDate${list.lockerNum}" enDate="${list.enDate}">대여 종료일: ${list.enDate}</span>
											<c:choose>	
												<c:when test="${list.rentStat eq 0}">
													<span>대여 상태: 대여 중</span>
												</c:when>
												<c:when test="${list.rentStat eq 1}">
													<span>대여 상태: 대여 종료</span>
												</c:when>
											</c:choose>
										</li>
										<li>
											<span id="amount${list.lockerNum}" amount="${list.amount}">결제 금액: ${list.amount}</span>
										</li>
										<li>
												<c:choose>	
												<c:when test="${empty list.moneyBackVO}">
													<span></span>
												</c:when>
												<c:when test="${not empty list.moneyBackVO}">
													<span>환불일: ${list.moneyBackVO.backDate}</span>
													<span>환불 금액 : ${list.moneyBackVO.backPrice}</span>
												</c:when>
											</c:choose>
											</li>
										<c:if test="${list.rentStat eq 0}">
											<li class="status"><button class="cncl" data-num-cncl="${list.lockerNum}">환불 요청</button></li>
										</c:if>										
									</ul>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- //게시판 목록 -->
					<!-- 페이징 -->
					<c:if test="${not empty locker}">
                        <div class="pagingWrap">
                            <p class="paging">
                                <a href="./lockerHistory?libNum=${pager.libNum}&searchKeyword=${pager.searchKeyword}&page=${pager.startNum-1}" class="btn-paging prev ${pager.pre?'':'disabledLink'}"><span class="blind">이전 3개 보기</span></a>
                                <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                                    <a href="./lockerHistory?libNum=${pager.libNum}&searchKeyword=${pager.searchKeyword}&page=${i}" id="ppaaggee${i}">${i}</a>
                                </c:forEach>
                                <a href="./lockerHistory?libNum=${pager.libNum}&searchKeyword=${pager.searchKeyword}&page=${pager.lastNum+1}" class="btn-paging next ${pager.next?'':'disabledLink'}"><span class="blind">다음 3개 보기</span></a>
                            </p>
                        </div>
                        </c:if>
					<!-- //페이징 -->
					<!-- End Of the Real Contents-->
				</div>
			</div>
		</div>	
</div>		
<!-- footer -->
<c:import url="../temp/footer.jsp"></c:import>
<!-- //footer -->
		<script src="/js/lockerList.js"></script>
		<script>
			try {
				// 페이징 활성화 
					// 화살표들 disabledLink 클래스 걸려있으면 누를수없게 a태그에서 href 속성을 삭제시킴
					let disables = document.querySelectorAll(".disabledLink")
					disables.forEach(element => {
						element.removeAttribute('href');
					});

					let urll = window.location.href;
					let urlnn = urll.lastIndexOf('=')+1;
					urllastt = urll.substring(urlnn);

					//파라미터로 받은 페이지 번호에 해당하는 id를 찾아서 걔를 초록색으로 바꿈.
					let ppaaggee = document.querySelector('#'+"ppaaggee"+'${pager.page}');

					ppaaggee.style.background="#9be15d";
					ppaaggee.style.color="#fff";
				// 페이징 활성화 
				
			} catch (error) {
				
			}
		</script>
</body>
</html>