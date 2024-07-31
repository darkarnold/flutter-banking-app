import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../screens/transaction_details.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: transaction.amount > 0 ? Colors.green : Colors.red,
        child: Icon(
          transaction.amount > 0 ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
      title: Text(transaction.description, style: GoogleFonts.notoSans()),
      subtitle: Text(
        DateFormat('dd-MM-yyyy\nHH:mm').format(transaction.date),
      ),
      trailing: Text(
          '${transaction.amount > 0 ? '+' : '-'}\$${transaction.amount.abs().toStringAsFixed(2)}',
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
              color: transaction.amount > 0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )),
      onTap: () {
        // Navigate to transaction details
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TransactionDetails(transaction: transaction)));
      },
    );
  }
}
