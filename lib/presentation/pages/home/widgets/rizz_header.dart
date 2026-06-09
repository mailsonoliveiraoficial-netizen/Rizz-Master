import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class RizzHeader extends StatelessWidget {
  // Ajustado aqui: removido o "{Key? key} : super(key: key);" antigo
  const RizzHeader({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.wb_twighlight, color: AppTheme.primaryPurple, size: 28),
                  const SizedBox(width: 8),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                      children: [
                        TextSpan(text: 'Rizz ', style: TextStyle(color: Colors.white)),
                        TextSpan(text: 'Master', style: TextStyle(color: AppTheme.accentPink)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                "Sua inteligência para conversas\nque geram conexões reais.",
                style: TextStyle(color: AppTheme.textGrey, fontSize: 13, height: 1.4),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Badge(
            backgroundColor: AppTheme.accentPink,
            smallSize: 8,
            child: Icon(Icons.notifications_none_outlined, color: Colors.white, size: 28),
          ),
        ),
      ],
    );
  }
}