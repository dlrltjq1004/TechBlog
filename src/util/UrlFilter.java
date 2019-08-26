package util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;;

public class UrlFilter {

	
	public void setURL(HttpServletRequest request, HttpServletResponse response, 
			String reqUrl , String resUrl) {
		
		
		if(reqUrl != resUrl) {
			try {
				response.sendRedirect(request.getContextPath() + resUrl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
