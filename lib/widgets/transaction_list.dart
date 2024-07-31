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
    final currencyFormatter = NumberFormat.simpleCurrency(
      decimalDigits: 2,
      name: ('USD'),
    );
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: transaction.amount > 0 ? Colors.green : Colors.red,
        child: Icon(
          transaction.amount > 0 ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
      title: Text(transaction.description,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black87),
          )),
      subtitle: Text(
        DateFormat('dd-MM-yyyy\nHH:mm').format(transaction.date),
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 12,
              color: Colors.grey[400],
              fontWeight: FontWeight.normal),
        ),
      ),
      trailing: Text(
          '${transaction.amount > 0 ? '+' : '-'} ${currencyFormatter.format(transaction.amount.abs())}',
          style: GoogleFonts.poppins(
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
