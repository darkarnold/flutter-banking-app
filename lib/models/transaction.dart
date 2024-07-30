class Transaction {
  // variables for the transaction
  final String id;
  final double amount;
  final DateTime date;
  final String description;

  Transaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.description,
  });
}
