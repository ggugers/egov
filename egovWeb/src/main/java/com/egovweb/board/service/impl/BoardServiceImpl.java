package com.egovweb.board.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.egovweb.board.service.BoardService;
import com.egovweb.cmm.service.CommonDAO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	CommonDAO commonDAO;
	
	@Override
	public int boardCount(Map map) {
		
		return (int) commonDAO.selectOne("boardDAO.boardCount", map);
	}
	
	@Override
	public List boardList(Map map) {
		
		return commonDAO.list("boardDAO.boardList", map);
	}

	@Override
	public EgovMap boardView(Map map) {
		
		return (EgovMap) commonDAO.selectOne("boardDAO.boardView", map);
	}

	@Override
	public int boardInsert(Map map) {
		return commonDAO.insert("boardDAO.boardInsert", map);
	}

	@Override
	public int boardUpdate(Map map) {
		return commonDAO.update("boardDAO.boardUpdate", map);
	}

	@Override
	public int boardDelete(Map map) {
		return commonDAO.delete("boardDAO.boardDelete", map);
	}

	
	
}
