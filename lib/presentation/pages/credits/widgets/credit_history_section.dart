import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class CreditHistorySection extends StatelessWidget {
  const CreditHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Histórico Recente",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildHistoryItem("Renovação Premium", "+100", "15 Mai", true),
        _buildHistoryItem("Análise de Texto", "-1", "Hoje, 14:32", false),
        _buildHistoryItem("Análise de Print", "-3", "Ontem, 21:15", false),
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