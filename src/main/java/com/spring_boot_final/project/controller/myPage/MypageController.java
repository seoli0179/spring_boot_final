package com.spring_boot_final.project.controller.myPage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_final.project.model.UserVO;
import com.spring_boot_final.project.service.ExhbnService;
import com.spring_boot_final.project.service.UserService;

@Controller
public class MypageController {
	
	@Autowired
    ExhbnService service;
	
	@Autowired
	UserService userService;
	
	// 마이페이지 view
    @RequestMapping("myPage/home")
    public String myPageView() {
        return "myPage/home";
    }
    
    // 마이페이지 view
    @RequestMapping("myPage/home/{userId}")
    public String viewMyPage(@PathVariable String userId, Model model) {
    	
    	UserVO vo = userService.selectUser2(userId);
		
		model.addAttribute("user", vo);
    	return "myPage/home";
    }
    
    
    // 마이페이지 view
    @RequestMapping("myPage/edit/{userId}")
    public String viewMyPageEdit(@PathVariable String userId, Model model) {
    	
    	UserVO vo = userService.selectUser2(userId);
		
		model.addAttribute("user", vo);
    	return "myPage/edit";
    }
 
	
    // 스크랩 view
    @RequestMapping("myPage/scrap")
    public String myPageScrap() {
        return "myPage/scrap";
    }
    
    // 좋아요 view
    @RequestMapping("myPage/like")
    public String myPageLike() {
        return "myPage/like";
    }
    
    // 코스 view
    @RequestMapping("myPage/mpCourse")
    public String myPageCourse() {
        return "myPage/mpCourse";
    }
    
    // 추천 콘텐츠 view
    @RequestMapping("myPage/recmd")
    public String myPageRecmd() {
        return "myPage/recmd";
    }
    
    // 추천 콘텐츠 이벤트 view
    @RequestMapping("myPage/event")
    public String myPageEvent() {
        return "myPage/event";
    }
    
    // 활동 내역 게시글 view
    @RequestMapping("myPage/actHistory")
    public String myPageactHistory() {
        return "myPage/actHistory";
    }
    
    // 활동 내역 댓글 view
    @RequestMapping("myPage/comment")
    public String myPageComment() {
        return "myPage/comment";
    }
    
    // 회원 정보 확인 view
    @RequestMapping("myPage/check")
    public String myPageCheck() {
        return "myPage/check";
    }
    
    // 회원 기본 정보 수정 view
    @RequestMapping("myPage/edit")
    public String myPageEdit() {
        return "myPage/edit";
    }
    
    // 회원 맞춤 정보 수정 view
    @RequestMapping("myPage/custom")
    public String myPageCustom() {
        return "myPage/custom";
    }
    
    // 회원 비밀번호 변경 view
    @RequestMapping("myPage/pwChange")
    public String myPagePw() {
        return "myPage/pwChange";
    }
    
    // 회원 탈퇴 view
    @RequestMapping("myPage/withdraw")
    public String myPageWithdraw() {
        return "myPage/withdraw";
    }
}
