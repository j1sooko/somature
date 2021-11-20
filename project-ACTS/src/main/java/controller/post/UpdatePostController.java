package controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import model.service.UserManager;
import model.service.PostManager;
import model.Post;
import model.User;

public class UpdatePostController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(UpdatePostController.class);
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Post prod = new Post(
				Integer.parseInt(request.getParameter("postId")),
				request.getParameter("title"),
				request.getParameter("status"),
				Integer.parseInt(request.getParameter("price")),
				request.getParameter("description"),
				request.getParameter("accountId"),
				Integer.parseInt(request.getParameter("curUserId"))
				);
		try {
			PostManager manager = PostManager.getInstance();
			manager.create(prod);
			
			log.debug("Update Post : {}", prod);
	        return "foward:/post/updatePost";
		}
		catch(Exception e) {
			request.setAttribute("uploadFail", true);
			request.setAttribute("exception", e);
			request.setAttribute("product", prod);
			return "redirect:/post/postList";
		}
	}

}
