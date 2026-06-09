import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class RizzActionCards extends StatelessWidget {
  const RizzActionCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "O que você quer fazer hoje?",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(child: _buildSingleCard("Analisar conversa", "Cole o texto da conversa e receba sugestões poderosas.", Icons.chat_bubble_outline, AppTheme.primaryPurple)),
            const SizedBox(width: 15),
            Expanded(child: _buildSingleCard("Analisar print", "Envie um print de perfil ou conversa e receba uma análise completa.", Icons.image_outlined, AppTheme.accentPink)),
          ],
        ),
      ],
    );
  }

  Widget _buildSingleCard(String title, String description, IconData icon, Color accentColor) {
    return Container(
      height: 210,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15), 
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: accentColor, size: 26),
          ),
          const Spacer(),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(description, style: const TextStyle(color: Colors.grey, fontSize: 11, height: 1.4)),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(color: Color(0xFF1E233D), shape: BoxShape.circle),
              child: const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
            ),
          )
        ],
      ),
    );
  }
}