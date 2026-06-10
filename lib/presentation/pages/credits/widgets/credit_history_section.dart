import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../providers/credits_provider.dart';

class CreditHistorySection extends StatelessWidget {
  const CreditHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuta as alterações na lista de histórico do Provider em tempo real
    final creditsProvider = context.watch<CreditsProvider>();
    final historyList = creditsProvider.history;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Histórico Recente",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        if (historyList.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Nenhuma movimentação encontrada.",
              style: TextStyle(color: AppTheme.textGrey, fontSize: 14),
            ),
          )
        else
          // Mapeia a lista do provider diretamente para widgets
          ...historyList.map((transaction) => _buildHistoryItem(
                transaction.title,
                transaction.value,
                transaction.date,
                transaction.isPositive,
              )),
      ],
    );
  }

  Widget _buildHistoryItem(String title, String value, String date, bool isPositive) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                isPositive ? Icons.add_circle_outline : Icons.remove_circle_outline,
                color: isPositive ? Colors.green : AppTheme.textGrey,
                size: 20,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
                  Text(date, style: const TextStyle(color: AppTheme.textGrey, fontSize: 11)),
                ],
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: isPositive ? Colors.green : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}