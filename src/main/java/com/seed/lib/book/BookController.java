package com.seed.lib.book;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seed.lib.book.like.BookLikeService;
import com.seed.lib.book.like.MbBookLikeVO;
import com.seed.lib.book.loan.BookLoanService;
import com.seed.lib.book.loan.BookLoanVO;
import com.seed.lib.book.loan.BookMutualLoanVO;
import com.seed.lib.book.loan.BookReservationVO;
import com.seed.lib.book.shelf.BookShelfService;
import com.seed.lib.book.shelf.BookShelfVO;
import com.seed.lib.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/book/*")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private BookLikeService bookLikeService;
	
	@Autowired
	private BookShelfService bookShelfService;
	
	@Autowired
	private BookLoanService loanService;
	
	//도서 디테일
	@GetMapping("detail")
	public ModelAndView getDetail (BookVO bookVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//도서 정보
		List<BookVO> vo = bookService.getDetail(bookVO);
		mv.addObject("vo", vo);
		
		//유저 개인 좋아요 정보
		MbBookLikeVO bookLikeVO = new MbBookLikeVO();
		//유저 정보
		MemberVO memberVO = new MemberVO();
		bookLikeVO.setIsbn(bookVO.getIsbn());
		bookLikeVO.setUserName(memberVO.getUserName());
		
		boolean isLikeExist = bookLikeService.getLikeExist(bookLikeVO);
		mv.addObject("isLikeExist", isLikeExist);
		
		//책 좋아요 총갯수
		int bookLike = bookLikeService.getBookLike(bookVO);
		mv.addObject("like", bookLike);
		
		//책꽂이 존재 유무
		BookShelfVO shelfVO = new BookShelfVO();
		boolean isShelfExist = bookShelfService.getShelfExist(shelfVO);
		mv.addObject("isShelfExist", isShelfExist);
		
		mv.setViewName("book/detail");
		
		return mv;
	}
	
//-------------------------------------------------------------------------------
	//대출 신청
	@ResponseBody
	@PostMapping("loan")
	public int setLoanAdd (@RequestBody BookLoanVO loanVO) throws Exception {
		int result = loanService.setLoan(loanVO);
		return result;
	}
		
		
	//예약 신청
	@ResponseBody
	@PostMapping("reservation")
	public int setReservationAdd (@RequestBody BookReservationVO reVO) throws Exception {
		int result = loanService.setReservation(reVO);
		return result;
	}
	
	//상호대차 신청
	@ResponseBody
	@PostMapping("mutual")
	public int setLoanAdd (@RequestBody BookMutualLoanVO muVO) throws Exception {
		int result = loanService.setMutual(muVO);
		return result;
	}
	
	
}
