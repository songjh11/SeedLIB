<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/board.css">
    <link rel="stylesheet" href="/css/button.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/sub.css">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <style>
        .contentsGroup {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .lockerArea {
            width: 100%;
            margin-left: 25px;
            margin-top: 50px;
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .locker {
            display: block;
            font-size: 30px;
            font-weight: bold;
        }

        .btnArea {
            margin-top: 30px;
        }

        .tbl th{
            padding: 0 5px;
            font-size: 16px;
        }

        .tbl td{
            padding: 0 5px;
            font-size: 16px;
        }

        .tabTr{
            line-height: 45px;
        }

        hr {
        width: 87%;
        border : 0px;
        border-top: 0.5px solid #cfcece; 
        margin-bottom: 20px;
        }

        #rentBtn{
            border-radius: 5px;
            text-shadow: 1px 1px 3px rgb(0 0 0 / 30%);
            font-size: 18px !important;
        }

    </style>

    <title>????????? ?????? : ??????????????? ??????</title>
</head>
<body>
    <input type="hidden" id="userName" value="${memberVO.userName}">
    <input type="hidden" id="email" value="${memberVO.email}">
    <input type="hidden" id="phone" value="${memberVO.phone}">
    <input type="hidden" id="imp" value="${imp}">
    <div class="contentsGroup">
        <div class="lockerArea">
            <span class="locker" style="margin-bottom: 10px;">???? ??? ??? ??? ??? ????</span>
            <hr style="width: 35%;">  
            <span id="lockerNum" style="font-size: 25px;" class="locker" value="${lockerNum}">????????? ?????? : ${lockerNum} </span>
        </div>
        <div>
            <table class="tbl" style="width: 550px;">
                <thead>
                    <tr>
                        <th style="width: 165px;">?????? ?????? ??????</th>
                        <th style="width: 165px;">?????? ?????? ??????</th>
                        <th>??? ?????? ??????</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tabTr">
                        <td style="width: 165px;"><input type="date" id="stDate" name="stDate" min=""></td>
                        <td style="width: 165px;"><input type="date" style="width: 141px;" id="enDate" name="enDate" min="" max=""></td>
                        <td><input type="text" id="price" name="price" readonly style="text-align: end;" value="0"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <hr style="margin-top: 30px;">   
        <div>
            <div style="margin-bottom: 15px;">
                <span style="font-size: 17px;">??? ?????? ??????</span>
            </div>
            <table class="tbl" style="width: 550px;">
                <thead>
                    <tr>
                        <th scope="col" style="padding: 0 15px;">1??? ?????? ??????</th>
                        <th scope="col">??? ???</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tabTr">
                        <td style="text-align: center;">500???</td>
                        <td style="text-align: center;"><span style="color:#ff0000; padding: 0 5px;">?????? ?????? ??? ?????? ???????????? ??????</span></td>
                    </tr>
                 </tbody>
            </table>
        </div>
        <div style="margin-top: 10px;">
            <ul>
                <li>??? 1??? 1??? ????????? ?????? ??????, ???????????? ??????????????? ?????? ??? ??? ????????????.</li>
                <li>??? ?????? ????????? ???????????? ???????????? ???????????? ?????????.</li>
                <li>??? ?????? ?????? ?????? ?????? ???????????? ???????????? ?????? ?????? ???????????? ?????? ??? ????????????.(?????? ??????, ??????)</li>
            </ul>
        </div>
        <div class="btnArea">
            <button type="button" class="btn themeBtn" id="rentBtn">????????? ??????</button>
        </div>
    </div>

    <script>
        function curDate(date){
            let yyyy = date.getFullYear();
            let mm = date.getMonth()+1;
            let dd = date.getDate();
            mm = mm > 10 ? mm:'0' + mm;
            dd = dd > 10 ? dd:'0' + dd;
            let dateString = yyyy+'-'+mm+'-'+dd
            return dateString;
        }
        
        let date = new Date();
        $("#stDate").attr("min", curDate(date));
        const IMP = window.IMP;
        let initImp = $("#imp").val();
        IMP.init(initImp);


    </script>
    <script>
    </script>
   <script src="/js/lockerRent.js"></script> 
</body>
</html>