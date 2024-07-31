import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../services/authentication_service.dart';
import '../providers/account_provider.dart';
import '../widgets/balance_display.dart';
import '../widgets/transaction_list.dart';
import '../widgets/quick_action_buttons.dart';

class AccountOverview extends StatelessWidget {
  const AccountOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Account Overview',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.blue[800])),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // sign out of the app
              context.read<AuthenticationService>().signOut();
            },
          )
        ],
      ),
      body: Consumer<AccountProvider>(
        builder: (context, accountProvider, child) {
          return RefreshIndicator(
            onRefresh: () => accountProvider.refreshAccountData(),
            child: ListView(padding: const EdgeInsets.all(16), children: [
              BalanceDisplay(balance: accountProvider.balance),
              const SizedBox(height: 20),
              const QuickActionButtons(),
              const SizedBox(height: 20),
              Text('Recent Transactions',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ))),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: accountProvider.recentTransactions.length,
                itemBuilder: (context, index) {
                  return TransactionListItem(
                    transaction: accountProvider.recentTransactions[index],
                  );
                },
              )
            ]),
          );
        },
      ),
    );
  }
}
