package book.Service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import db.dao.BookDAO;
import db.model.Book;
import Util.ConnectionProvider1;

public class BookListService {

	private BookDAO bookDao = new BookDAO(); 
	private int size = 10;
	
	public BookListPage getBookListPage(int bookNum) {
		try (Connection conn = ConnectionProvider1.getConnection()) {
				int total = bookDao.selectCount(conn);
				List<Book> content = bookDao.selectAllBook(conn, (bookNum -1) * size, size);
				return new BookListPage(total, bookNum, size, content);
			 
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
			 
		}
			
		}
	}

