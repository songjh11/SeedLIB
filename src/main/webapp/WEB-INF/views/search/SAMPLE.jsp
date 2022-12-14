<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>꿈이 싹트는 정원 : 씨앗도서관</title>
</head>
<body>
<div id="wrap">
    <!-- 헤더 -->
    <c:import url="../temp/header.jsp"></c:import>
    <!-- 헤더 -->

    <div id="container" class="sub">
		
        <div class="sVisualWrap">
            <div class="sVisual">
                <h3>신착자료</h3>
            </div>
        </div>
        <div id="contentGroup">
                    
        <!-- 사이드바 -->
        <c:import url="../sideBar/AsideBar.jsp"></c:import>
        <!-- 사이드바 -->

        <div id="contentcore">
            <div class="naviandtitle">
                <h3>신착자료</h3>
                <div class="navi">
                    <a href="/seoksu/index.do" title="홈으로 이동" class="home"><span class="blind">홈</span></a>
                    <i class="arrow"></i> 자료검색 <i class="arrow"></i>신착자료
                </div>
                <div class="snsFarm">
                    <ul class="snsBtnArea clearfix">
                        <li>
                            <a href="#snsGroup" id="sns" title="SNS 공유하기" class="snsShare"><span class="blind">SNS 공유하기</span></a>
                            <div id="snsGroup" class="snsList clearfix">
                                <a href="#sns1" id="sns1" title="단축URL 복사하기" class="snsUrl" onclick="fnShorturlCopy();"><span class="blind">단축URL</span></a>
                            </div>
                        </li>
                        <li class="mobileHide"><a href="#print" id="pprint" title="인쇄" class="snsPrint" onclick="javascript:fnPrintPopup('seoksu'); return false;"><span class="blind">현재화면 프린트</span></a></li>
                    </ul>
                </div>
            </div>
    
            <div id="contents" class="contentArea">
                        
                <!-- Contents Start-->
                <form id="searchForm" name="searchForm" method="get">
                    <input type="hidden" name="searchType" value="SIMPLE">
                    <div class="searchWrap">
                        <div class="searchFormWeb">

                            <div class="searchToparea">

                                <div class="searchBardiv">
                                    <div class="searchTit">통합자료</div>
                                        <div class="searchInputbox">
                                            <input type="text" id="totalSearchValue" name="searchKeyword" title="검색어를 입력하세요." value="" placeholder="검색어를 입력하세요." autocomplete="off">
                                            <input type="button" id="searchBtn" title="검색" class="unifiedSearchbtn">
                                        </div>

                                        <a href="/seoksu/searchDetail.do" class="btn input" title="고급검색 페이지 이동">고급검색</a>
                                    </div>
                                    <div class="innerSearch" style="visibility:hidden;">
                                        <input type="checkbox" id="innerSearch" class="check">
                                        <label for="innerSearch">결과 내 검색</label>
                                    </div>
                                    <div class="searchUtilWrap" id="liboption">
                                        <ol>
                                            <li><a href="javascript:;" id="liboptionicon" data-tab="sh_util03" class="sh_util03" title="축소됨">도서관 선택</a></li>
                                        </ol>
                                    </div>
                                </div>
                            </div>

                            

                        </div>
                    
                    </div>
                </form>
                <!-- End Of the Real Contents-->
                
            </div>
        </div>
    </div>






    <!-- footer -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!-- //footer -->
</div>
</body>
</html>