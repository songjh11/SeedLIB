<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="shortcut icon"
      href="assets/images/favicon.svg"
      type="image/x-icon"
    />
    <title>Form Elements | PlainAdmin Demo</title>
    <!-- ========== All CSS files linkup & sidear ========= -->
    <c:import url="../temp/sdeber-css.jsp"></c:import>
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
                      <li class="breadcrumb-item"><a href="./add">Forms</a></li>
                      <li class="breadcrumb-item active" aria-current="page">
                        문화 프로그램 개설
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
          <div class="form-elements-wrapper">
            <div class="row">
              <div class="col-lg-6">
                <!-- input style start -->
                <div class="card-style mb-30">
                  <h6 class="mb-25">프로그램 이름</h6>
                  <div class="input-style-3">
                    <input type="text" name="proName" placeholder="프로그램 이름을 입력하세요" />
                    <span class="icon"><i class="lni lni-bulb"></i></span>
                  </div>
                  <h6 class="mb-25">프로그램 참여 인원 수</h6>
                  <div class="input-style-3">
                    <input type="number" name="total" placeholder="참여인원 수를 입력하세요" />
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
                    <input type="date" name="prsDate" />
                  </div>
                  <!-- end input -->
                  <div class="input-style-1">
                    <h6 class="mb-25">접수마감 날짜</h6>
                    <input type="date" name="prlDate" />
                  </div>
                  <!-- end input -->
                  <div class="row">
                    <h6 class="mb-25">프로그램시작 시간</h6>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="input-style-1">
                        <input type="date" name="prlDate" />
                      </div>
                      <!-- end input -->
                    </div>
                    <div class="col-lg-6">
                      <div class="input-style-2">
                        <input type="time" name="psDate" />
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
                        <input type="date" name="prlDate" />
                      </div>
                      <!-- end input -->
                    </div>
                    <div class="col-lg-6">
                      <div class="input-style-2">
                        <input type="time" name="psDate" />
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
                        <input type="text" name="proTeacher" placeholder="강사님 이름을 입력하세요" />
                        <span class="icon"><i class="lni lni-user"></i></span>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="select-style-1">
                        <div class="select-position">
                          <select>
                            <option value="직접입력">직접입력</option>
                            <option value="강사">강사</option>
                            <option value="작가">작가</option>
                            <option value="선생님">선생님</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="select-style-1">
                    <h6 class="mb-25">장소 선택</h6>
                    <div class="select-position">
                      <select>
                        <option value="">선택안함</option>
                        <option value="석수도서관">석수도서관</option>
                        <option value="만안도서관">만안도서관</option>
                        <option value="평촌도서관">평촌도서관</option>
                        <option value="관양도서관">관양도서관</option>
                        <option value="호계도서관">호계도서관</option>
                        <option value="어린이도서관">어린이도서관</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                </div>
                <!-- end card -->
                <!-- ======= input style end ======= -->

                <!-- ======= select style start ======= -->
                <div class="card-style mb-30">
                  <div class="select-style-1">
                    <h6 class="mb-25">대상자 선택</h6>
                    <div class="select-position">
                      <select>
                        <option value="선택안함">선택안함</option>
                        <option value="유아">유아</option>
                        <option value="어린이">어린이</option>
                        <option value="청소년">청소년</option>
                        <option value="성인">성인</option>
                        <option value="누구나">누구나</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                  <div class="select-style-1">
                    <h6 class="mb-25">행사구분 선택</h6>
                    <div class="select-position">
                      <select>
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
                      <button
                        class="
                          main-btn
                          info-btn
                          rounded-md
                          btn-hover
                          w-100
                          text-center
                        "
                      >
                        등록하기
                        <span class="icon"><i class="lni lni-checkmark"></i></span>
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
          </div>
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
  </body>
</html>