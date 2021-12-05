package controller.post;

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
		//사용자 정보 넘김
    	UserManager manager = UserManager.getInstance();
    	PostManager postManager = PostManager.getInstance();
    	HttpSession session = request.getSession();
    	String loginAccountId = UserSessionUtils.getLoginUserId(session);
    	User user = null;
    	Post post = null;
    	
    	String postUserNickName = null;
		// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	
  
    	
		if (request.getMethod().equals("GET")) {	
			//현재 글 작성중인 writerId를 얻기 위함
//			String curUserId = UserSessionUtils.getLoginUserId(request.getSession());
//		    User curUser = manager.findUser(curUserId);
//		    System.out.println("curUser" + curUser);
//		    int writerId = curUser.getUserId();
		    
		    
		    
    		// GET request: 회원정보 수정 form 요청	
    		// 원래는 UpdateUserFormController가 처리하던 작업을 여기서 수행
//    		String updateId = request.getParameter("accountId");
			
    		int postId = Integer.parseInt(request.getParameter("postId"));
    		log.debug("PostUpdateForm Request : {}, {}", loginAccountId, postId);
    		
    		user = manager.findUser(loginAccountId);
    		int writerId = user.getUserId();
    		
    		post = postManager.findPost(postId);
    		
    		
			request.setAttribute("user", user);	
			request.setAttribute("post", post);
		
//			request.setAttribute("writerId", post.getWriterId());
			log.debug("Updateform request Post : {}", post);
			if (writerId == post.getWriterId()) {
				 
				// 현재 로그인한 사용자가 수정 대상 사용자인 경우 -> 수정 가능
				return "/post/postUpdateForm.jsp";   // 검색한 게시글 정보를 post update form으로 전송     
			
			}    
			
			// else 수정 불가능한 경우 사용자 보기 화면으로 오류 메세지를 전달
			postUserNickName = postManager.getPostUserNickName( post.getWriterId());
			System.out.println("수정실패: " + postUserNickName);
			request.setAttribute("nickname", postUserNickName);
			request.setAttribute("postUpdateFailed", true);
			request.setAttribute("exception", 
					new IllegalStateException("타인의 게시글은 수정할 수 없습니다."));      
		
			return "/post/postInfo.jsp";
		}
	
		
		// POST request
		System.out.print("update post id: " + request.getParameter("postId"));
		Post updatePost = new Post(
				Integer.parseInt(request.getParameter("postId")),
				request.getParameter("title"),
				request.getParameter("description"),
				request.getParameter("imgUrl"),
				Integer.parseInt(request.getParameter("categoryId")),
				Integer.parseInt(request.getParameter("views")),
				request.getParameter("status"),
				Integer.parseInt(request.getParameter("price")),
				request.getParameter("pType"),
				Integer.parseInt(request.getParameter("writerId")));
			
		postUserNickName = postManager.getPostUserNickName(Integer.parseInt(request.getParameter("writerId")));
		log.debug("Update Post : {}", updatePost);
		postManager.increasePostView(updatePost);
		postManager.update(updatePost);
		
		request.setAttribute("postId", updatePost.getPostId());	
		request.setAttribute("post", updatePost);	
		request.setAttribute("nickname", postUserNickName);
        return "/post/postInfo.jsp";

	
	}
}

