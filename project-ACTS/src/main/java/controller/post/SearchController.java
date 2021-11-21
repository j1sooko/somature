package controller.post;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.service.PostManager;
import model.service.PostNotFoundException;
import model.Post;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.post.SearchCategoryController;
import model.dao.PostDAO;
import model.Post;
public class SearchController implements Controller{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		return null;
	}
	
}
