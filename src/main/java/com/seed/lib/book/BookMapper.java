package com.seed.lib.book;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.seed.lib.util.DetailPager;

@Mapper
public interface BookMapper {
	
	// 도서 상세정보 출력
	public BookVO getBookInfo(BookVO bookVO)throws Exception;
	
	//도서관 보유 정보
	public BookVO getLibDetail (BookVO bookVO) throws Exception;
	
	//같은 장르 도서
	public List<BookVO> getSameCate (Long category) throws Exception;
	
	//같은 작가 도서
	public List<BookVO> getSameWriter (String writer) throws Exception;

}
