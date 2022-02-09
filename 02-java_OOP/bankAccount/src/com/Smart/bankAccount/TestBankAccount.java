package com.Smart.bankAccount;

public class TestBankAccount {
	
	
	public static void main(String[] args) {
		
		BankAccount account1 = new BankAccount(52, 23);
		BankAccount account2 = new BankAccount(22, 0);
		
		System.out.println(account1.displayTotal("checking"));
		System.out.println(account1.displayTotalAccountsBalance());
		
		account2.depositMoney("checking", 5000);
		System.out.println(account2.displayTotal("checking"));
		account2.withdrawMoney("savings", 200);
		account2.depositMoney("savings", 250);
		System.out.println(account2.displayTotal("savings"));
		account2.withdrawMoney("savings", 200);
		System.out.println(account2.displayTotal("savings"));
		System.out.println(account2.displayTotalAccountsBalance());
		
		System.out.println(account1.displayTotal());
	}
}
