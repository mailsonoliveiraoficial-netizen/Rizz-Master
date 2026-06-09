import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class CreditBalanceCard extends StatelessWidget {
  const CreditBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.primaryPurple.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          const Text(
            "Saldo Atual",
            style: TextStyle(color: AppTheme.textGrey, fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "25",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "Créditos",
                style: TextStyle(color: AppTheme.accentPink, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(color: Colors.white.withValues(alpha: 0.1)),
          const SizedBox(height: 16),
          const _BuildPlanInfo(), // Nome corrigido para PascalCase com const
        ],
      ),
    );
  }
}

// Classe renomeada e otimizada internamente com const para o linter aprovar
class _BuildPlanInfo extends StatelessWidget {
  const _BuildPlanInfo();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Plano Atual", style: TextStyle(color: AppTheme.textGrey, fontSize: 12)),
            SizedBox(height: 4),
            Text(
              "Premium (100 cr/mês)",
              style: TextStyle(color: AppTheme.primaryPurple, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Renovação", style: TextStyle(color: AppTheme.textGrey, fontSize: 12)),
            SizedBox(height: 4),
            Text(
              "15 Jun 2026",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}