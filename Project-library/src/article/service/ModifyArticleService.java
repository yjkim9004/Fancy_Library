package article.service;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.management.RuntimeErrorException;

import article.dao.ArticleDao;
import article.dao.ArticleContentDao;
import Util.jdbcUtil;
import article.model.Article;
import Util.ConnectionProvider;

public class ModifyArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();
	
	public void modify(ModifyRequest modReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Article article = articleDao.selectById(conn, modReq.getArticleNumber());
			if(article == null ) {
				throw new ArticleNotFoundException();
			}
			if(!canModify(modReq.getUserId(), article)) {
				throw new PermissionDeniedException();
			}
			articleDao.update(conn, modReq.getArticleNumber(), modReq.getTitle());
			contentDao.update(conn, modReq.getArticleNumber(), modReq.getContent());
			conn.commit();
		} catch(SQLException e) {
			jdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		
		} catch(PermissionDeniedException e) {
			jdbcUtil.rollback(conn);
			throw e;
		} finally {
			jdbcUtil.close(conn);
		}
	}
	
	private boolean canModify(String modifyingUserId, Article article) {
		return article.getWriter().getId().equals(modifyingUserId);
	}
	
}
