package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticlePage;
import article.service.ListArticleService;
import mvc.command.CommandHandler;

public class articleManagerHandler implements CommandHandler {

	private ListArticleService listService = ListArticleService.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		if(req.getParameter("search") != null) {
			
			String searchData = req.getParameter("search");
			System.out.println("search = " + searchData);
            ArticlePage articlePage = listService.getArticleManagerSearchPage(pageNo, req, searchData);
            req.setAttribute("articlePage", articlePage);
			return "/WEB-INF/view/articleManager.jsp";
			
			
		} else if(req.getParameter("sortArticle") != null) {
			System.out.println("sortArticle: " + req.getParameter("sortArticle"));
			
			if(req.getParameter("sortArticle").equals("Recently")) {
				System.out.println("search = null");
				ArticlePage articlePage = listService.getRecentlyArticleManagerPage(pageNo, req);
				req.setAttribute("articlePage", articlePage);
				return "/WEB-INF/view/articleManager.jsp?sortArticle=Recently";
			} else if(req.getParameter("sortArticle").equals("Old")) {
				System.out.println("search = null");
				ArticlePage articlePage = listService.getOldArticleManagerPage(pageNo, req);
				req.setAttribute("articlePage", articlePage);
				return "/WEB-INF/view/articleManager.jsp?sortArticle=Old";
			} else if(req.getParameter("sortArticle").equals("Category")) {
				System.out.println("search = null");
				ArticlePage articlePage = listService.getCategoryArticleManagerPage(pageNo, req);
				req.setAttribute("articlePage", articlePage);
				return "/WEB-INF/view/articleManager.jsp?sortArticle=Category";
			}
			
			return "/WEB-INF/view/articleManager.jsp";
		} else {
					
			System.out.println("search = null");
			ArticlePage articlePage = listService.getRecentlyArticleManagerPage(pageNo, req);
			req.setAttribute("articlePage", articlePage);
			return "/WEB-INF/view/articleManager.jsp";
		}
		
	
		
		
	}

}
