import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class RizzCreditCard extends StatelessWidget {
  const RizzCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.primaryPurple, width: 2),
            ),
            child: const Icon(Icons.flash_on, color: AppTheme.primaryPurple, size: 26),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Seus créditos", style: TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 2),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(text: '25 ', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                      TextSpan(text: 'créditos', style: TextStyle(color: AppTheme.primaryPurple, fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                const Text("Renova em 12 dias", style: TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppTheme.accentPink, AppTheme.primaryPurple]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Row(
                children: [
                  Text("Comprar créditos", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}