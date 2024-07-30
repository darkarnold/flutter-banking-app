import './transaction.dart';

class AccountData {
  final double balance;
  final List<Transaction> recentTransactions;

  AccountData({required this.balance, required this.recentTransactions});
}
