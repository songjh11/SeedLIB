package com.seed.lib.book.loan;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seed.lib.book.BookLibVO;
import com.seed.lib.book.BookVO;
import com.seed.lib.book.LibVO;
import com.seed.lib.member.MemberMapper;
import com.seed.lib.member.MemberVO;
import com.seed.lib.util.BookLoanPager;
import com.seed.lib.util.DateUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class BookLoanService {
	
	@Autowired
	private BookLoanMapper loanMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	//가장 빠른 반납날짜 불러오기
	public Date getRtDate (Long isbn) throws Exception{
		return loanMapper.getRtDate(isbn);
	}
	
//----------------------------------------------------------------------	
	
		//연체일도 체크해야 함
	//대출 신청
	public int setLoan (BookLoanVO loVO) throws Exception{
		// 0이면 대출 가능 -> setLoan -> 저장 후 1 리턴
		// 2이면 해당 도서 대출 중 -> 불가
		//중복 대출, 예약, 상호대차 확인
		loVO.setRtStatus(1);
				
		int c = loanMapper.getBookLoan(loVO);
		
		int l = loanMapper.getLoanCount(loVO);
		int m = loanMapper.getMuCount(loVO);
		int r = loanMapper.getReCount(loVO);
		
		if(c < 5) {
			if(l==0 && m==0 && r==0) {
				Long isbn = loVO.getIsbn();
				Long libNum = loVO.getLibNum();
				
				//대출하기 SQL
				loanMapper.setLoan(loVO);
				
				//대출 횟수
				loanMapper.setCountUpdate(isbn);
				
				//대출 가능 권수
				loanMapper.setQuanUpdate(isbn, libNum);
				return 1;		
			}else {
				return 2;
			}			
		}else {
			return 3;			
		}
	}
	
	//목록
	public List<BookVO> getLoanList (BookLoanPager pager) throws Exception{
		Long totalCount = loanMapper.getCount(pager);
		pager.getNum(totalCount);
		pager.getRowNum();
		return loanMapper.getLoanList(pager);
	}
	
	//대출 연장 - 최대 2번
	public int setExtension (BookLoanVO loVO) throws Exception{
		//예약자 있으면 신청 불가능
		int pe = loanMapper.getRePe(loVO);
		if (pe == 0) {
			// 연장 횟수가 0, 1일때만 신청 가능
			//	-> setExtension -> 저장(연장횟수, 반납일) 리턴 -> 1 리턴
			// 2이면 불가능 -> 3 리턴
			int count = loanMapper.getExCount(loVO);
			if(count < 2) {
				loanMapper.setExtension(loVO);
				return 1;
			}else {
				return 3;
			}			
		}else {
			return 4;
		}
		
	}
	
	//대출한 책 권수
	public int getBookLoan (BookLoanVO loVO) throws Exception{
		return loanMapper.getBookLoan(loVO);
	}
	
	public int getLoanCount (BookLoanVO loVO) throws Exception{
		return loanMapper.getLoanCount(loVO);
	}

//-----------------------------------------------------------------------	
	
	//예약 후 대출로 변경되는 날 계산
	public int setEnableDate (BookReservationVO reVO) throws Exception{
		return loanMapper.setEnableDate(reVO);
	}
	
	//예약 신청
	public int setReservation (BookReservationVO reVO) throws Exception{
		// 1이면 해당 도서 대출 중 -> 예약 불가
		// 0이면 예약 가능 -> setReservation -> 저장 후 1 리턴
		// 2이면 해당 도서 예약 중 -> 불가
		BookLoanVO loVO = new BookLoanVO();
		loVO.setRtStatus(1);
		
		int l = loanMapper.getLoanCount(loVO);
		int m = loanMapper.getMuCount(loVO);
		int r = loanMapper.getReCount(loVO);
		
		if(l==0 && m==0 && r==0) {
			loanMapper.setReservation(reVO);
			return 1;
		}else {
			return 3;
		}
	}
	
	//목록
	public List<BookVO> getReList (BookLoanPager pager) throws Exception{
		Long totalCount = loanMapper.getCount(pager);
		pager.getNum(totalCount);
		pager.getRowNum();
		return loanMapper.getReList(pager);
	}
	
	//예약한 책 권수
	public int getReCount (BookLoanVO loVO) throws Exception{
		return loanMapper.getReCount(loVO);
	}
	
	//예약 취소
	public int setReDelete (BookReservationVO reVO) throws Exception{
		return loanMapper.setReDelete(reVO);
	}

//-----------------------------------------------------------------------	
	
	//상호대차
	public int setMutual (BookLoanVO loVO) throws Exception{
		// 0이면 대출 가능 -> Mapper -> 저장 후 1 리턴
		// 2이면 해당 도서 대출 중 -> 불가
		//중복 대출, 예약, 상호대차 확인
		loVO.setRtStatus(1);
		
		int c = loanMapper.getBookLoan(loVO);
		
		int l = loanMapper.getLoanCount(loVO);
		int m = loanMapper.getMuCount(loVO);
		int r = loanMapper.getReCount(loVO);
		
		if(c < 5) {
			if(l==0 && m==0 && r==0) {
				Long isbn = loVO.getIsbn();
				Long libNum = loVO.getLibNum();
				
				//상호대차
				loanMapper.setMutual(loVO);
				
				//대출 횟수
				loanMapper.setCountUpdate(isbn);
				
				//대출 가능 권수
				loanMapper.setQuanUpdate(isbn, libNum);
				return 1;
			}else {
				return 2;
			}
		}return 3;
	}
	
	//목록
	public List<BookVO> getMuList (BookLoanPager pager) throws Exception{
		Long totalCount = loanMapper.getCount(pager);
		pager.getNum(totalCount);
		pager.getRowNum();
		return loanMapper.getMuList(pager);
	}
	
	//상호대출 책 권수
	public int getMuCount (BookLoanVO loVO) throws Exception{
		return loanMapper.getMuCount(loVO);
	}
	
//-----------------------------------------------------------------------	

	//반납 - myreturn
	public int setReturn (MyReturnVO returnVO) throws Exception{
		BookLoanVO loanVO = new BookLoanVO();
		//반납 데이터 넣고
		loanMapper.setReturn(returnVO);
		
		//연체 여부 확인
		Date n = loanMapper.getNow(returnVO); //반납일
		Date o = loanMapper.isOver(returnVO); //대출만기일
		
		// n이 더 크면 true
		boolean m = n.after(o);
		
		loanVO.setRtStatus(0);
		loanVO.setLoanNum(returnVO.getLoanNum());
		
		if(!m) {
			//반납상태 0 / 연체 0
			loanVO.setOverDue(0);
			loanMapper.setRtOvUpdate(loanVO);
			return 3;
		
		}else {
			//연체함
			loanVO.setOverDue(1);
			loanMapper.setRtOvUpdate(loanVO);
			return 3;	
		}
	}
	
	public Date getNow (MyReturnVO returnVO) throws Exception{
		return loanMapper.getNow(returnVO);
	}
//-----------------------------------------------------------------------		
	public Long getCount (BookLoanPager pager) throws Exception{
		return loanMapper.getCount(pager);
	}

}
