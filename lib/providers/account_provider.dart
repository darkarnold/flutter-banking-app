import 'package:banking_mobile_app/models/account_data.dart';
import 'package:flutter/foundation.dart';
import '../models/transaction.dart';
import '../models/transfer.dart';
import '../services/account_service.dart';
import '../services/transfer_service.dart';

class AccountProvider extends ChangeNotifier {
  final AccountService accountService;

  // instance of transfer service
  final TransferService transferService = TransferService();

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

  // send money to another account
  Future<bool> sendMoney(Transfer transfer) async {
    // make a copy of cuurent account data
    AccountData accountData = AccountData(
        balance: _balance, recentTransactions: List.from(_recentTransactions));

    bool success = await transferService.makeTransfer(accountData, transfer);

    if (success) {
      _balance = accountData.balance;
      _recentTransactions = accountData.recentTransactions;
      notifyListeners();
    }

    return success;
  }
}
