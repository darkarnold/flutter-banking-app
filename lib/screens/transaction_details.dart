import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionDetails extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetails({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details',
            style: GoogleFonts.notoSans(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              transaction.description,
              style: GoogleFonts.notoSans(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    ListTile(
                      leading:
                          Icon(Icons.attach_money, color: Colors.blue[700]),
                      title: Text(
                        'Amount',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      subtitle: Text(
                        '\$${transaction.amount.toStringAsFixed(2)}',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: transaction.amount >= 0
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading:
                        Icon(Icons.calendar_today, color: Colors.blue[700]),
                    title: Text('Date',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        )),
                    subtitle: Text(
                      DateFormat('MMM dd, yyyy - HH:mm')
                          .format(transaction.date),
                      style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.account_balance, color: Colors.blue[700]),
                    title: Text('Account',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        )),
                    subtitle: Text(
                      transaction.id,
                      style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
