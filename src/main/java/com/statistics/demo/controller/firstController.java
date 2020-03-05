package com.statistics.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class firstController {

	@RequestMapping("/first")
	public String index() {
		return "index";
	}
	
}