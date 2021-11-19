package controller.user;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.UserManager;
import model.User;

public class UpdateUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
    	if (request.getMethod().equals("GET")) {	
    		// GET request: 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 form 占쏙옙청	
    		// 占쏙옙占쏙옙占쏙옙 UpdateUserFormController占쏙옙 처占쏙옙占싹댐옙 占쌜억옙占쏙옙 占쏙옙占썩서 占쏙옙占쏙옙
    		String updateId = request.getParameter("userId");

    		log.debug("UpdateForm Request : {}", updateId);
    		
    		UserManager manager = UserManager.getInstance();
			User user = manager.findUser(updateId);	// 占쏙옙占쏙옙占싹뤄옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙 占싯삼옙
			request.setAttribute("user", user);			

			HttpSession session = request.getSession();
			if (UserSessionUtils.isLoginUser(updateId, session) ||
				UserSessionUtils.isLoginUser("admin", session)) {
				// 占쏙옙占쏙옙 占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙微占� 占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙隔킬占� 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占� -> 占쏙옙占쏙옙 占쏙옙占쏙옙
				
				return "/user/updateForm.jsp";   // 占싯삼옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 update form占쏙옙占쏙옙 占쏙옙占쏙옙     
			}    
			
			// else (占쏙옙占쏙옙 占쌀곤옙占쏙옙占쏙옙 占쏙옙占�) 占쏙옙占쏙옙占� 占쏙옙占쏙옙 화占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쌨쇽옙占쏙옙占쏙옙 占쏙옙占쏙옙
			request.setAttribute("updateFailed", true);
			request.setAttribute("exception", 
					new IllegalStateException("타占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占싹댐옙."));            
			return "/user/view.jsp";	// 占쏙옙占쏙옙占� 占쏙옙占쏙옙 화占쏙옙占쏙옙占쏙옙 占싱듸옙 (forwarding)
	    }	
    	
    	// POST request (회占쏙옙占쏙옙占쏙옙占쏙옙 parameter占쏙옙 占쏙옙占쌜듸옙)
    	User updateUser = new User(
    		request.getParameter("userId"),
    		request.getParameter("password"),
    		request.getParameter("name"),
    		request.getParameter("email"),
    		request.getParameter("nickname"));
    	//제가 userUpdateForm건드리면서 생긴 User 객체 생성자들 수정 필요할 거 같음..!*
    	log.debug("Update User : {}", updateUser);

		UserManager manager = UserManager.getInstance();
		manager.update(updateUser);			

        return "redirect:/user/view";
    }
}
