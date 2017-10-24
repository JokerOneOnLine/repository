package org.lanqiao.test;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.mail.SimpleEmail;
import org.junit.Test;
import org.lanqiao.dao.BookDao;
import org.lanqiao.entity.Book;
import org.lanqiao.entity.Card;
import org.lanqiao.service.CardSerice;
import org.lanqiao.utils.BookCreteria;
import org.lanqiao.utils.MyUtils;
import org.lanqiao.utils.Page;

public class TestMethod {
	@Test
	public void testCards() {
		List<Card> cards = new CardSerice().creatCards(100, 3);
		System.out.println(cards);
	}
	
	
	@Test
	public void testmd5(){
		String md5 = MyUtils.md5("ruide030463");
		System.out.println(md5);
	}
	
	@Test
	public void testPage(){
		BookCreteria bc =new BookCreteria(1, 2, 0, "", 0, 100);
		Page<Book> books = new BookDao().getBooks(bc, 2);
		System.out.println(books);
	}
	@Test
	public void testGetConn(){
		try {
			System.out.println(MyUtils.ds.getConnection());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	@Test
	public void update(){
		BookDao bdao= new BookDao();
		Book b = new Book("钢铁", 100, 98, 50, "人民", null, 2, "战斗", "奥斯特洛");
		b.setId(3);
		int i = bdao.update(b);
		
	}
	
}

