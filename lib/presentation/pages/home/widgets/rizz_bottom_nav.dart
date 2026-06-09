import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class RizzBottomNav extends StatelessWidget {
  const RizzBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: AppTheme.backgroundColor,
        border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(Icons.home, "Início", true),
          _buildItem(Icons.history, "Histórico", false),
          _buildCenterItem(),
          _buildItem(Icons.bolt, "Créditos", false),
          _buildItem(Icons.person_outline, "Perfil", false),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isActive ? AppTheme.accentPink : Colors.grey, size: 24),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: isActive ? AppTheme.accentPink : Colors.grey, fontSize: 10)),
      ],
    );
  }

  Widget _buildCenterItem() {
    return Container(
      transform: Matrix4.translationValues(0, -10, 0),
      width: 52,
      height: 52,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [AppTheme.primaryPurple, AppTheme.accentPink]),
        boxShadow: [
          BoxShadow(color: AppTheme.primaryPurple, blurRadius: 10, offset: Offset(0, 3)),
        ],
      ),
      child: const Icon(Icons.auto_awesome, color: Colors.white, size: 24),
    );
  }
}