package controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import model.service.UserManager;
import model.Post;
import model.User;

public class UpdateProductController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(UpdateProductController.class);
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Post prod = new Post();
		try {
			PostManager manager = PostManager.getInstance();
			manager.createProduct(prod);
			
			log.debug("Update Product : {}", prod);
	        return "foward:/post/updateProduct";
		}
		catch(Exception e) {
			request.setAttribute("uploadFail", true);
			request.setAttribute("exception", e);
			request.setAttribute("product", prod);
			return "redirect:/post/ProductList";
		}
		return null;
	}

}
