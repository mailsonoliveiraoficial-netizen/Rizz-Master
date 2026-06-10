import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/themes/app_theme.dart';

class RizzResultsView extends StatelessWidget {
  final String tone;
  final List<String> responses; // Recebe a lista real da IA
  final VoidCallback onReset;

  const RizzResultsView({
    super.key,
    required this.tone,
    required this.responses,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Respostas Prontas ✨",
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "Calibradas no tom: $tone",
                  style: const TextStyle(color: AppTheme.accentPink, fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            TextButton.icon(
              onPressed: onReset,
              icon: const Icon(Icons.refresh, color: AppTheme.textGrey, size: 16),
              label: const Text("Nova", style: TextStyle(color: AppTheme.textGrey, fontSize: 13)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        if (responses.isEmpty)
          const Text("Nenhuma resposta gerada.", style: TextStyle(color: Colors.white))
        else
          ...responses.map((response) => _buildResultCard(context, response)),
      ],
    );
  }

  Widget _buildResultCard(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: text));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Copiado para a área de transferência! 🚀"),
                  backgroundColor: AppTheme.primaryPurple,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.copy, color: AppTheme.textGrey, size: 16),
                SizedBox(width: 6),
                Text(
                  "Copiar resposta",
                  style: TextStyle(color: AppTheme.textGrey, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}