import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../providers/credits_provider.dart';

class CreditBalanceCard extends StatelessWidget {
  const CreditBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final creditsProvider = context.watch<CreditsProvider>();

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "${creditsProvider.currentCredits}", // Dinâmico
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Créditos",
                style: TextStyle(color: AppTheme.accentPink, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(color: Colors.white.withValues(alpha: 0.1)),
          const SizedBox(height: 16),
          const _BuildPlanInfo(),
        ],
      ),
    );
  }
}

class _BuildPlanInfo extends StatelessWidget {
  const _BuildPlanInfo();

  @override
  Widget build(BuildContext context) {
    final creditsProvider = context.watch<CreditsProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Plano Atual", style: TextStyle(color: AppTheme.textGrey, fontSize: 12)),
            const SizedBox(height: 4),
            Text(
              creditsProvider.currentPlan, // Dinâmico
              style: const TextStyle(color: AppTheme.primaryPurple, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("Renovação", style: TextStyle(color: AppTheme.textGrey, fontSize: 12)),
            const SizedBox(height: 4),
            Text(
              creditsProvider.renewalDate, // Dinâmico
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}