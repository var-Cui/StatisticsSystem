package com.statistics.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class firstController {

	@GetMapping("/first")
	public String index() {
		return "welcome";
	}
	
}