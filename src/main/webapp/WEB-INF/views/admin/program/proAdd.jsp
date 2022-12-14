<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="/images/favicon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>뿌리깊은 관리자 : 씨앗도서관 ☘</title>
    
    <!-- ========== All CSS files linkup & sidebar ========= -->
    <c:import url="../temp/sidebar-css.jsp"></c:import>
    
  </head>
  <body>
    <!-- ======== main-wrapper start =========== -->
    <main class="main-wrapper">
      <!-- ========== header start ========== -->
      <c:import url="../temp/header.jsp"></c:import>
      <!-- ========== header end ========== -->

      <!-- ========== tab components start ========== -->
      <section class="tab-components">
        <div class="container-fluid">
          <!-- ========== title-wrapper start ========== -->
          <div class="title-wrapper pt-30">
            <div class="row align-items-center">
              <div class="col-md-6">
                <div class="title mb-30">
                  <h2>문화 프로그램 개설</h2>
                </div>
              </div>
              <!-- end col -->
              <div class="col-md-6">
                <div class="breadcrumb-wrapper mb-30">
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a href="../main">Dashboard</a>
                      </li>
                      <li class="breadcrumb-item"><a href="./proList">문화프로그램 관리</a></li>
                      <li class="breadcrumb-item active" aria-current="page">
                        문화프로그램 개설
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

          <!-- ========== form-elements-wrapper start ========== -->
          <form action="./proAdd" id="addForm" method="post">
            <div class="row">
              <div class="col-lg-6">
                <!-- input style start -->
                <div class="card-style mb-30">
                  <h6 class="mb-25">프로그램 이름</h6>
                  <div class="input-style-3">
                    <input type="text" id="proTitle" name="proTitle" placeholder="프로그램 이름을 입력해 주세요" />
                    <span class="icon"><i class="lni lni-bulb"></i></span>
                  </div>
                  <div class="select-style-1">
                    <h6 class="mb-25">프로그램 참여 인원 선택</h6>
                    <div class="select-position">
                      <select name="total">
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                        <option value="25">25</option>
                        <option value="30">30</option>
                        <option value="35">35</option>
                        <option value="40">40</option>
                        <option value="45">45</option>
                        <option value="50">50</option>
                      </select>
                    </div>
                  </div>
                  <!-- end input -->
                </div>
                <!-- end card -->
                <!-- ======= input style end ======= -->

                <!-- ======= select style start ======= -->
                <div class="card-style mb-30">
                  <div class="input-style-1">
                    <h6 class="mb-25">접수시작 날짜</h6>
                    <input type="date" id="data1" name="prsDate" />
                  </div>
                  <!-- end input -->
                  <div class="input-style-1">
                    <h6 class="mb-25">접수마감 날짜</h6>
                    <input type="date" id="data2" name="prlDate" />
                  </div>
                  <!-- end input -->
                  <div class="row">
                    <h6 class="mb-25">프로그램시작 시간</h6>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="input-style-1">
                        <input type="date" id="data3" name="psDt" />
                      </div>
                      <!-- end input -->
                    </div>
                    <div class="col-lg-6">
                      <div class="input-style-2">
                        <input type="time" name="psTime" />
                      </div>
                      <!-- end input -->
                    </div>
                  </div>
                  <div class="row">
                    <h6 class="mb-25">프로그램끝나는 시간</h6>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="input-style-1">
                        <input type="date" id="data4" name="plDt" />
                      </div>
                      <!-- end input -->
                    </div>
                    <div class="col-lg-6">
                      <div class="input-style-2">
                        <input type="time" name="plTime" />
                      </div>
                      <!-- end input -->
                    </div>
                  </div>
                  <!-- end input -->
                </div>
                <!-- end card -->
                <!-- ======= input style end ======= -->
              </div>
              <!-- end col -->

              <div class="col-lg-6">
                <!-- input style start -->
                <div class="card-style mb-30">
                  <div class="row">
                    <h6 class="mb-25">강사님 이름</h6>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="input-style-3">
                        <input type="text" name="name" placeholder="강사님 이름을 입력해 주세요" />
                        <span class="icon"><i class="lni lni-user"></i></span>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="select-style-1">
                        <div class="select-position">
                          <select name="teacher">
                            <option value="강사님">강사님</option>
                            <option value="작가님">작가님</option>
                            <option value="선생님">선생님</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- end select -->
                  <!-- ======= textarea style start ======= -->
                  <h6 class="mb-25">글내용</h6>
                  <div class="input-style-3">
                    <textarea placeholder="행사 내용을 입력해 주세요" id="proContents" name="proContents" rows="15"><c:out value="${proContents}"></c:out></textarea>
                    <span class="icon"
                      ><i class="lni lni-text-format"></i
                    ></span>
                  </div>
                  <!-- ======= textarea style end ======= -->
                </div>
                <!-- end card -->
                <!-- ======= input style end ======= -->

                <!-- ======= select style start ======= -->
                <div class="card-style mb-30">
                  <div class="select-style-1">
                    <h6 class="mb-25">대상자 선택</h6>
                    <div class="select-position">
                      <select name="target">
                        <option value="누구나">누구나</option>
                        <option value="유아">유아</option>
                        <option value="어린이">어린이</option>
                        <option value="청소년">청소년</option>
                        <option value="성인">성인</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                  <div class="select-style-1">
                    <h6 class="mb-25">행사구분 선택</h6>
                    <div class="select-position">
                      <select name="proCate">
                        <option value="선택안함">선택안함</option>
                        <option value="정기강좌">정기강좌</option>
                        <option value="특강">특강</option>
                        <option value="이벤트">이벤트</option>
                        <option value="독서회">독서회</option>
                        <option value="기타">기타</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                  <div class="col-12">
                    <div
                      class="
                        button-group
                        d-flex
                        justify-content-center
                        flex-wrap
                      "
                    >
                      <button class="main-btn info-btn rounded-md btn-hover w-100 text-center" id="addBtn" type="button">
                        <b>개설하기</b>
                        <span class="icon"><i class="lni lni-checkmark ms-1"></i></span>
                      </button>
                    </div>
                  </div>
                </div>
                <!-- end card -->
                <!-- ======= select style end ======= -->
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->
          </form>
          <!-- ========== form-elements-wrapper end ========== -->
        </div>
        <!-- end container -->
      </section>
      <!-- ========== tab components end ========== -->

      <!-- ========== footer start =========== -->
      <c:import url="../temp/footer.jsp"></c:import>
      <!-- ========== footer end =========== -->

    </main>
    <!-- ======== main-wrapper end =========== -->

    <!-- ========= All Javascript files linkup ======== -->
    <c:import url="../temp/js.jsp"></c:import>

    <script>

      
      $("#addBtn").on("click", function(){
        
        if($("#proTitle").val().length>0&&$("#proContents").val().length>0) {

          if($("#data1").val().length>0&&$("#data2").val().length>0&&$("#data3").val().length>0&&$("#data4").val().length>0) {
            console.log("등록하자")
            $("#addForm").submit();

          } else {
            alert("일정 정보를 입력해주세요")
          }
          
        } else {
          alert("필수 요소를 입력해주세요");
        }
      })
    </script>
  </body>
</html>