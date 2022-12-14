

const libNumL = $(".libNumL").val();
const libNumM = $(".libNumM").val();

console.log(libNumL);
console.log(libNumM);
//-------------------------------------------------
//디테일 페이지에서 대출신청 눌렀을 때
$("#LoanAlretBtn").click(function(){
	const bookLoanVO = {
		userName : userName,
		isbn : isbn,
		libNum : libNumL
	}
	
	console.log(bookLoanVO);
	
	$.ajax({
		type : "POST",
		url : "/book/loan",
		data:JSON.stringify(bookLoanVO),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success:function(data){
			switch (data){
				case 3:
					alert("도서 대출은 총 5권까지 가능합니다.")
				case 2:
					alert("해당 책을 이미 대출 중입니다.")
					break;
				case 1:
					let done = window.confirm("도서를 대출했습니다.\n마이페이지에서 확인하시겠습니까?");
					if(done){
						location.href="/mypage/book/loan";
					} else{
                        location.reload();
                    } 
				}
			},
			error:function(){
				console.log("ERROR");
			}
		})
	});
	
//-------------------------------------------------
//디테일 페이지에서 예약신청 눌렀을 때
console.log("!111111111111");
$("#ResAlretBtn").click(function(){
	const reVO = {
		isbn : isbn,
		userName : userName,
		enableDate : $(".enableDate").val()
	}
	$.ajax({
		type : "POST",
		url : "/book/reservation",
		data:JSON.stringify(reVO),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success:function(data){
			switch (data){
				case 3:
					alert("해당 책을 이미 대출 중입니다.")
					break;
				case 1:
					let done = window.confirm("도서를 예약했습니다.\n마이페이지에서 확인하시겠습니까?");
					if(done){
						location.href="/mypage/book/reservation";
						break;
					} else{
                        location.reload();
                        break;
                    } 
				}
			},
			error:function(){
				console.log("ERROR");
			}
		})
	});	
	
//-------------------------------------------------
//디테일 페이지에서 상호대차신청 눌렀을 때
$("#MuAlretBtn").click(function(){
	const bookLoanVO = {
		isbn : isbn,
		userName : userName,
		libNum : libNumM
	}
	
	console.log(bookLoanVO);
	
	$.ajax({
		type : "POST",
		url : "/book/mutual",
		data:JSON.stringify(bookLoanVO),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success:function(data){
			switch (data){
				case 2:
					alert("해당 책을 이미 대출 중입니다.")
					break;
				case 1:
					let check = window.confirm("도서를 상호대차 신청했습니다.\n마이페이지에서 확인하시겠습니까?");
					if(check){
						location.href="/mypage/book/mutual";
						break;
					} else{
                        location.reload(); 
                        break;
                    } 
				}
			},
			error:function(){
				console.log("ERROR");
			}
		})
	});	
	
//-------------------------------------------------
//마이페이지에서 연장신청 눌렀을 때

$(".ExAlretBtn").click(function(){
	
	const bookLoanVO = {
		isbn : $(this).attr("data-res-num"),
		userName : userName
	}
	
console.log("isbnC : ", bookLoanVO);
	$.ajax({
		type : "POST",
		url : "/book/extension",
		data:JSON.stringify(bookLoanVO),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success:function(data){
			switch (data){
				case 4:
					alert("예약자가 있어 대출 연장이 불가능합니다.")
					break;
				case 3:
					alert("대출 연장은 총 2번까지 가능합니다.")
					break;
				case 1:
					let check = window.confirm("대출 연장을 완료했습니다.");
					if(check){
						location.reload(); 
						break;
					} else{
                        location.reload(); 
                        break;
                    } 
				}
			},
			error:function(){
				console.log("ERROR");
			}
		})
	});		
//-------------------------------------------------
//마이페이지에서 반납신청 눌렀을 때

$(".ReturnAlretBtn").click(function(){
	const returnVO = {
		userName : userName,
		isbn : $(this).attr("data-res-isbn"),
		loanNum : $(this).attr("data-res-num")
	}
	
	console.log(returnVO);
	
	$.ajax({
		type : "POST",
		url : "/book/return",
		data:JSON.stringify(returnVO),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success:function(data){
			switch (data){
				case 3:
					let done = window.confirm("도서를 반납했습니다.");
					if(done){
						location.href="/mypage/book/loanHistory";
					} else{
                        location.reload();
                    }
				}
			},
			error:function(){
				console.log("ERROR");
			}
		})
	});

//-------------------------------------------------
//마이페이지에서 예약 취소신청 눌렀을 때

$(".ReDelAlretBtn").click(function(){
	const returnVO = {
		userName : userName,
		isbn : $(this).attr("data-res-isbn")
	}
	
	console.log(returnVO);
	
	$.ajax({
		type : "POST",
		url : "/book/reDelete",
		data:JSON.stringify(returnVO),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success:function(data){
			let done = window.confirm("도서 예약을 취소했습니다.");
				if(done){
					location.reload();
                }
            },
			error:function(){
				console.log("ERROR");
			}
		})
	});
