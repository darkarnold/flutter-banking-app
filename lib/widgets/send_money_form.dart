import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/account_provider.dart';
import '../models/transfer.dart';

class SendMoneyForm extends StatefulWidget {
  const SendMoneyForm({super.key});

  @override
  SendMoneyFormState createState() => SendMoneyFormState();
}

class SendMoneyFormState extends State<SendMoneyForm> {
  bool isLoading = false;
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
                  style: GoogleFonts.poppins(
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
                onPressed: isLoading
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          // set loading state
                          setState(() {
                            isLoading = true;
                          });
                          final accountProvider = Provider.of<AccountProvider>(
                              context,
                              listen: false);
                          final scaffoldMessenger =
                              ScaffoldMessenger.of(context);

                          // transfer object for sending money
                          Transfer transfer = Transfer(
                            accountNumber: accountNumberController.text,
                            amount: double.parse(amountController.text),
                            description: descriptionController.text,
                          );
                          try {
                            // send money
                            bool success =
                                await accountProvider.sendMoney(transfer);

                            if (success) {
                              scaffoldMessenger.showSnackBar(SnackBar(
                                content: Text(
                                  'Money sent succesfully',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                ),
                                backgroundColor: Colors.green[400],
                              ));

                              Navigator.pop(context);
                            } else {
                              scaffoldMessenger.showSnackBar(SnackBar(
                                content: Text(
                                  'Transfer failed!',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                ),
                                backgroundColor: Colors.red[400],
                              ));
                            }
                          } catch (e) {
                            scaffoldMessenger.showSnackBar(SnackBar(
                              content: Text(
                                e.toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              ),
                              backgroundColor: Colors.red[400],
                            ));
                            setState(() {
                              isLoading = false;
                            });
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.black),
                child: isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text('Send',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )),
              ),
            ],
          ),
        ));
  }
}
