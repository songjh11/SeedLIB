<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/board.css">
    <link rel="stylesheet" href="/css/button.css">
    <link rel="stylesheet" href="/css/layout.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
		#searchBtn{
			width: 20%; 
			background-color: transparent;
		}
	</style>
<title>희망 도서 신청 조회</title>
</head>
<body>
	<!-- header -->
    <c:import url="../temp/header.jsp"></c:import>

<div id="contentGroup">
	<c:import url="../sideBar/FsideBar.jsp"></c:import>

<div id="contentcore">
<div class="naviandtitle">
	<h3>희망도서신청조회</h3>
	<div class="navi"><a href="../" title="홈으로 이동" class="home"><span class="blind">홈</span></a><i class="arrow"></i> 마이페이지 <i class="arrow"></i>희망도서신청조회</div>
</div>
<div id="contents" class="contentArea">


<div id="popblackBG"></div>
					<!--Real Contents Start-->
					<form name="searchForm" id="searchForm" method="get">
						<fieldset>
							<legend class="blind">게시글 검색 영역</legend>
							<!-- 게시판 검색 -->
							<div class="pageSearch">
								<div class="schForm" style="display: flex;">
									<select name="manageCd" id="manageCd" class="schSel">
										<option value="ALL">도서관 전체</option>
										
											<option value="MA">석수도서관</option>
										
											<option value="MI">만안도서관</option>
										
											<option value="MH">삼덕도서관</option>
										
											<option value="ME">박달도서관</option>
										
											<option value="MB">평촌도서관</option>
										
											<option value="MG">관양도서관</option>
										
											<option value="MC">비산도서관</option>
										
											<option value="MD">호계도서관</option>
										
											<option value="MJ">어린이도서관</option>
										
											<option value="MF">벌말도서관</option>
										
											<option value="MK">안양역스마트도서관</option>
										
											<option value="ML">동안구청스마트도서관</option>
										
											<option value="MM">범계스마트도서관</option>
										
											<option value="MN">인덕원역스마트도서관</option>
										
									</select>
									<select name="searchType" id="searchType" title="검색방법 선택" class="schSel1">
										<option value="0">도서명</option>
										<option value="1">저자</option>
										<option value="2">발행처</option>
									</select>
									<input hidden="hidden">
									<input type="text" name="searchKeyword" id="searchKeyword" onkeyup="enterkey()" value="" title="검색어 입력" class="schKwd2" placeholder="검색어를 입력해 주세요">
									<button type="button" id="searchBtn" class="btn input"><img src="/images/search.png"></button>
								</div>
							</div>
							<!-- //게시판 검색 -->
						</fieldset>
					</form>
					<!-- 게시판 목록 -->
					<div class="articleWrap">
						<ul class="article-list reserve">
							<c:forEach items="${hlist}" var="list">	
								<li>
									<p class="title">${list.hopTitle}</p>
									<ul class="info">
										<li>
											<span>저자: ${list.hopWriter}</span>
											<span>발행처: ${list.hopPublisher}</span>
										</li>
										<li>
											<span>신청도서관: ${list.hopLib}</span>
											<span>신청일: ${list.hopDate}</span>
											<span>신청상태: ${list.hopStat}</span>
										</li>										
										<li class="status"><a href="#btn" onclick="javascript:fnHopeBookCancelProc('106087679','141095'); return false;" class="tblBtn cncl">신청취소</a></li>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- //게시판 목록 -->
					<!-- 페이징 -->
					<div class="pagingWrap">
						<p class="paging">
							<span class="current">1</span>


						</p>
					</div>
					<!-- //페이징 -->
					<!--
					<dl class="linkBox">
						<dt class="txtArea">희망도서신청을 하려면 버튼을 누르세요</dt>
						<dd class="btnArea"><a href="/seoksu/hopeBookSearch.do" class="btn themeBtn">희망도서 신청하기</a></dd>
					</dl>
					 -->
					<!-- End Of the Real Contents-->
				</div>
			</div>
		</div>	
		<script src="/js/hopeList.js"></script>
</body>
</html>