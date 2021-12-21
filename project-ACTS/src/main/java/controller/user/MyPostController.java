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
		
		UserManager userManager = UserManager.getInstance();
		PostManager postManager = PostManager.getInstance();

		List<Post> postList = postManager.findMyPostList(userId);	// 占싸깍옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙 占싯삼옙	
		
    	
    	request.setAttribute("postList", postList);		// 占쏙옙占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙				
		return "/user/myPost.jsp";				// 占쏙옙占쏙옙占� 占쏙옙占쏙옙 화占쏙옙占쏙옙占쏙옙 占싱듸옙
    }

}
