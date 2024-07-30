import 'package:flutter/material.dart';
import '../screens/transfer_funds.dart';

class QuickActionButtons extends StatelessWidget {
  const QuickActionButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(
            icon: Icons.swap_horiz,
            label: 'Send',
            onTap: () {
              // Navigate to transfer funds screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TransferFunds()));
            }),
        ActionButton(
            icon: Icons.payment_outlined, label: 'Receive', onTap: () {}),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
