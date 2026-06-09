import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class RizzConversationList extends StatelessWidget {
  const RizzConversationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Conversas recentes", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Text("Ver todas", style: TextStyle(color: AppTheme.primaryPurple, fontSize: 14)),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, color: AppTheme.primaryPurple, size: 14),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        _buildRow("Ana ❤️", "Última mensagem: Hoje, 14:32", "Ativa", AppTheme.primaryPurple.withValues(alpha: 0.2), AppTheme.primaryPurple),
        _buildRow("Beatriz", "Última mensagem: Ontem, 21:15", "Ativa", AppTheme.primaryPurple.withValues(alpha: 0.2), AppTheme.primaryPurple),
        _buildRow("Juliana", "Última mensagem: 07/06/2025", "Encontro marcado", const Color(0xFF10B981).withValues(alpha: 0.2), const Color(0xFF10B981)),
      ],
    );
  }

  Widget _buildRow(String name, String status, String badgeText, Color badgeBg, Color badgeTextColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey[800],
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(status, style: const TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: badgeBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(badgeText, style: TextStyle(color: badgeTextColor, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
        ],
      ),
    );
  }
}