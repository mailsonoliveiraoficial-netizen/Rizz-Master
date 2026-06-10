import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class HistoryCard extends StatelessWidget {
  final String textSnippet;
  final String tone;
  final String date;
  final VoidCallback onTap;

  const HistoryCard({
    super.key,
    required this.textSnippet,
    required this.tone,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.primaryPurple.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                tone,
                style: const TextStyle(color: AppTheme.primaryPurple, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              date,
              style: const TextStyle(color: AppTheme.textGrey, fontSize: 11),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            textSnippet,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: AppTheme.textGrey, size: 14),
      ),
    );
  }
}