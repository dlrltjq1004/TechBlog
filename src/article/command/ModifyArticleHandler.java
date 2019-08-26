package article.command;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.ModifyArticleService;
import article.service.ModifyRequest;
import article.service.PermissionDeniedException;
import article.service.ReadArticleService;
import auth.service.User;
import mvc.command.CommandHandler;

public class ModifyArticleHandler implements CommandHandler {
	private static final String FORM_VIEW = "/WEB-INF/view/modifyForm.jsp";

	ReadArticleService readService = ReadArticleService.getInstance();
	private ModifyArticleService modifyService = ModifyArticleService.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) throws IOException {
		try {
			String noVal = req.getParameter("no");
			int no = Integer.parseInt(noVal);
			ArticleData articleData = readService.getArticle(no, false);
			User authUser = (User) req.getSession().getAttribute("authUser");
			if (!canModify(authUser, articleData)) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, 
					articleData.getArticle().getCategory(),
					articleData.getArticle().getCategory2(),
					articleData.getArticle().getRepresentative_image(),
					articleData.getArticle().getTitle(),
					articleData.getContent());

			req.setAttribute("modReq", modReq);
			return FORM_VIEW;
		} catch (ArticleNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

	private boolean canModify(User authUser, ArticleData articleData) {
		String writerId = articleData.getArticle().getWriter().getId();
		return authUser.getId().equals(writerId);
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		
		User authUser = (User) req.getSession().getAttribute("authUser");
		
	    String uploadPath = 
				req.getSession().getServletContext().getRealPath("Resource\\img\\uploade\\");
		System.out.println("절대경로 : " + uploadPath);
		
		int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한
		String originalName1 ="";
		String fileName1 ="";
		String fileType = "";
		String name ="";
		String subject ="";
		long fileSize;
	  MultipartRequest multi = null;

	  try {
		multi = new MultipartRequest(req,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		// form내의 input name="name" 인 녀석 value를 가져옴
		System.out.println("1-1");
		name = multi.getParameter("name");
		// name="subject" 인 녀석 value를 가져옴
		subject = multi.getParameter("subject");
		
		// 전송한 전체 파일이름들을 가져옴
		Enumeration files = multi.getFileNames();
	
		while(files.hasMoreElements()){
			// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
			String file1 = (String)files.nextElement(); // 파일 input에 지정한 이름을 가져옴

			// 그에 해당하는 실재 파일 이름을 가져옴
			originalName1 = multi.getOriginalFileName(file1);
	
			// 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
			// 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
			fileName1 = multi.getFilesystemName(file1);	
	
			// 파일 타입 정보를 가져옴
			fileType = multi.getContentType(file1);
	
			// input file name에 해당하는 실재 파일을 가져옴
			File file = multi.getFile(file1);
	;
			// 그 파일 객체의 크기를 알아냄
				/* fileSize = file.length(); */
			
	}
	  } catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	  String fullPath = "/Resource/img/uploade/"  + fileName1;
	  
	 
		
	  System.out.println("fullPath: " + fullPath + "content: " + multi.getParameter("smarteditor"));

		String noVal = multi.getParameter("no");
		int no = Integer.parseInt(noVal);

		ModifyRequest modReq = new ModifyRequest(authUser.getId(), no,
				multi.getParameter("category"),
				multi.getParameter("category2"),
				fullPath,
				multi.getParameter("title"),
				multi.getParameter("smarteditor"));
		req.setAttribute("modReq", modReq);

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		modReq.validate(errors);
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		try {
			modifyService.modify(modReq);
			return "/article/manager.do";
		} catch (ArticleNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch (PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
	}
}
