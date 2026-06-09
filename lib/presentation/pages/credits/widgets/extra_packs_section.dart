import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class ExtraPacksSection extends StatelessWidget {
  const ExtraPacksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Pacotes Extras",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildPackItem("50 Créditos", "R\$ 9,90", Icons.bolt),
        _buildPackItem("150 Créditos", "R\$ 19,90", Icons.auto_awesome),
        _buildPackItem("400 Créditos", "R\$ 39,90", Icons.workspace_premium),
      ],
    );
  }

  Widget _buildPackItem(String title, String price, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12), // Corrigido aqui
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryPurple.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppTheme.primaryPurple, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const Text("Nunca expiram", style: TextStyle(color: AppTheme.textGrey, fontSize: 11)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppTheme.accentPink, AppTheme.primaryPurple]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              price,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}