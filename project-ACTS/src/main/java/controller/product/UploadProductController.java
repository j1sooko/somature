package controller.product;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
//import model.service.UserManager;
public class UploadProductController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(UploadProductController.class);
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Product prod = new Product();
		try {
			ProductManager manager = ProductManager.getInstance();
			manager.createProduct(prod);
			
			log.debug("Create ProductForm : {}", prod);
	        return "foward:/product/productList";
		}
		catch(Exception e) {
			request.setAttribute("uploadFail", true);
			request.setAttribute("exception", e);
			request.setAttribute("product", prod);
			return "foward:/product/uploadFail";
		}
		return null;
	}
	
}
