package controller.message;

import controller.Controller;
import controller.post.UploadPostController;
import controller.user.UserSessionUtils;
import model.Message;
import model.Post;
import model.User;
import model.service.MessageManager;
import model.service.PostManager;
import model.service.UserManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SendMessageController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(UploadPostController.class);
	   @Override
	   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      String curUserId = UserSessionUtils.getLoginUserId(request.getSession());
	      UserManager userManager = UserManager.getInstance();
	      User user = userManager.findUser(curUserId);
	      System.out.println("user: " + user);
	      
	      Message message = new Message(
    		  request.getParameter("content"));
	      
	      try {
	    	  MessageManager messageManager = MessageManager.getInstance();
	    	  messageManager.create(message);
   
	         log.debug("Create MessageForm : {}", message);
	           return "redirect:/comm/main";
	      }
	      catch(Exception e) {
	         request.setAttribute("uploadFail", true);
	         request.setAttribute("exception", e);
	         request.setAttribute("message", message);
	         
	         return "/message/messageForm.jsp";
	      }
	   }
}
