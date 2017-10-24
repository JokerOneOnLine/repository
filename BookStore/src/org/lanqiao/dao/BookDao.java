package org.lanqiao.dao;

import java.math.BigDecimal;
import java.util.List;

import org.lanqiao.entity.Book;
import org.lanqiao.utils.BookCreteria;
import org.lanqiao.utils.MyUtils;
import org.lanqiao.utils.Page;

public class BookDao extends BaseDao<Book> {
	public static final int GETONSALE=0;
	public static final int GETNOTONSALE=1;
	public int insertBook(Book b) {
		String sql = "insert into Books values(?,?,?,?,?,?,?,?,?,?)";
		int id = MyUtils.getId();
		if (id == 0) {
			return 0;
		}
		int i = update(sql, id, b.getName(), b.getStock(), b.getPrice(), b.getSalesamount(), b.getPublishedby(),
				b.getSurface(), b.getOnsale(), b.getDetail(), b.getAuthor());
		if (i == 0) {
			return id;
		}
		return i;
	}

	public int delete(int id) {
		String sql = "delete from books where id = ?";
		int i = update(sql, id);
		return i;
	}

	public int update(Book b) {
		String sql = "update books set name=?,stock=?,price=?,salesamount=?,publishedby=?,surface=?,onsale=?,detail=?,author=?where id=?";
		int i = update(sql, b.getName(), b.getStock(), b.getPrice(), b.getSalesamount(), b.getPublishedby(),
				b.getSurface(), b.getOnsale(), b.getDetail(), b.getAuthor(), b.getId());
		return i;
	}

	public Book get(int bookId) {
		String sql = "select * from books where id=?";
		Book b = getT(sql, bookId);
		return b;
	}
	/**
	 * 查询全部，只查询上架的
	 * @param bc
	 * @param getOnSale
	 * @return
	 */
	public Page<Book> getBooks(BookCreteria bc, int getOnSale) {
		String sql1;
		String sql2;
		List<Book> books;
		int count;
		int totalPage;
		if (getOnSale == Book.ONSALE) {// 上架  concat(name,publishedby,author) 
			sql1 = "select count(*) from books where name || publishedby || author like '%" + bc.getKey()
					+ "%' and onsale = ? and (price between ? and ?) order by id";
			sql2 = " select * from (select rownum rn,b.* from(select * from books where name||publishedby||author like '%"
					+ bc.getKey()
					+ "%' and onsale = ? and (price between ? and ?) order by id) b where rownum <=?)where rn>?";
			BigDecimal bigDecimal = getE(sql1, getOnSale, bc.getMinPrice(), bc.getMaxPrice());
			count = bigDecimal.intValue();
			books = getTs(sql2, bc.getMinPrice(), bc.getMaxPrice(), bc.getPageSize() * bc.getPageNo(),
					(bc.getPageNo() - 1) * bc.getPageSize());
		
		} else if (getOnSale == Book.NOTONSALE) {// 下架
			sql1 = "select count(*) from books where name||publishedby||author like '%" + bc.getKey()
					+ "%' and onsale = ? and (price between ? and ?) order by id";
			sql2 = " select * from (select rownum rn,b.* from(select * from books where name||publishedby||author like '%"
					+ bc.getKey()
					+ "%' and onsale = ? and (price between ? and ?) order by id) b where rownum <=?)where rn>?";
			BigDecimal bigDecimal = getE(sql1, getOnSale, bc.getMinPrice(), bc.getMaxPrice());
			count = bigDecimal.intValue();
			books = getTs(sql2, bc.getMinPrice(), bc.getMaxPrice(), bc.getPageSize() * bc.getPageNo(),
					(bc.getPageNo() - 1) * bc.getPageSize());
			
		} else {// 全部
			sql1 = "select count(*) from books where name||publishedby||author like '%" + bc.getKey()
					+ "%'  and (price between ? and ?) order by id";
			sql2 = " select * from (select rownum rn,b.* from(select * from books where name||publishedby||author like '%"
					+ bc.getKey() + "%'  and (price between ? and ?) order by id) b where rownum <=?)where rn>?";
			BigDecimal bigDecimal = getE(sql1, bc.getMinPrice(), bc.getMaxPrice());
			count = bigDecimal.intValue();
			books = getTs(sql2, bc.getMinPrice(), bc.getMaxPrice(), bc.getPageSize() * bc.getPageNo(),
					(bc.getPageNo() - 1) * bc.getPageSize());
		}
		totalPage = count % bc.getPageSize() == 0 ? count / bc.getPageSize() : (count / bc.getPageSize() + 1);
		bc.setTotalPage(totalPage);
		
		Page<Book> page = new Page<Book>(books, bc);
		return page;
	}

	public Book getBookByItemId(int id) {
		String sql="select b.* from books b join items i on b.id=i.bookid where i.id = ?";
		Book book = getT(sql, id);
		return book;
	}
}