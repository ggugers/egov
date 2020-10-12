package com.egovweb.cmm.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insert(String queryId, Object parameterObject) {
		return sqlSessionTemplate.insert(queryId, parameterObject);
	}
	
	public int update(String queryId, Object parameterObject) {
		return sqlSessionTemplate.update(queryId, parameterObject);
	}
	
	public int delete(String queryId, Object parameterObject) {
		return sqlSessionTemplate.delete(queryId, parameterObject);
	}
	
	public Object selectOne(String queryId, Object parameterObject) {
		return sqlSessionTemplate.selectOne(queryId, parameterObject);
	}
	
	public List<?> list(String queryId, Object parameterObject) {
		return sqlSessionTemplate.selectList(queryId, parameterObject);
	}
}
