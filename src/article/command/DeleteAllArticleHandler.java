package article.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.DeleteAriticleService;
import article.service.DeleteRequest;
import article.service.PermissionDeniedException;
import article.service.ReadArticleService;
import auth.service.User;
import mvc.command.CommandHandler;

public class DeleteAllArticleHandler implements CommandHandler {

private static final String FORM_VIEW = "/article/manager.do";
	
	ReadArticleService readService = ReadArticleService.getInstance();
	private DeleteAriticleService deleteService = DeleteAriticleService.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processSubmit(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) 
	throws IOException {
		try {
			String noVal = req.getParameter("no");
			int no = Integer.parseInt(noVal);
			ArticleData articleData = readService.getArticle(no, false);
			User authUser = (User) req.getSession().getAttribute("authUser");
			if (!canDelete(authUser, articleData)) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			DeleteRequest delReq = new DeleteRequest(authUser.getId(), no);
			
			req.setAttribute("delReq", delReq);
			return FORM_VIEW;
		} catch(ArticleNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
	
	private boolean canDelete(User authUser, ArticleData articleData) {
		String writerId = articleData.getArticle().getWriter().getId();
		return authUser.getId().equals(writerId);
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		User authUser = (User) req.getSession().getAttribute("authUser");
		String checkCount = req.getParameter("checkCount");
		String[] values = req.getParameterValues("checkbox");
		int size = Integer.parseInt(checkCount);
		for(int i = 0; i < size; i++ ) {
		
			System.out.println("checkCount: " + checkCount + " noVal: " + values[i]);
			
			int  no = Integer.parseInt(values[i]); 
		    DeleteRequest delReq = new DeleteRequest(authUser.getId(), no);
			req.setAttribute("delReq", delReq);
			
			Map<String, Boolean> errors = new HashMap<>();
			req.setAttribute("errors", errors);
			// delReq.validate(errors);
			
			if (!errors.isEmpty()) {
				return FORM_VIEW;
			}
			try {
				 deleteService.delete(delReq); 
				 
				
				// 모든 query가 성공했다면 return view = 관리 목록 페이지
				// 성공여부 체크 방법 = 쿼리 실행 횟수 size 쿼리 성공 수 와 같다면 success
			} catch (ArticleNotFoundException e) {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
				return null;
			} catch (PermissionDeniedException e) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			} 
		}
		
		return "/article/manager.do";
	
	}
}
