package com.smart.javabeltexam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.smart.javabeltexam.models.Rating;
import com.smart.javabeltexam.models.Show;
import com.smart.javabeltexam.models.User;
import com.smart.javabeltexam.repositories.RatingRepository;
import com.smart.javabeltexam.repositories.ShowRepository;
import com.smart.javabeltexam.repositories.UserRepository;

@Service
public class ShowService {

	@Autowired
	private ShowRepository showRepo;

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private RatingRepository ratingRepo;

	public Show createShow(Show newShow, BindingResult result, User poster) {

		Optional<Show> potentialShow = this.showRepo.findByTitle(newShow.getTitle());

		if (potentialShow.isPresent()) {
			result.rejectValue("title", "TitleTaken", "A Show with that title already exists in the database.");
		}

		if (result.hasErrors()) {
			return null;
		}

		else {

			newShow.setPoster(poster);

			return showRepo.save(newShow);

		}
	}

	public List<Show> allShows() {
		return showRepo.findAll();
	}

	public Show findShow(Long id) {
		Optional<Show> optionalShow = showRepo.findById(id);
		if (optionalShow.isPresent()) {
			return optionalShow.get();
		} else {
			return null;
		}
	}

	public Show updateShow(Long id, Show show, BindingResult result) {

		Show updatedShow = showRepo.findById(id).get();

		Optional<Show> potentialShow = this.showRepo.findByTitle(show.getTitle());

		updatedShow.setTitle(show.getTitle());
		updatedShow.setNetwork(show.getNetwork());
		updatedShow.setDescription(show.getDescription());

		if (potentialShow.isPresent() && potentialShow.get() != updatedShow) {
			result.rejectValue("title", "TitleTaken", "A Show with that title already exists in the database.");
		}

		if (result.hasErrors()) {
			return null;
		}

		else {
			return showRepo.save(updatedShow);

		}

	}

	public void deleteShow(Long id) {
		
		showRepo.deleteById(id);
	}

	public Rating rateShow(Rating newRating, User ratingUser, Show showToBeRated, BindingResult result) {

		Rating rating = new Rating();

		rating.setRatingValue(newRating.getRatingValue());
		rating.setShow(showToBeRated);
		rating.setUser(ratingUser);

		newRating.setUser(ratingUser);
		newRating.setShow(showToBeRated);
		List<Rating> showRatings = showToBeRated.getShowRatings();
		showRatings.add(newRating);
		showToBeRated.setShowRatings(showRatings);

		if (result.hasErrors()) {
			return null;
		} else {


			return ratingRepo.save(rating);

		}

	}

}
