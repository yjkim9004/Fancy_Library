package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import article.service.ArticleContentNotFoundException;
import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.ReadArticleService;

public class ReadArticleHandler implements CommandHandler {

	private ReadArticleService readService = new ReadArticleService();

	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
			String noVal = req.getParameter("no");
			int articleNum = Integer.parseInt(noVal);
			
			try {
				ArticleData articleData = readService.getArticle(articleNum, true);
				req.setAttribute("articleData", articleData);
				return "/WEB-INF/view/readArticle.jsp";
			} catch (ArticleNotFoundException | ArticleContentNotFoundException e) {
				req.getServletContext().log("no article", e);
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
				return null;
			}
	}
	
}



