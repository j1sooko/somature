package controller.message;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.post.UploadPostController;
import controller.user.UserSessionUtils;
import model.Message;
import model.service.MessageManager;
import model.service.PostManager;

public class SendMessageFormController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(UploadPostController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 로그인 안 되어있으면 로그인 폼으로 보냄
		if (!UserSessionUtils.hasLogined(request.getSession())) {
			return "redirect:/user/login/form";
		}

		PostManager postManager = PostManager.getInstance();

		// 메세지 attribute 생성 - receiver id
		int receiverId = Integer.parseInt(request.getParameter("receiverId"));
		String receiverNick = postManager.getPostUserNickName(receiverId);
//		
		// 메세지 리스트
		MessageManager manager = MessageManager.getInstance();
		request.setAttribute("messageList", null);
		List<Message> messageList = manager.findMessageList();
		
		System.out.println("messageList: " + messageList);
		
//		log.debug("receiver nickName: " + receiverNick);
//		// forwarding
		request.setAttribute("receiverId", receiverId);
		request.setAttribute("receiverNick", receiverNick);
		request.setAttribute("messageList", messageList);
		return "/message/messageForm.jsp";
	}
}
