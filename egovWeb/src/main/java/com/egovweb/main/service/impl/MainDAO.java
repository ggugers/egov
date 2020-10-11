package com.egovweb.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<?> selectMainBoard() {
		return sqlSessionTemplate.selectList("mainDAO.selectMainBoard", null);
	}
}
