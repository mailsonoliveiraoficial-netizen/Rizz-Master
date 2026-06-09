import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class RizzHero extends StatelessWidget {
  const RizzHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, height: 1.2, fontFamily: 'Poppins'),
                  children: [
                    TextSpan(text: 'Transforme qualquer\nconversa em uma\n', style: TextStyle(color: Colors.white)),
                    TextSpan(text: 'oportunidade real.', style: TextStyle(color: AppTheme.primaryPurple)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildCheckItem("Respostas que geram interesse"),
              _buildCheckItem("Análises instantâneas com IA"),
              _buildCheckItem("Mais confiança para você"),
              _buildCheckItem("Mais encontros reais"),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 200,
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/rizz_master_mockup.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 110,
                  height: 190,
                  decoration: BoxDecoration(
                    color: AppTheme.cardColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppTheme.accentPink.withValues(alpha: 0.3)),
                  ),
                  child: const Icon(Icons.phone_android, color: AppTheme.primaryPurple, size: 40),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(color: AppTheme.accentPink, shape: BoxShape.circle),
            child: const Icon(Icons.check, color: Colors.white, size: 12),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}