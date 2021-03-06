package com.egovweb.board.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface BoardService {

	public int boardCount(Map map ) ;
	
	public List boardList(Map map) ;
	
	public EgovMap boardView(Map map) ;
	
	public int boardInsert(Map map) ;
	
	public int boardUpdate(Map map) ;
	
	public int boardDelete(Map map) ;
}
