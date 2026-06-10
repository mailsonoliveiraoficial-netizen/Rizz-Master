import 'package:flutter/material.dart';
import '../../../core/themes/app_theme.dart';
import '../history/history_page.dart';
import '../credits/credits_page.dart';
import '../home/widgets/rizz_bottom_nav.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // Lista oficial das telas ligadas ao menu inferior
  final List<Widget> _pages = [
    const MainPage(),          // Índice 0: O conteúdo da sua Home atual
    const HistoryPage(),       // Índice 1: A nova tela de Histórico
    const CreditsPage(),       // Índice 2: A tela de Extrato e Compra de Créditos
    const Center(child: Text("Perfil Provisório", style: TextStyle(color: Colors.white))), // Índice 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      // O IndexedStack mantém o estado das páginas vivo quando você troca de aba
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: RizzBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Atualiza a aba selecionada em tempo real
          });
        },
      ),
    );
  }
}