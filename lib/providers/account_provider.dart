import 'package:flutter/foundation.dart';
import '../models/transaction.dart';
import '../services/account_service.dart';

class AccountProvider extends ChangeNotifier {
  final AccountService accountService;

  // Account balance
  double _balance = 0.0;

  // List of recent transactions
  List<Transaction> _recentTransactions = [];
  bool _isLoading = false;

// error string
  String? _error;

  // Constructor
  AccountProvider({required this.accountService}) {
    fetchAccountData();
  }

// Getters for balance and transactions
  double get balance => _balance;
  List<Transaction> get recentTransactions =>
      List.unmodifiable(_recentTransactions);
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchAccountData() async {
    _isLoading = true;

    notifyListeners();

    try {
      final accountData = await accountService.getAccountData();
      _balance = accountData.balance;
      _recentTransactions = accountData.recentTransactions;
      _error = null;
    } catch (e) {
      _error = "Failed to retrieve account data: ${e.toString()}";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // refresh account data
  Future<void> refreshAccountData() async {
    await fetchAccountData();
  }
}
