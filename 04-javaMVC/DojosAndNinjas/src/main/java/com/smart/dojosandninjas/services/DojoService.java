package com.smart.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.smart.dojosandninjas.models.Dojo;
import com.smart.dojosandninjas.repositories.DojoRepository;



@Service
public class DojoService {
	private final DojoRepository dojoRepository;
	
	public DojoService(DojoRepository dojoRepository)  {
		this.dojoRepository = dojoRepository;
	}
	
	public List<Dojo> allDojos() {
		return dojoRepository.findAll();
	}
	
	public Dojo createDojo(Dojo d) {
		return dojoRepository.save(d);
	}
	public Dojo findDojo(Long id) {
		Optional<Dojo> optionalDojo = dojoRepository.findById(id);
		if (optionalDojo.isPresent()) {
			return optionalDojo.get();
		} else {
			return null;
		}
	}

	public Dojo updateDojo(Long id, Dojo dojo) {
		Dojo updatedDojo = dojoRepository.findById(id).get();

		updatedDojo.setLocation(dojo.getLocation());
		updatedDojo.setNinjas(dojo.getNinjas());

		return dojoRepository.save(dojo);

	}

	public void deleteDojo(Long id) {
		Dojo dojoToDelete = dojoRepository.findById(id).get();

		dojoRepository.delete(dojoToDelete);
	}
}
