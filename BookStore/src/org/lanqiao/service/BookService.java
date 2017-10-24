package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.BookDao;
import org.lanqiao.dao.ConsultDao;
import org.lanqiao.entity.Book;
import org.lanqiao.entity.Consult;
import org.lanqiao.utils.BookCreteria;
import org.lanqiao.utils.Page;

public class BookService {
	public int insert(Book b){
		 return new BookDao().insertBook(b);
	}

	public Page<Book> queryPage(BookCreteria bc,int getNotOnsale) {
		
		return new BookDao().getBooks(bc,getNotOnsale);
	}

	public Book get(int bookId) {
		//基本信息
		Book book =new BookDao().get(bookId);
		//咨询信息
		List<Consult> consults = new ConsultDao().getConsultsByBookId(book.getId());
		book.setConsults(consults);
		return book;
	}

	public int update(Book b) {
		return new BookDao().update(b);
	}
}
