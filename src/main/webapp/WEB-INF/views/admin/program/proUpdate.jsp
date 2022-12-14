<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="/images/favicon.png">
    <title>뿌리깊은 관리자 : 씨앗도서관 ☘</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
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
                  <h2>문화 프로그램 수정</h2>
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
                        문화프로그램 수정
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
          <form action="./proUpdate" method="post" id="updateForm">
            <input type="hidden" name="proNum" value="${proVO.proNum}">
            <input type="hidden" name="recStatus" value="${proVO.recStatus}">

            <div class="row">
              <div class="col-lg-6">
                <!-- input style start -->
                <div class="card-style mb-30">
                  <h6 class="mb-25">프로그램 이름</h6>
                  <div class="input-style-3">
                    <input type="text" name="proTitle" id="proTitle" value="${proVO.proTitle}"/>
                    <span class="icon"><i class="lni lni-bulb"></i></span>
                  </div>
                  <h6 class="mb-25">프로그램 참여 인원 수</h6>
                  <div class="input-style-3">
                    <input type="number" name="total" value="${proVO.total}"/>
                    <span class="icon"><i class="lni lni-user"></i></span>
                  </div>
                  <!-- end input -->
                </div>
                <!-- end card -->
                <!-- ======= input style end ======= -->

                <!-- ======= select style start ======= -->
                <div class="card-style mb-30">
                  <div class="input-style-1">
                    <h6 class="mb-25">접수시작 날짜</h6>
                    <input type="date" id="data1" name="prsDate" value="${proVO.prsDate}"/>
                  </div>
                  <!-- end input -->
                  <div class="input-style-1">
                    <h6 class="mb-25">접수마감 날짜</h6>
                    <input type="date" id="data2" name="prlDate" value="${proVO.prlDate}"/>
                  </div>
                  <!-- end input -->
                  <div class="row">
                    <h6 class="mb-25">프로그램시작 시간</h6>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="input-style-1">
                        <input type="date" id="data3" name="psDt" value="${proVO.psDt}"/>
                      </div>
                      <!-- end input -->
                    </div>
                    <div class="col-lg-6">
                      <div class="input-style-2">
                        <input type="time" name="psTime" value='${proVO.psTime}'/>
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
                        <input type="date" id="data4" name="plDt" value="${proVO.plDt}"/>
                      </div>
                      <!-- end input -->
                    </div>
                    <div class="col-lg-6">
                      <div class="input-style-2">
                        <input type="time" name="plTime" value='${proVO.plTime}'/>
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
                        <input type="text" name="name" id="tName" value="${proVO.proTeacher}"/>
                        <!-- <input type="text" name="name" value="${fn:split(proVO.proTeacher,' ')}"/> -->
                        <span class="icon"><i class="lni lni-user"></i></span>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="select-style-1">
                        <div class="select-position">
                          <select name="teacher" id="teacher" teacher="${proVO.proTeacher}">
                            <option class="kindt" value="강사님">강사님</option>
                            <option class="kindt" value="작가님">작가님</option>
                            <option class="kindt" value="선생님">선생님</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- end select -->
                  <!-- ======= textarea style start ======= -->
                  <h6 class="mb-25">글내용</h6>
                  <div class="input-style-3">
                    <textarea name="proContents" id="proContents" rows="15"><c:out value="${proVO.proContents}"></c:out></textarea>
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
                      <select name="target" id="target" target="${proVO.target}">
                        <option class="kinda" value="선택안함">선택안함</option>
                        <option class="kinda" value="유아">유아</option>
                        <option class="kinda" value="어린이">어린이</option>
                        <option class="kinda" value="청소년">청소년</option>
                        <option class="kinda" value="성인">성인</option>
                        <option class="kinda" value="누구나">누구나</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                  <div class="select-style-1">
                    <h6 class="mb-25">행사구분 선택</h6>
                    <div class="select-position">
                      <select name="proCate" id="proCate" cate="${proVO.proCate}">
                        <option class="kinds" value="선택안함">선택안함</option>
                        <option class="kinds" value="정기강좌">정기강좌</option>
                        <option class="kinds" value="특강">특강</option>
                        <option class="kinds" value="이벤트">이벤트</option>
                        <option class="kinds" value="독서회">독서회</option>
                        <option class="kinds" value="기타">기타</option>
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
                      <button class="main-btn info-btn rounded-md btn-hover w-100 text-center" type="button" id="updateBtn">
                        수정하기
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
      let k = $("#proCate").attr("cate");

      const kinds = document.getElementsByClassName('kinds');
      for(let i=0;i<kinds.length;i++){
          if(k==kinds[i].value) {
              kinds[i].setAttribute('selected','selected');
              break;
          }
      }

      let kk = $("#target").attr("target");

      const kinda = document.getElementsByClassName('kinda');
      for(let i=0;i<kinda.length;i++){
          if(kk==kinda[i].value) {
              kinda[i].setAttribute('selected','selected');
              break;
          }
      }

      let name5 = $("#tName").val();
      let name6 = name5.split(" ");
      
      $("#tName").val(name6[0])

      $("#proTeacher").attr("teacher",name6[1]);


      let kkk = name6[1]
      const kindt = document.getElementsByClassName('kindt');
      for(let i=0;i<kindt.length;i++){
          if(kkk==kindt[i].value) {
              kindt[i].setAttribute('selected','selected');
              break;
          }
      }

      
      $("#updateBtn").on("click", function(){
        console.log($("#proTitle").val().length);
        let titleLength = $("#proTitle").val().length;
        if(titleLength>0&&$("#proContents").val().length>0) {

          if($("#data1").val().length>0&&$("#data2").val().length>0&&$("#data3").val().length>0&&$("#data4").val().length>0) {
            console.log("등록하자")
            $("#updateForm").submit();

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