package com.example.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.savetravels.models.Expense;
import com.example.savetravels.repositories.ExpenseRepository;
import com.smart.books.models.Book;

@Service
public class ExpenseService {
	
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}

	public Expense createExpense(Expense e) {
		return expenseRepository.save(e);
	}
	
	public Expense findExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		if (optionalExpense.isPresent()) {
			return optionalExpense.get();
		} else {
			return null;
		}
	}
	
	public Expense updateExpense(Long id, Expense expense) {
		Expense updatedExpense = expenseRepository.findById(id).get();
		
		updatedExpense.setName(expense.getName());
		updatedExpense.setAmount(expense.getAmount());
		updatedExpense.setVendor(expense.getVendor());
		updatedExpense.setDescription(expense.getDescription());
		
		return expenseRepository.save(expense);
		
		
		
	}
}
