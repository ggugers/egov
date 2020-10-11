package com.egovweb.main.web;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.egovweb.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping(value="/main.do")
	public String main(ModelMap map) throws Exception{
		System.out.println("mainController => main.do");
		LocalDateTime now = LocalDateTime.now();
		String nowDate = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		map.addAttribute("date", nowDate);
		map.addAttribute("list", mainService.selectMainBoard());
		return "main/main";
	}
}
