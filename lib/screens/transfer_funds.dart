import 'Package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text('Transfer Funds'),
        ),
      ),
    );
  }
}
