import 'Package:flutter/material.dart';
import '../widgets/send_money_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/account_provider.dart';

class TransferFunds extends StatelessWidget {
  const TransferFunds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Transfer Funds',
          style: GoogleFonts.notoSans(
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Consumer<AccountProvider>(
              builder: (context, accountProvider, _) => const SendMoneyForm()),
        ),
      ),
    );
  }
}
