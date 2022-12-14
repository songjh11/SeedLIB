package com.seed.lib.book.shelf;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seed.lib.book.BookService;
import com.seed.lib.book.BookVO;
import com.seed.lib.book.loan.BookLoanVO;
import com.seed.lib.member.MemberVO;
import com.seed.lib.mypage.MypageService;
import com.seed.lib.util.ShelfBookPager;
import com.seed.lib.util.ShelfPager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shelf/*")
public class BookShelfController {
	
	@Autowired
	private BookShelfService bookShelfService;
	
	@Autowired
	private MypageService mypageService;
	
	//책꽂이 목록
		//마이페이지 - Pager O
		//shelf/list?userName=
	@GetMapping("list")
	public ModelAndView getShelfListP (HttpSession session, MemberVO memberVO, ShelfPager pager) throws Exception {
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
		ModelAndView mv = new ModelAndView();
	    
		if(context != null) {
			Authentication authentication = context.getAuthentication();
			memberVO  = (MemberVO)authentication.getPrincipal();
			memberVO = mypageService.getMyPage(memberVO);
			
			if(memberVO != null) {
				mv.addObject("member", memberVO);
				
				//책꽂이 목록
				pager.setUserName(memberVO.getUsername());
				List<BookShelfVO> li = bookShelfService.getShelfListP(pager);
				mv.addObject("li", li);
				
				//책꽂이 갯수
				Long count = bookShelfService.getCount(pager);
				mv.addObject("count", count);
				
				mv.addObject("pager", pager);
			}			
		}
		return mv;
	}
	
	//새 책꽂이 생성
		//동일한 이름 있을 시 생성 불가
		//shelf/newshelf?userName=
	@GetMapping("newShelf")
	public ModelAndView setNewShelf (BookShelfVO shelfVO, MemberVO memberVO, HttpSession session) throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
		ModelAndView mv = new ModelAndView();

		if(context != null) {
			Authentication authentication = context.getAuthentication();
		    memberVO  = (MemberVO)authentication.getPrincipal();
		    memberVO = mypageService.getMyPage(memberVO);
			
			
			if(memberVO != null) {
				mv.addObject("member", memberVO);
			}
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping("newShelf")
	public int setShelfAdd (@RequestBody BookShelfVO shelfVO, HttpSession session) throws Exception{
		// 0이면 mapper -> 값 0 | 1이면 1 리턴
		int result = bookShelfService.setShelfAdd(shelfVO);
		return result;
	}
		
	
	//책꽂이 삭제
		//마이페이지 - 책꽂이 상세페이지 - 삭제버튼
		//shelf/deleteShelf?shNum=
	@PostMapping("deleteShelf")
	@ResponseBody
	public int setShelfDelete (@RequestBody BookShelfVO shelfVO) throws Exception{
		int result = bookShelfService.setShelfDelete(shelfVO);
		return result;
	}
	
	
	//책꽂이 수정
		//마이페이지 - 책꽂이 상세페이지 - 수정
		//shelf/updateShelf?shNum=
	@PostMapping("updateShelf")
	public String setShelfUpdate (BookShelfVO shelfVO) throws Exception{
		BookShelfVO bookShelfVO = new BookShelfVO();
		bookShelfVO.setShName(bookShelfVO.getShName());
		bookShelfVO.setShMemo(bookShelfVO.getShMemo());
		return "redirect:./list";
	}
	
	
	//책꽂이에 책 저장하기 버튼 눌렀을 떄
		//책꽂이 목록 불러와서 책 저장하기
		//동일한 책 있으면 저장 불가
		//shelf/addBook?isbn= &userName=
	@GetMapping("addBook")
	public ModelAndView setBookAdd (String userName, Long isbn, MemberVO memberVO, HttpSession session) throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
		ModelAndView mv = new ModelAndView();

		if(context != null) {
			Authentication authentication = context.getAuthentication();
		    memberVO  = (MemberVO)authentication.getPrincipal();
		    memberVO = mypageService.getMyPage(memberVO);
			
			BookPickVO pickVO = new BookPickVO();
			
			if(memberVO != null) {
				mv.addObject("member", memberVO);
				
				pickVO.setIsbn(isbn);
				mv.addObject("isbn", isbn);
			}
		}
		
		//저장 화면에 제목 띄우는 용
		String title = bookShelfService.getBookTitle(isbn);
		mv.addObject("title", title);
		
		//유저명으로 책꽂이 목록 불러오기
		List<BookShelfVO> ar = bookShelfService.getShelfList(userName);
		mv.addObject("list", ar);
		
		return mv;
	}
	
	@ResponseBody
	@PostMapping("addBook")
	public int setBookAdd (@RequestBody BookPickVO pickVO) throws Exception{
		int result = bookShelfService.setBookAdd(pickVO);
		return result;
	}
	
	//책꽂이에서 책 삭제
		//마이페이지 - 책꽂이 상세페이지 - 선택 삭제 버튼
	@PostMapping("deleteBook")
	@ResponseBody
	public int setBookDelete (@RequestBody BookPickVO pickVO) throws Exception{
		int result = bookShelfService.setBookDelete(pickVO);
		return result;
	}
	
	
	//책꽂이 상세(책꽂이에 저장된 책 목록)
		//shelf/bookList?shNum=
	@GetMapping("bookList")
	public ModelAndView getBookList (Long num, HttpSession session, MemberVO memberVO, ShelfBookPager pager) throws Exception{
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
		ModelAndView mv = new ModelAndView();

		if(context != null) {
			Authentication authentication = context.getAuthentication();
		    memberVO  = (MemberVO)authentication.getPrincipal();
		    memberVO = mypageService.getMyPage(memberVO);
	
			mv.addObject("member", memberVO);
		}	
			//책 리스트
			List<BookVO> ar = bookShelfService.getBookList(pager);
			mv.addObject("list", ar);
			
			//갯수
			Long count = bookShelfService.getBookCount(pager);
			mv.addObject("count", count);
			
			mv.addObject("pager", pager);
		
		return mv;
	}
}
