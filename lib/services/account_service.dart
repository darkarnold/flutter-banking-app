import '../models/transaction.dart';
import '../models/account_data.dart';

class AccountService {
  Future<AccountData> getAccountData() async {
    // Simulating API call to retrieve account data
    await Future.delayed(const Duration(seconds: 2));
    return AccountData(balance: 20000.00, recentTransactions: [
      Transaction(
        id: '1',
        amount: -200.0,
        date: DateTime.now().subtract(const Duration(days: 1)),
        description: 'Rent',
      ),
      Transaction(
        id: '2',
        amount: 300.0,
        date: DateTime.now().subtract(const Duration(days: 3)),
        description: 'Loan',
      ),
      Transaction(
        id: '3',
        amount: 1000.0,
        date: DateTime.now().subtract(const Duration(days: 2)),
        description: 'Salary',
      ),
      Transaction(
        id: '4',
        amount: -100.0,
        date: DateTime.now().subtract(const Duration(days: 5)),
        description: 'Tithe',
      ),
      Transaction(
        id: '5',
        amount: -200.0,
        date: DateTime.now().subtract(const Duration(days: 4)),
        description: 'Fuel',
      ),
    ]);
  }
}
