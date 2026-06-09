import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class RizzMotivationCard extends StatelessWidget {
  const RizzMotivationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [AppTheme.accentPink.withValues(alpha: 0.15), AppTheme.primaryPurple.withValues(alpha: 0.05)],
        ),
        border: Border.all(color: AppTheme.accentPink.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF25182D),
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.accentPink.withValues(alpha: 0.5)),
            ),
            child: const Icon(Icons.track_changes, color: AppTheme.accentPink, size: 24),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Foco no objetivo", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Cada conversa é um passo mais perto do seu próximo encontro.", style: TextStyle(color: Colors.grey, fontSize: 11, height: 1.4)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
            child: const Row(
              children: [
                Text("Ver dicas", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}