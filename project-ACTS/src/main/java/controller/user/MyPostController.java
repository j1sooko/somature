package controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Post;
import model.User;
import model.dao.UserDAO;

public class MyPostController implements Controller {

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	
		int userId = Integer.parseInt(request.getParameter("userId"));
		UserDAO userDao = new UserDAO();
		List<Post> postList;
		
    	
    	postList = userDao.findMyPostList(userId);	// 로그인 사용자 정보 검색	
		
    	
    	request.setAttribute("postList", postList);		// 사용자 정보 저장				
		return "/user/myPost.jsp";				// 사용자 보기 화면으로 이동
    }

}
