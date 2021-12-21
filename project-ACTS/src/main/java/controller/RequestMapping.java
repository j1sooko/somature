package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.user.*;
import controller.post.*;
import controller.review.UploadReviewController;
import controller.review.UploadReviewFormController;
import controller.transaction.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 媛� �슂泥� uri�뿉 ���븳 controller 媛앹껜瑜� ���옣�븷 HashMap �깮�꽦
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 媛� uri�뿉 ���쓳�릺�뒗 controller 媛앹껜瑜� �깮�꽦 諛� ���옣
    	
    	//珥덇린�솕硫� 諛� 濡쒓렇�씤怨� 濡쒓렇�븘�썐
        mappings.put("/", new ForwardController("index.jsp")); //寃쎌썝: 珥덇린�솕硫댁� index.jsp濡� �씠�룞�븯寃�
        //珥덇린-硫붿씤�솕硫�
        mappings.put("/comm/main", new ListPostController());
        mappings.put("/comm/search", new ForwardController("/comm/search.jsp"));
        mappings.put("/comm/search/searchForm", new ForwardController("/comm/searchForm.jsp"));
        mappings.put("/comm/search/list", new SearchCategoryController());
        mappings.put("/user/myPage", new MyPageController());
        mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp")); //寃쎌썝: 濡쒓렇�씤 踰꾪듉�쓣 �늻瑜대㈃ /user/loginForm.jsp濡� �씠�룞�븯寃�
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/view", new ViewUserController());
        mappings.put("/comm/buyerPage", new BuyerPostListController());       
        
        mappings.put("/user/list", new ListUserController()); //寃쎌썝: �쑀��由ъ뒪�듃 蹂대뒗嫄� �궗�슜�옄媛� �븘�땶 administrator媛� 蹂대뒗嫄곕씪�꽌 類�
      
        
        
        // �쉶�썝 媛��엯 �뤌 �슂泥�怨� 媛��엯 �슂泥� 泥섎━ 蹂묓빀 (�뤌�뿉 而ㅻ�ㅻ땲�떚 �꽑�깮 硫붾돱 異붽�瑜� �쐞�븿)
        mappings.put("/user/register/form", new ForwardController("/user/registerForm.jsp"));
        mappings.put("/user/register", new RegisterUserController());
        
        //留덉씠�럹�씠吏� 愿�由�
        mappings.put("/user/myInfo", new MyInfoController()); //寃쎌썝: �궡�젙蹂대줈 媛��뒗 而⑦듃濡ㅻ윭
        //�옄�떊�쓽 �젙蹂대�� �뾽�뜲�씠�듃�븯怨� �벑濡앺븯�뒗寃�.
//        mappings.put("/user/update/form", new ForwardController("/user/updateForm.jsp")); //寃쎌썝: �옄湲� �옄�떊�쓽 �젙蹂대�� �닔�젙�븯怨좎옄 �븷 �븣  
        
        mappings.put("/user/update", new UpdateUserController());
        mappings.put("/user/myPost", new MyPostController());

        mappings.put("/user/myPage/myBuyerTransaction", new MyBuyerTransactionListController());
        mappings.put("/user/myPage/mySellerTransaction", new MySellerTransactionListController());

      

    
        mappings.put("/user/followingList", new FavoriteListController());


        
        mappings.put("/user/delete", new DeleteUserController());
        
        // 寃뚯떆湲� 愿�由�
        mappings.put("/post/upload/form", new UploadPostFormController()); //寃뚯떆湲� �옉�꽦 �뤌 �슂泥�(濡쒓렇�씤 �븘�씠�뵒 �젙蹂� �꽆源�->writerId濡� �벐湲곗쐞�븿)
        mappings.put("/post/upload", new UploadPostController());
        mappings.put("/post/update", new UpdatePostController());
        mappings.put("/post/postInfo", new PostInfoController());
        mappings.put("/post/sellerPostUpdate", new SellerUpdatePostController());
        mappings.put("/post/sellerPostInfo", new SellerPostInfoController());
        mappings.put("/post/delete", new DeletePostController());
        mappings.put("/post/search", new PostSearchController());

        mappings.put("/post/transactionForm", new CreateTransactionFormController());
        mappings.put("/post/transaction", new CreateTransactionController());
        mappings.put("/user/transactionInfo", new TransactionInfoController());
        logger.info("Initialized Request Mapping!");
        
        // �뙎湲� 愿�由�
        mappings.put("/review/upload/form", new UploadReviewFormController());
        mappings.put("/review/upload", new UploadReviewController());  
    }

    public Controller findController(String uri) {	
    	// 二쇱뼱吏� uri�뿉 ���쓳�릺�뒗 controller 媛앹껜瑜� 李얠븘 諛섑솚
        return mappings.get(uri);
    }
}
