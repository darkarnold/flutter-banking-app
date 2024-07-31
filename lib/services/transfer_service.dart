import '../models/transfer.dart';
import '../models/account_data.dart';
import '../models/transaction.dart';

class TransferService {
  Future<bool> makeTransfer(
      AccountData sourceAccount, Transfer transfer) async {
    // simualte api call to make transfer
    await Future.delayed(const Duration(seconds: 2));

    // check if there is sufficient balance to make transfer
    if (sourceAccount.balance < transfer.amount) {
      return false;
    }

    // update account balance
    sourceAccount.updateBalance(-transfer.amount);

    // update recent transactions list after sending money
    Transaction newTransaction = Transaction(
        amount: -transfer.amount,
        date: DateTime.now(),
        description: transfer.description,
        id: transfer.accountNumber);

    sourceAccount.addTransaction(newTransaction);

    return true;
  }
}
