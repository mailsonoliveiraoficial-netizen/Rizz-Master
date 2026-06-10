import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../text_analysis/text_analysis_page.dart'; // Importação oficial adicionada

class RizzBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const RizzBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

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
          _buildItem(Icons.home, "Início", 0),
          _buildItem(Icons.history, "Histórico", 1),
          _buildCenterItem(context),
          _buildItem(Icons.bolt, "Créditos", 2),
          _buildItem(Icons.person_outline, "Perfil", 3),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String label, int index) {
    final bool isActive = currentIndex == index;
    
    return InkWell(
      onTap: () => onTap(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? AppTheme.accentPink : Colors.grey, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppTheme.accentPink : Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterItem(BuildContext context) {
    return InkWell(
      onTap: () => _showNewAnalysisSheet(context),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
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
      ),
    );
  }

  void _showNewAnalysisSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Nova Análise de Rizz",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Escolha como quer calibrar o seu papo hoje",
                style: TextStyle(color: AppTheme.textGrey, fontSize: 13),
              ),
              const SizedBox(height: 24),
              _buildSheetOption(
                context,
                icon: Icons.chat_bubble_outline,
                title: "Análise por Texto",
                subtitle: "Cole a conversa ou fale a situação (Custo: 1 cr)",
                onTap: () {
                  Navigator.pop(context); // Fecha o BottomSheet de forma limpa
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TextAnalysisPage()), // Rota direta para a UI construída
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildSheetOption(
                context,
                icon: Icons.add_photo_alternate_outlined,
                title: "Análise por Print/Imagem",
                subtitle: "Suba o print da conversa do app (Custo: 3 cr)",
                onTap: () {
                  Navigator.pop(context);
                  // Bloqueado temporariamente — Sem antecipar a Etapa 9
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSheetOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: AppTheme.backgroundColor,
      leading: Icon(icon, color: AppTheme.primaryPurple, size: 28),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: AppTheme.textGrey, fontSize: 12)),
      trailing: const Icon(Icons.arrow_forward_ios, color: AppTheme.textGrey, size: 14),
    );
  }
}