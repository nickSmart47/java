package com.example.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.languages.models.Language;
import com.example.languages.services.LanguageService;

@Controller
public class LanguageController {
	
	private final LanguageService languageService;
	
	public LanguageController(LanguageService languageService) {
		this.languageService = languageService;
	}

	@RequestMapping("/languages")
	public String languages(@ModelAttribute("language") Language language, Model model) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages", languages);
		return "index.jsp";
	}
	
	@PostMapping("/languages")
	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Language> languages = languageService.allLanguages();
			model.addAttribute("languages", languages);
			return "index.jsp";
		} else {
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
	}
	
	@RequestMapping("/languages/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Language language = languageService.findLanguage(id);
        model.addAttribute("language", language);
        return "edit.jsp";
    }
	
	@RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			languageService.updateLanguage(language.getId(), language);
			return "redirect:/languages";
		}
	}
	
	@DeleteMapping("/languages/{id}")
	public String destroy(@PathVariable("id") Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";
	}
	
	@GetMapping("/languages/{id}")
	public String showlanguage(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
        model.addAttribute("language", language);
        return "show.jsp";
	}
}
