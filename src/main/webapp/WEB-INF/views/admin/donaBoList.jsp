<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.png">
    <title>기증도서 목록 : 씨앗도서관 ☘</title>

    <!-- ========== All CSS files linkup & sidebar ========= -->
    <c:import url="./temp/sidebar-css.jsp"></c:import>
    <style>
      #searchBtn{
        color: #219653 !important;
        background-color: #fff;
        border: 1px solid #dee2e6;
        border-radius: 0.3rem;
        padding: 0.25rem 0.5rem;
      }

      
    </style>
  </head>
  <body>
    <!-- ======== main-wrapper start =========== -->
    <main class="main-wrapper">
      <!-- ========== header start ========== -->
      <c:import url="./temp/header.jsp"></c:import>
      <!-- ========== header end ========== -->

      <!-- ========== table components start ========== -->
      <section class="table-components">
        <div class="container-fluid">
          <!-- ========== title-wrapper start ========== -->
          <div class="title-wrapper pt-30">
            <div class="row align-items-center">
              <div class="col-md-6">
                <div class="title mb-30">
                  <h2>기증도서 목록</h2>
                </div>
              </div>
              <!-- end col -->
              <div class="col-md-6">
                <div class="breadcrumb-wrapper mb-30">
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a href="./main">Dashboard</a>
                      </li>
                      <li class="breadcrumb-item"><a href="./donaBoList">기증도서 관리</a></li>
                      <li class="breadcrumb-item active" aria-current="page">
                        기증도서 목록
                      </li>
                    </ol>
                  </nav>
                </div>
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->
          </div>
          <!-- ========== title-wrapper end ========== -->
          <!-- ========== tables-wrapper start ========== -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                    <table class="table text-center">
                      <thead>
                        <tr>
                          <th class="index"><h6>🌱</h6></th>
                          <th style="width: 220px;"><h6>기증도서명</h6></th>
                          <th style="width: 100px;"><h6>저자</h6></th>
                          <th style="width: 100px;"><h6>출판사</h6></th>
                          <th><h6>신청자</h6></th>
                          <th><h6>신청일자</h6></th>
                          <th><h6>이메일<br>수신 여부</h6></th>
                          <form action="donaBoList" method="get" id="searchFrm">
                            <th style="width: 180px;"><h6>
                              <div class="row justify-content-center">
                                <div class="col-9">
                                  <div class="select-style-1" style="margin-bottom: 0;">
                                    <div class="select-position select-sm">
                                      <select class="searchValue" name="libNum" id="libNum" value="${param.libNum}">
                                        <option value="">신청 도서관</option>
                                        <option value="0">씨앗 도서관</option>
                                        <option value="1">새싹 도서관</option>
                                        <option value="2">쑥쑥 도서관</option>
                                        <option value="3">새봄 도서관</option>
                                        <option value="4">도란도란 도서관</option>
                                        <option value="5">뿌리 도서관</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </h6></th>
                            <th style="width: 160px;"><h6>
                              <div class="row justify-content-center">
                                <div class="col-9">
                                  <div class="select-style-1" style="margin-bottom: 0;">
                                    <div class="select-position select-sm">
                                      <select class="searchValue" name="searchKeyword" id="searchKeyword" value="${param.searchKeyword}">
                                        <option value="">신청 상태</option>
                                        <option value="0">신청 중</option>
                                        <option value="1">신청 취소</option>
                                        <option value="2">입고 완료</option>
                                        <option value="3">신청 반려</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </h6></th>
                            <th class="text-start" style="width: 50px;"><button id="searchBtn">조회</buttn></th>
                          </form>
                        </tr>
                        <!-- end table row-->
                      </thead>
                      <tbody>
                      	<tbody>
                          <c:forEach items="${don}" var="d" varStatus="a">
                          <tr>
                            <td>
                              <div class="index">
                                <p>${a.index + 1}</p>
                              </div>
                            </td>
                            <td class="min-width">
                              <p>${d.donTitle}</p>
                            </td>
                            <td class="min-width">
                              <p>${d.donWriter}</p>
                            </td>
                            <td class="min-width">
                              <p>${d.donPublisher}</p>
                            </td>
                            <td class="min-width">
                              <p>${d.userName}</p>
                            </td>
                            <td class="min-width">
                              <p>${d.donDate}</p>
                            </td>
                            <td class="min-width">
                              <p>${d.emailAgree}</p>
                            </td>
                            <td class="min-width">
                              <p>${d.libVO.libName}</p>
                            </td>
                            <td class="min-width">
                              <p>${d.statusVO.statName}</p>
                            </td>
                            <td>
                              <c:if test="${d.statusVO.statNum eq 0}">
                                <div class="action text-start" style="justify-content: center;">
                                  <!-- 수정버튼 -->
                                  <a href="/admin/donAdd?donNum=${d.donNum}" type="button" class="processBtn" data-hop-num="${d.donNum}">
                                    <i class="lni lni-check-box"></i>
                                  </a>
                                </div>
                              </c:if>
                            </td>
                          </tr>
                          </c:forEach>
                        <!-- end table row -->
                      </tbody>
                    </table>
                    <!-- end table -->
                  </div>
                  <nav aria-label="Page navigation">
                    <ul class="pagination" style=" justify-content:center;">
                      <c:if test="${pager.pre}">
	                      <li class="page-item">
	                        <a class="page-link text-success" href="./donaBoList?libNum=${pager.libNum}&searchKeyword=${pager.searchKeyword}&page=${pager.startNum-1}" aria-label="Previous">
	                          <span aria-hidden="true">&laquo;</span>
	                        </a>
	                      </li>
                      </c:if>
                      <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
	                      <li class="page-item"><a class="page-link text-success" href="./donaBoList?libNum=${pager.libNum}&searchKeyword=${pager.searchKeyword}&page=${i}">${i}</a></li>
                      </c:forEach>
                      <c:if test="${pager.next}">
	                      <li class="page-item">
	                        <a class="page-link text-success" href="./donaBoList?libNum=${pager.libNum}&searchKeyword=${pager.searchKeyword}&page=${pager.lastNum+1}" aria-label="Next">
	                          <span aria-hidden="true">&raquo;</span>
	                        </a>
	                      </li>
                      </c:if>
                    </ul>
                  </nav>
                </div>
                <!-- end card -->
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->
          </div>
          <!-- ========== tables-wrapper end ========== -->
        </div>
        <!-- end container -->
      </section>
      <!-- ========== table components end ========== -->

      <!-- ========== footer start =========== -->
      <c:import url="./temp/footer.jsp"></c:import>
      <!-- ========== footer end =========== -->
    </main>
    <!-- ======== main-wrapper end =========== -->

    <!-- ========= All Javascript files linkup ======== -->
    <c:import url="./temp/js.jsp"></c:import>
  </body>
</html>