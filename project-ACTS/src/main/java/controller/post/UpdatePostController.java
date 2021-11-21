package controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.service.PostManager;
import model.Post;
import model.User;

public class UpdatePostController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(UpdatePostController.class);
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		if (request.getMethod().equals("GET")) {	
    		// GET request: 회원정보 수정 form 요청	
    		// 원래는 UpdateUserFormController가 처리하던 작업을 여기서 수행
    		String updateId = request.getParameter("accountId");
    		int postId = Integer.parseInt(request.getParameter("postId"));

    		log.debug("PostUpdateForm Request : {}{}", updateId, postId);
    		
    		UserManager manager = UserManager.getInstance(); 
    		User user = manager.findUser(updateId);	
    		
 
			
			request.setAttribute("user", user);			

			HttpSession session = request.getSession();
			if (UserSessionUtils.isLoginUser(updateId, session)) {
				 
				// 현재 로그인한 사용자가 수정 대상 사용자인 경우 -> 수정 가능
				return "/post/postUpdateForm.jsp";   // 검색한 게시글 정보를 post update form으로 전송     
			
			}    
			
			// else 수정 불가능한 경우 사용자 보기 화면으로 오류 메세지를 전달
			request.setAttribute("postUpdateFailed", true);
			request.setAttribute("exception", 
					new IllegalStateException("타인의 게시글은 수정할 수 없습니다."));      
		
			return "/post/postInfo.jsp";
		}
		PostManager postManager = PostManager.getInstance();
//		Post post = postManager.findPost(postId); // 수정하려는 게시글 정보 검색
		
		// POST request
		Post updatePost = new Post(
				Integer.parseInt(request.getParameter("postId")),
				request.getParameter("title"),
				request.getParameter("description"),
				request.getParameter("imgUrl"),
				Integer.parseInt(request.getParameter("categoryId")),
				request.getParameter("status"),
				Integer.parseInt(request.getParameter("price")),
				request.getParameter("pType")
				);
			
		log.debug("Update Post : {}", updatePost);
		postManager.update(updatePost);
        return "redirect:/post/postInfo";

	
	}
}

