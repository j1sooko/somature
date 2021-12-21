package controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Post;
import model.User;
import model.dao.UserDAO;
import model.service.PostManager;
import model.service.UserManager;

public class MyPostController implements Controller {

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
    	
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		System.out.println("userId:" + userId);
		UserManager userManager = UserManager.getInstance();
		PostManager postManager = PostManager.getInstance();

		List<Post> postList = postManager.findMyPostList(userId);
		
    	
    	request.setAttribute("postList", postList);			
		return "/user/myPost.jsp";				
    }

}
