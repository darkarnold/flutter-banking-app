import './transaction.dart';

class AccountData {
  double balance;
  final List<Transaction> recentTransactions;

  AccountData({
    required this.balance,
    required this.recentTransactions,
  });

  // method to update balance
  void updateBalance(double amount) {
    balance += amount;
  }

  // add transaction to transaction list
  void addTransaction(Transaction transaction) {
    recentTransactions.insert(0, transaction);
  }
}
