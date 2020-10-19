package com.egovweb.board.web;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.egovweb.board.service.BoardService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {

    @Value("#{resource['file.upload.temp.path']}")
    private String fileUploadTempPath;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/board/list.do")
	public String boardList(Model model, @RequestParam Map param) throws Exception {
		
		System.out.println("fileUploadTempPath ==== " + fileUploadTempPath);
		
		String pageNo = (String) param.get("pageNo");
		if (pageNo == null || "".equals(pageNo)) {
			pageNo = "1";
		}
		
		//PaginationInfo에 필수 정보를 넣어 준다.
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(pageNo)); //현재 페이지 번호
		paginationInfo.setRecordCountPerPage(3); //한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(5); //페이징 리스트의 사이즈
		paginationInfo.setTotalRecordCount(boardService.boardCount(param)); // 전제 게시물 수
		
		param.put("firstIndex", paginationInfo.getFirstRecordIndex());
		param.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		
		List list = boardService.boardList(param);
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", paginationInfo);
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
