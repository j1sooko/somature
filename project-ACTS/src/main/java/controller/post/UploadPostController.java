package controller.post;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Post;
import model.User;
import model.service.*;
//import model.service.UserManager;
public class UploadPostController implements Controller{
   private static final Logger log = LoggerFactory.getLogger(UploadPostController.class);
   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub
      String curUserId = UserSessionUtils.getLoginUserId(request.getSession());
      UserManager userManager = UserManager.getInstance();
      User user = userManager.findUser(curUserId);
      System.out.println("user: " + user);
      Post prod = new Post(
            request.getParameter("title"),
            request.getParameter("description"),
            request.getParameter("status"),
            Integer.parseInt(request.getParameter("price")),
            request.getParameter("pType"),
            user.getUserId()
            );
      
      log.debug("Create ProductForm : {}", prod);
      
      try {

         PostManager postManager = PostManager.getInstance();
         postManager.create(prod);

         
         log.debug("Create ProductForm : {}", prod);
           return "redirect:/comm/main";
      }
      catch(Exception e) {
         request.setAttribute("uploadFail", true);
         request.setAttribute("exception", e);
         request.setAttribute("post", prod);
         //게시글 작성 화면으로 이동
         return "/post/postForm.jsp";
      }

   

   }
   
}