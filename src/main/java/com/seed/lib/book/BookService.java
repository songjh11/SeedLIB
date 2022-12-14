package com.seed.lib.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seed.lib.util.DetailPager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class BookService {

	@Autowired
	private BookMapper bookMapper;
	
	// 도서 상세정보
	public BookVO getBookInfo(BookVO bookVO) throws Exception{
		return bookMapper.getBookInfo(bookVO);
	}
	
	//도서관 보유 정보
	public BookVO getLibDetail (BookVO bookVO) throws Exception{
		return bookMapper.getLibDetail(bookVO);
	}
	
	//같은 장르 도서
	public List<BookVO> getSameCate (Long category) throws Exception{
		return bookMapper.getSameCate(category);
	}
	
	//같은 작가 도서
	public List<BookVO> getSameWriter (String writer) throws Exception{
		return bookMapper.getSameWriter(writer);
	}
}
