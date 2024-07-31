import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendMoneyForm extends StatefulWidget {
  const SendMoneyForm({super.key});

  @override
  SendMoneyFormState createState() => SendMoneyFormState();
}

class SendMoneyFormState extends State<SendMoneyForm> {
  final _formKey = GlobalKey<FormState>();
  double amount = 0.0;
  String description = '';
  String accountNumber = '';
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final accountNumberController = TextEditingController();

  @override
  // clear out the text form fields afer user submits
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    accountNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Form(
          key: _formKey,
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
              TextFormField(
                controller: accountNumberController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Recipient Account Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an account number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    accountNumber = value;
                  });
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: amountController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Amount',
                  //prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Amount must be greater than \$0';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    accountNumber = value;
                  });
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Description',
                  )),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
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
        ));
  }
}
