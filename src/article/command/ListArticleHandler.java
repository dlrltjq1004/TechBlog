package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticlePage;
import article.service.ListArticleService;
import mvc.command.CommandHandler;

public class ListArticleHandler implements CommandHandler {

	private ListArticleService listService = ListArticleService.getInstance();
    
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		if(req.getParameter("category").equals("null"))
		{
			
			ArticlePage articlePage = listService.getArticleManagerPage(pageNo, req);
			req.setAttribute("articlePage", articlePage);
			return "/WEB-INF/view/articleManager.jsp";
		}
		
		System.out.println(req.getParameter("category"));
		ArticlePage articlePage = listService.getArticlePage(pageNo, req);
		req.setAttribute("articlePage", articlePage);
		return "/WEB-INF/view/listArticle.jsp";	
	}

}
