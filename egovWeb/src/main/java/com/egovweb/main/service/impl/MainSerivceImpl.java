package com.egovweb.main.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.egovweb.main.service.MainService;

@Service
public class MainSerivceImpl implements MainService {

	@Override
	public List selectMainBoard() {
		List list = new ArrayList();
		Map map = new HashMap();
		map.put("idx", "1");
		map.put("title", "제목1");
		list.add(map);
		Map map2 = new HashMap();
		map2.put("idx", "2");
		map2.put("title", "제목2");
		list.add(map2);
		return list;
	}

}
