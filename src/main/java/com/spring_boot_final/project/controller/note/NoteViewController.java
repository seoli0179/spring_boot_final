package com.spring_boot_final.project.controller.note;

import com.spring_boot_final.project.model.CommentVO;
import com.spring_boot_final.project.model.NoteVO;
import com.spring_boot_final.project.service.CommentService;
import com.spring_boot_final.project.service.NoteService;
import com.spring_boot_final.project.state.ViewState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class NoteViewController {

    @Autowired
    NoteService noteService;

    @Autowired
    CommentService commentService;

    @RequestMapping("/note/list")
    public String list(
            HttpSession session,
            Model model
    ) {

        ArrayList<NoteVO> vo = noteService.selectNoteList();

        for (int i = 0; i < vo.size(); i++) {
            String tagRemove = vo.get(i).getNote().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
            vo.get(i).setNote(tagRemove.substring(0, (tagRemove.length() < 120 ? tagRemove.length() : 120)));

            if (session.getAttribute("sid") != null)
                vo.get(i).setNoteLikeCheck(noteService.noteLikeCheck(vo.get(i), session.getAttribute("sid").toString()));
        }

        model.addAttribute("list", vo);
        return "note/list";
    }

    @RequestMapping("/note/event")
    public String event(Model model) {

        ArrayList<NoteVO> vo = noteService.selectNoteList();

        for (int i = 0; i < vo.size(); i++) {
            String tagRemove = vo.get(i).getNote().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
            vo.get(i).setNote(tagRemove.substring(0, (tagRemove.length() < 120 ? tagRemove.length() : 120)));
        }

        model.addAttribute("list", vo);
        return "note/event";
    }

    @RequestMapping("/note/detail/{noteId}")
    public String detail(
            @PathVariable int noteId,
            HttpSession session,
            Model model
    ) {

        NoteVO note = noteService.selectNote(noteId);

        if (note.getPageViewState() != ViewState.POST) {
            return "error";
        }

        if (session.getAttribute("sid") != null)
            note.setNoteLikeCheck(noteService.noteLikeCheck(note, session.getAttribute("sid").toString()));

        ArrayList<CommentVO> comment = commentService.selectCommentList(noteId);

        if (session.getAttribute("sid") != null) {
            for (int i = 0; i < comment.size(); i++) {
                comment.get(i).setCommentLikeCheck(commentService.noteLikeCheck(comment.get(i), session.getAttribute("sid").toString()));
            }
        }

        model.addAttribute("note", note);
        model.addAttribute("commentList", comment);

        return "note/detail";
    }

    @RequestMapping("/note/write")
    public String write() {
        return "note/write";
    }

    @RequestMapping("/note/update/{noteId}")
    public String update(
            @PathVariable int noteId,
            HttpSession session,
            Model model
    ) {

        if (session.getAttribute("sid") == null)
            return "error";

        NoteVO vo = noteService.selectNote(noteId);

        if (!vo.getUserId().equals(session.getAttribute("sid").toString()))
            return "error";

        model.addAttribute("note", vo);

        return "note/update";
    }

}
