package controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Post;
import model.User;
import model.dao.UserDAO;
import model.service.UserManager;

public class MyPostController implements Controller {

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
    	
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		UserManager userManager = UserManager.getInstance();

		List<Post> postList = userManager.findMyPostList(userId);	// �α��� ����� ���� �˻�	
		
    	
    	request.setAttribute("postList", postList);		// ����� ���� ����				
		return "/user/myPost.jsp";				// ����� ���� ȭ������ �̵�
    }

}
