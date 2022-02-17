package com.smart.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.smart.dojosandninjas.models.Ninja;
import com.smart.dojosandninjas.repositories.NinjaRepository;

@Service
public class NinjaService {
	
	private final NinjaRepository ninjaRepository;

	public NinjaService(NinjaRepository ninjaRepository) {
		this.ninjaRepository = ninjaRepository;
	}

	public List<Ninja> allNinjas() {
		return ninjaRepository.findAll();
	}

	public Ninja createNinja(Ninja n) {
		return ninjaRepository.save(n);
	}

	public Ninja findNinja(Long id) {
		Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
		if (optionalNinja.isPresent()) {
			return optionalNinja.get();
		} else {
			return null;
		}
	}

	public Ninja updateNinja(Long id, Ninja ninja) {
		Ninja updatedNinja = ninjaRepository.findById(id).get();

		updatedNinja.setFirstName(ninja.getFirstName());
		updatedNinja.setLastName(ninja.getLastName());
		updatedNinja.setAge(ninja.getAge());

		return ninjaRepository.save(ninja);

	}

	public void deleteNinja(Long id) {
		Ninja ninjaToDelete = ninjaRepository.findById(id).get();

		ninjaRepository.delete(ninjaToDelete);
	}
}
