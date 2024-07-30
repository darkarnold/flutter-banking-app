import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendMoneyForm extends StatelessWidget {
  const SendMoneyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Text('Send To:',
              style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black))),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Recipient Account Number',
            ),
          ),
          const SizedBox(height: 25),
          const TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Amount',
              //prefixIcon: Icon(Icons.attach_money),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 25),
          const TextField(
              decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Description',
          )),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.black),
            child: Text('Send',
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )),
          ),
        ],
      ),
    );
  }
}
