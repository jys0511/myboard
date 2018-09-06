package net.developia.restful.board;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.developia.restful.user.UserVO;

@Controller
@RequestMapping("board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/")
	public String list(Model model) {
		try {
			List<BoardVO> list = boardService.getBoardList();
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "board/board_list";
	}
	
	@GetMapping("insert") //게시판 입력 폼
	// public void insert() { views에서 insert를 찾게됨
	public String insert() {
		return "board/board_insert";
	}
	
	@PostMapping("insert") //게시판 입력 폼에서 넘어온 것 처리 
	public ModelAndView insert(@ModelAttribute BoardVO boardVO, HttpSession session) {
		boardVO.setUserVO((UserVO)session.getAttribute("userInfo"));
		try {
			boardService.insertBoard(boardVO);
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", boardVO.getBoa_name() + "이 생성되었습니다.");
			mav.addObject("url", "./");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result"); 
			mav.addObject("msg", boardVO.getBoa_name() + " 생성실패");
			mav.addObject("url", "./");
			return mav;
		}
	}
}
