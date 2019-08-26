package article.command;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import article.model.Writer;
import article.service.WriteArticleService;
import article.service.WriteRequest;
import auth.service.User;
import mvc.command.CommandHandler;

public class WriteArticleHandler extends HttpServlet implements CommandHandler  {
	private static final String FORM_VIEW = "/WEB-INF/view/newArticleForm.jsp";
	private WriteArticleService writeService = WriteArticleService.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
//		res.setCharacterEncoding("utf-8");
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
        int category_check = 0;
        System.out.println("category_check: "+category_check);
		
		User user = (User) req.getSession(false).getAttribute("authUser");
		WriteRequest writeReq = createWriteRequest(user, req);
		writeReq.validate(errors);

		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		int newArticleNo = writeService.write(writeReq);
		req.setAttribute("newArticleNo", newArticleNo);
		
		/*
		 * System.out.println("category number: " + newArticleNo);
		 * System.out.println("카테고리2 value: " + writeReq.getCategory());
		 */
		// 프로젝트 글쓰기 일 경우
		/*
		 * if(writeReq.getCategory().equals("프로젝트")) {
		 * System.out.println("category check if in 카테고리2 == 프로젝트"); }
		 */
		return "/article/manager.do";
	}
	
	
	
	  private WriteRequest createWriteRequest(User user, HttpServletRequest req) {
		    String uploadPath = 
					req.getSession().getServletContext().getRealPath("Resource\\img\\uploade\\");
		    String videoPath = 
					req.getSession().getServletContext().getRealPath("Resource\\video\\");
			System.out.println("절대경로 : " + uploadPath);
			
			int maxSize = 5000 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 제한
			String originalName1 ="";
			String fileName1 ="";
			String fileType = "";
			String name ="";
			String subject ="";
			String multiFileName0 = "";
			String multiFileName1 = "";
			String multiFileName2 = "";
			String multiFileName3 = "";
			String multiFileName4 = "";
			ArrayList multiFileList = new ArrayList();
			long fileSize;
		  MultipartRequest multi = null;
		  try {
			multi = new MultipartRequest(req,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			// form내의 input name="name" 인 녀석 value를 가져옴
			/*
			 * name = multi.getParameter("name"); // name="subject" 인 녀석 value를 가져옴 subject
			 * = multi.getParameter("subject");
			 */
			
			/*
			 * String getFileCount = multi.getParameter("fileCount");
			 * System.out.println("FileCount: "+getFileCount);
			 * 
			 * if(getFileCount == null || getFileCount.equals("")){ getFileCount = "0"; }
			 */
			/*
			 * int filecount = Integer.parseInt(getFileCount);
			 * System.out.println("filecount: "+filecount);
			 * if(multi.getParameter("category").equals("프로젝트")) { multiFileName0 =
			 * multi.getParameter("fileName0"); multiFileName1 =
			 * multi.getParameter("fileName1"); multiFileName2 =
			 * multi.getParameter("fileName2"); multiFileName3 =
			 * multi.getParameter("fileName3"); multiFileName4 =
			 * multi.getParameter("fileName4"); }
			 */
			  
			// 전송한 전체 파일이름들을 가져옴
			Enumeration<?> files = multi.getFileNames();
			
			while(files.hasMoreElements()){
				// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
				String file1 = (String)files.nextElement(); // 파일 input에 지정한 이름을 가져옴
				// 그에 해당하는 실재 파일 이름을 가져옴
				
				/* originalName1 = multi.getOriginalFileName(file1); */
				
				// 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
				// 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
				fileName1 = multi.getFilesystemName(file1);	
				
				if(fileName1 != null) {
					multiFileList.add(fileName1);
				}
				
				// 파일 타입 정보를 가져옴
				/*
				 * fileType = multi.getContentType(file1); // input file name에 해당하는 실재 파일을 가져옴
				 * File file = multi.getFile(file1); // 그 파일 객체의 크기를 알아냄 filecount =
				 * file.length();
				 */
		}
		  } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  String imagesFullPath = "/Resource/img/uploade/"+fileName1;
		  
		/*
		 * if(multi.getParameter("category").equals("프로젝트")) { String vidioFullPath =
		 * "/Resource/img/uploade/"+multiFileList.get(0);
		 * System.out.println("vidioFullPath: " +vidioFullPath); }
		 */
		/*
		 * System.out.println("대표이미지: " +multiFileList.get(1)+ " 프로젝트 시연 영상: "
		 * +multiFileList.get(0)); System.out.println(" multiImage0 " +multiFileName0
		 * +" multiImage1 " +multiFileName1 +" multiImage2 " +multiFileName2
		 * +" multiImage3 " +multiFileName3 +" multiImage4 " +multiFileName4);
		 */
		  
		  System.out.println("fullPath: " + imagesFullPath);
		  
		  
		  return new WriteRequest(
				  new Writer(user.getId(), user.getName()),
				  multi.getParameter("category"), 
				  multi.getParameter("category2"),
				  imagesFullPath, 
				  multi.getParameter("title"),
				  multi.getParameter("smarteditor"));
		 
		  }
	  
	 
	
	
}
