package controller.message;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.post.UploadPostController;
import controller.user.UserSessionUtils;
import model.MessageRoom;
import model.User;
import model.service.MessageRoomManager;
import model.service.UserManager;

public class MessageRoomListController implements Controller  {
	private static final Logger log = LoggerFactory.getLogger(UploadPostController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 로그인 안 되어있으면 로그인 폼으로 보냄
		if (!UserSessionUtils.hasLogined(request.getSession())) {
			return "redirect:/user/login/form";
		}
		
		// 현재 로그인 되어 있는 유저 반환
		String curUserId = UserSessionUtils.getLoginUserId(request.getSession());
		UserManager userManager = UserManager.getInstance();
		User user = userManager.findUser(curUserId);

		// 메세지 룸 리스트
		MessageRoomManager manager = MessageRoomManager.getInstance();
		request.setAttribute("messageRoomList", null);
		List<MessageRoom> messageRoomList = manager.findMessageList(user);
		
		System.out.println("messageList: " + messageRoomList);
		
		return "/message/messageRoom.jsp";
	}

}
