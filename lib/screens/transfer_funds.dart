import 'Package:flutter/material.dart';

class TransferFunds extends StatelessWidget {
  const TransferFunds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Transfer Funds'),
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
