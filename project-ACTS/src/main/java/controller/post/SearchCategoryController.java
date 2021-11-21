package controller.post;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UpdateUserController;
import model.Post;
import model.service.PostManager;

public class SearchCategoryController implements Controller  {
	private static final Logger log = LoggerFactory.getLogger(SearchCategoryController.class);

	@Override
	    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
			
			String categoryName = request.getParameter("categoryName");
		
			log.debug("SearchCategoryController Request : {}", categoryName);
			
		
			PostManager manager = PostManager.getInstance();
			List<Post> postList = manager.findPostListUseCategory(categoryName);
			
			// postList 객체를 request에 저장하여 게시글 리스트 화면으로 이동(forwarding)
			request.setAttribute("postList", postList);
			return "/comm/main.jsp";
	}
}
