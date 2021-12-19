package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.FavoriteManager;
import model.service.PostManager;
import model.service.PostNotFoundException;
import model.service.UserManager;
import model.Favorite;
import model.Post;
import model.User;

public class PostInfoController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(PostInfoController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		UserManager manager = UserManager.getInstance();
		PostManager postManager = PostManager.getInstance();
		HttpSession session = request.getSession();
		FavoriteManager fm = FavoriteManager.getInstance();
		Post post = null;
		User user = null;
		int fOrNot;
		int setting = Integer.parseInt(request.getParameter("setting"));
		int postId = -1;
		int userId = -1;

		String loginAccountId = UserSessionUtils.getLoginUserId(session);

		if (loginAccountId != null) {
			user = manager.findUser(loginAccountId);
			userId = user.getUserId();
		}

		String postUserNickName = null;
		try {

			post = postManager.findPost(Integer.parseInt(request.getParameter("postId"))); // 게시물 정보 검색
			postId = post.getPostId();
			System.out.println(post);
			log.debug("PostInfo Request : {}", post.getPostId());
			postUserNickName = postManager.getPostUserNickName(Integer.parseInt(request.getParameter("writerId")));

			System.out.println("닉네임" + postUserNickName);
			postManager.increasePostView(post);
		} catch (PostNotFoundException e) {
			System.out.println("포스트를 찾지 못함");
			return "redirect:/post/postList";
		}

		if (fm.findFavoriteByPostIdAndUserId(postId, userId) != null) {
			fOrNot = 1;
		} else {
			fOrNot = 0;
		}

		if (setting == 1) {
			fm.create(new Favorite(postId, userId));
			fOrNot = 1;
		} else if (setting == 0) {
			fm.removeByPostIdAndUserId(postId, userId);
			fOrNot = 0;
		} else {
			setting = -1;
		}

		System.out.println("절취선 ------------------------------");
		System.out.println(fm.findFavoriteByPostIdAndUserId(postId, userId));
		System.out.println("postId: " + postId);
		System.out.println("userId: " + userId);
		System.out.println("setting: " + setting);
		System.out.println("fOrNot: " + fOrNot);

		request.setAttribute("fOrNot", fOrNot);
		request.setAttribute("user", user);
		request.setAttribute("post", post);
		request.setAttribute("nickname", postUserNickName);

		return "/post/postInfo.jsp";
	}

}
