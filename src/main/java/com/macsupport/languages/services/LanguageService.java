package com.macsupport.languages.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.macsupport.languages.models.Language;
import com.macsupport.languages.repositories.LanguageRepository;



@Service
public class LanguageService {
	
	
	private static LanguageRepository languageRepo;
	
	public LanguageService(LanguageRepository languageRepo) {
		this.languageRepo = languageRepo;
	}
	
	public Language create(Language newLanguage) {
		return languageRepo.save(newLanguage);
	}
	
	public List<Language> getAll() {
		return (List<Language>) languageRepo.findAll();
	}
	
	public Language getOne(Long id) {
		Optional<Language> optionalLanguage = languageRepo.findById(id);
		if(optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} else {
			return null;
		}
	}

	public Language update(Language languageToUpdate, @Valid Long id) {
		 //TODO Auto-generated method stub
		return languageRepo.save(languageToUpdate);
	}
	public void deleteLanguage(Long id) {
		// TODO Auto-generated method stub
		languageRepo.deleteById(id);
	}
}
