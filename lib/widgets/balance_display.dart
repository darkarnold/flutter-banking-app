import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BalanceDisplay extends StatelessWidget {
  final double balance;

  const BalanceDisplay({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.simpleCurrency(
      decimalDigits: 2,
      name: ('USD'),
    );
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Balance',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.grey[100],
                    fontWeight: FontWeight.w500,
                    fontSize: 18)),
          ),
          const SizedBox(height: 8),
          Text(currencyFormatter.format(balance),
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
