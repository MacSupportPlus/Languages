package com.macsupport.languages.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macsupport.languages.models.Language;
import com.macsupport.languages.services.LanguageService;

@Controller
public class LanguagesContoller {
	
	private static LanguageService lanServ;
	
	public LanguagesContoller(LanguageService lanServ) {
		this.lanServ = lanServ;
	}
	
	@GetMapping("/languages") 
	public String index(Model model) {
		model.addAttribute("languages", lanServ.getAll());
		model.addAttribute("newLanguage", new Language());
		return "index.jsp"; 
	}
	@PostMapping("/languages/create")
	public String create(@Valid @ModelAttribute("newLanguage") Language newLanguage, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("languages", lanServ.getAll());
			return "index.jsp";
		} else {
			
		lanServ.create(newLanguage);
		return "redirect:/languages";
		}
	}
	@GetMapping("/languages/{id}")
	public String languageDetails(@PathVariable("id") Long id, Model model) {
		model.addAttribute("singleLanguage", lanServ.getOne(id));
		return "language.jsp";
	}
	@GetMapping("/languages/edit/{id}")
	public String languageEdit(@PathVariable("id") Long id, Model model) {
		model.addAttribute("singleLanguage", lanServ.getOne(id));
		return "edit.jsp";
	}
	
	@PostMapping("/languages/update/{id}")
	public String updateLanguage(@Valid @PathVariable("id") Long id, @ModelAttribute("singleLanguage") Language singleLanguage, BindingResult result) {
		if(result.hasErrors()) {
    		return "edit.jsp";
    	} else {
    		lanServ.update(singleLanguage, id);
    		return "redirect:/languages/" + id ;
    	}	
	}
	//@PostMapping("/languages/{id}/delete")
	@RequestMapping(value="/languages/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		lanServ.deleteLanguage(id);
		return "redirect:/languages";
	}

	}
