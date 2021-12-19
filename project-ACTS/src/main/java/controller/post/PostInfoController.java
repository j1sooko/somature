package controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.PostManager;
import model.service.PostNotFoundException;
import model.service.ReviewManager;
import model.service.UserManager;
import model.Post;
import model.Review;
import model.User;

public class PostInfoController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(PostInfoController.class);

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	
		UserManager manager = UserManager.getInstance();
		PostManager postManager = PostManager.getInstance();
		ReviewManager reviewManager = ReviewManager.getInstance();
		
		HttpSession session = request.getSession();
    	Post post = null;
    	User user = null;
    	List<Review> reviewList = null;
    	
    	String loginAccountId = UserSessionUtils.getLoginUserId(session);
    	if (loginAccountId != null)
    		user = manager.findUser(loginAccountId);	
    	
    	String postUserNickName = null;
    	try {
    		
    		post = postManager.findPost(Integer.parseInt(request.getParameter("postId")));	// �Խù� ���� �˻�
    		System.out.println(post);
    		log.debug("PostInfo Request : {}", post.getPostId());
    		
    		postUserNickName = postManager.getPostUserNickName(post.getWriterId());
    		
    		reviewList = reviewManager.findReviewList(post.getPostId());
    		
    		System.out.println("�г���" + postUserNickName);
    		postManager.increasePostView(post);
    	} catch (PostNotFoundException e) {				
    		System.out.println("����Ʈ�� ã�� ����");
	        return "redirect:/post/postList";
		}	
		
//    	
//    	request.setAttribute("user", user);	
    	request.setAttribute("post", post);		// ����� ���� ����
    	request.setAttribute("nickname", postUserNickName);
    	request.setAttribute("reviewList", reviewList);
		return "/post/postInfo.jsp";				// ����� ���� ȭ������ �̵�
    }

}
