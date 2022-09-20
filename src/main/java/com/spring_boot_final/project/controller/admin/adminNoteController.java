package com.spring_boot_final.project.controller.admin;

import com.spring_boot_final.project.model.UserVO;
import com.spring_boot_final.project.service.UserService;
import com.spring_boot_final.project.service.admin.AdminExhbnService;
import com.spring_boot_final.project.service.admin.AdminNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class adminNoteController {
    @Autowired
    UserService userService;

    @Autowired
    AdminNoteService adminNoteService;

    @RequestMapping("/admin/note/select/all")
    public String NoteSelectAll(HttpSession session, Model model){

        if (!adminCheck(session)) {
            return null;
        }

        model.addAttribute("notes", adminNoteService.NoteSelectAll());

        return "/admin/result/note/noteTable";
    }

    public boolean adminCheck(HttpSession session) {

        if (session.getAttribute("sid") == null)
            return false;
        UserVO vo = userService.selectUserView(session.getAttribute("sid").toString());

        if (vo.getUserRoll().toString().equals("ADMIN"))
            return true;

        return false;

    }

}
