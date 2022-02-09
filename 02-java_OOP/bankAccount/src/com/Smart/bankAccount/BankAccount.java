package com.Smart.bankAccount;

public class BankAccount {

	private double checkingBalance;
	private double savingsBalance;

	private static int numberOfAccounts = 0;
	private static double totalAmountStored = 0;

	public BankAccount(double checkingBalance, double savingsBalance) {
		this.checkingBalance = checkingBalance;
		this.savingsBalance = savingsBalance;
		totalAmountStored += checkingBalance + savingsBalance;
		numberOfAccounts++;
	}

	// Getters and Setters below
	//
	public double getCheckingBalance() {
		return checkingBalance;
	}

	public void setCheckingBalance(double checkingBalance) {
		this.checkingBalance = checkingBalance;
	}

	public double getSavingsBalance() {
		return savingsBalance;
	}

	public void setSavingsBalance(double savingsBalance) {
		this.savingsBalance = savingsBalance;
	}

	public static int getNumberOfAccounts() {
		return numberOfAccounts;
	}

	public static void setNumberOfAccounts(int numberOfAccounts) {
		BankAccount.numberOfAccounts = numberOfAccounts;
	}

	public static double getTotalAmountStored() {
		return totalAmountStored;
	}

	public static void setTotalAmountStored(double totalAmountStored) {
		BankAccount.totalAmountStored = totalAmountStored;
	}

	// End getters and Setters

	// Methods below here

	public void depositMoney(String accountType, double amount) {
		if (accountType.toLowerCase() == "checking") {
			this.setCheckingBalance(this.getCheckingBalance() + amount);
			totalAmountStored+= amount;
		} else if (accountType.toLowerCase() == "savings") {
			this.setSavingsBalance(this.getSavingsBalance() + amount);
			totalAmountStored+= amount;
		}

	}

	public void withdrawMoney(String accountType, double amount) {
		if (accountType.toLowerCase() == "checking") {
			if (amount > this.getCheckingBalance()) {
				System.out.printf(
						"Your %s account does not have enough balance to handle this withdrawal. Please try withdrawing a lower amount. Current balance is %s",
						accountType, this.getCheckingBalance());
			} else {
				this.setCheckingBalance(this.getCheckingBalance() - amount);
				totalAmountStored -= amount;
			}
		} else if (accountType.toLowerCase() == "savings") {
			if (amount > this.getSavingsBalance()) {
				System.out.printf(
						"Your %s account does not have enough balance to handle this withdrawal. \nPlease try withdrawing a lower amount. Current balance is %s",
						accountType, this.getSavingsBalance());
			} else {
				this.setSavingsBalance(this.getSavingsBalance() - amount);
				totalAmountStored -= amount;
			}
		}
	}

	public String displayTotal() {
		return String.format("Total amount of money stored is $%s", BankAccount.totalAmountStored);
	}

	public String displayTotal(String accountType) {
//		System.out.println(accountType.toLowerCase());
		if (accountType.toLowerCase() == "checking") {
			String message = String.format("Your %s account currently has $%s",accountType, this.getCheckingBalance());
			return message;
		}
		else if (accountType.toLowerCase() == "savings") {
			String message = String.format("Your %s account currently has $%s",accountType, this.getSavingsBalance());
			return message;
		}
		else {
			return "Please specify an account type";
		}
	}
	public String displayTotalAccountsBalance() {
		double balance = this.getCheckingBalance() + this.getSavingsBalance();
		return String.format("Total account balance (checking plus savings) is $%s", balance);
	}
}
