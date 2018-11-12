package book.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import article.service.ArticlePage;
import article.service.ListArticleService;
import book.Service.BookListPage;
import book.Service.BookListService;
import mvc.command.CommandHandler;


public class SearchBookListHandler implements CommandHandler {

	private BookListService bookListService = new BookListService();
	
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String bookNoVal = req.getParameter("bookNo");
		int bookNo = 1;
		if(bookNoVal != null) {
			bookNo = Integer.parseInt(bookNoVal);
		}
		
		BookListPage bookListPage = bookListService.getBookListPage(bookNo);
		req.setAttribute("bookListPage", bookListPage);
		return "/booklist.jsp";
		
	}
	
}
