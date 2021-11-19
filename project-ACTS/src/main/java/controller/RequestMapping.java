package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.user.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 각 uri에 대응되는 controller 객체를 생성 및 저장
    	
    	//초기화면 및 로그인과 로그아웃
        mappings.put("/", new ForwardController("index.jsp")); //경원: 초기화면은 index.jsp로 이동하게
        //초기-메인화면
        mappings.put("/comm/main", new ForwardController("/comm/main.jsp"));
        mappings.put("/comm/search", new ForwardController("/comm/search.jsp"));
        mappings.put("/user/myPage", new MyPageController());
        mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp")); //경원: 로그인 버튼을 누르면 /user/loginForm.jsp로 이동하게
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/view", new ViewUserController());
        
        
        mappings.put("/user/list", new ListUserController()); //경원: 유저리스트 보는건 사용자가 아닌 administrator가 보는거라서 뺌
        
        
        // 회원 가입 폼 요청과 가입 요청 처리 병합 (폼에 커뮤니티 선택 메뉴 추가를 위함)
        mappings.put("/user/register/form", new ForwardController("/user/registerForm.jsp"));
        mappings.put("/user/register", new RegisterUserController());
        
        //마이페이지 관리
        mappings.put("/user/myInfo", new MyInfoController()); //경원: 내정보로 가는 컨트롤러
        //자신의 정보를 업데이트하고 등록하는것.
        mappings.put("/user/update/form", new ViewUserController()); //경원: 자기 자신의 정보를 보고자 할 때  
        mappings.put("/user/update", new UpdateUserController());
        mappings.put("/user/myPost", new ForwardController("/user/myPost.jsp"));
        mappings.put("/user/participatingTransaction", new ForwardController("/user/participatingTransaction.jsp"));
        mappings.put("/user/followingList", new ForwardController("/user/followingList.jsp"));
        
        mappings.put("/user/delete", new DeleteUserController());
        
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}
