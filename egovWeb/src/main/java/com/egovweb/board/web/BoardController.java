package com.egovweb.board.web;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.egovweb.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/board/list.do")
	public String boardList(Model model) throws Exception {
		
		List list = boardService.boardList();
		model.addAttribute("list", list);
		return "board/list";
	}
	
	@RequestMapping(value="/board/view.do")
	public String boardView(Model model, @RequestParam Map param) throws Exception {
		
		Map map = boardService.boardView(param);
		model.addAttribute("data", map);
		return "board/view";
	}
	
	@RequestMapping(value="/board/write.do")
	public String boardWrite(Model model, @RequestParam Map param) throws Exception {
		Map map = new HashedMap();
		if (param.get("idx") != null && !"".equals(param.get("idx"))) {
			map = boardService.boardView(param);
		}
		model.addAttribute("data", map);
		return "board/write";
	}
	
	@RequestMapping(value="/board/save.do")
	public String boardSave(Model model, @RequestParam Map param) throws Exception {
		param.put("userId", "system");
		int cnt = 0;
		if (param.get("idx") == null || "".equals(param.get("idx"))) {
			cnt = boardService.boardInsert(param);			
		} else {
			cnt = boardService.boardUpdate(param);
		}
		model.addAttribute("cnt", cnt);
		return "board/result";
	}
	
	@RequestMapping(value="/board/delete.do")
	public String boardDelete(Model model, @RequestParam Map param) throws Exception {
		
		int cnt = boardService.boardDelete(param);
		model.addAttribute("cnt", cnt);
		return "board/result";
	}
	
}
