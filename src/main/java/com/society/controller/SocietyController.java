package com.society.controller;

import com.society.models.SocietyVo;
import com.society.services.SocietyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SocietyController {

	@Autowired
	private SocietyService societyService;

	@GetMapping(value = "admin/society")
	public ModelAndView manageSociety() {

		SocietyVo societyVo = this.societyService.search() != null ? this.societyService.search() : new SocietyVo();
		return new ModelAndView("admin/societyDetails", "societyVo", societyVo);
	}

	@PostMapping(value = "admin/insertSociety")
	public ModelAndView insertSociety(@ModelAttribute SocietyVo societyVo) {
		this.societyService.insertSociety(societyVo);
		return new ModelAndView("redirect:society");
	}
}
