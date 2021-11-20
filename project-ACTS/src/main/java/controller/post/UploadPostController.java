package controller.post;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Post;
import model.service.*;
//import model.service.UserManager;
public class UploadPostController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(UploadPostController.class);
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Post prod = new Post(
				request.getParameter("title"),
				request.getParameter("description"),
				request.getParameter("accountId")
				request.getParameterValues("status")
				request.getParameter("price")
				request.getParameterValues("pType")
				);
		try {
			PostManager manager = PostManager.getInstance();
			manager.create(prod);
			
			log.debug("Create ProductForm : {}", prod);
	        return "foward:/comm/main";
		}
		catch(Exception e) {
			request.setAttribute("uploadFail", true);
			request.setAttribute("exception", e);
			request.setAttribute("post", prod);
			return "foward:/post/uploadFail";
		}
		//return null;
	}
	
}
