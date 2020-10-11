package com.egovweb.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="/main.do")
	public String main() throws Exception{
		System.out.println("mainController => main.do");
		return null;
	}
}
