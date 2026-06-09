import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../credits/credits_page.dart'; // Importação da tela de créditos
import 'widgets/rizz_header.dart';
import 'widgets/rizz_hero.dart';
import 'widgets/rizz_credit_card.dart';
import 'widgets/rizz_action_cards.dart';
import 'widgets/rizz_conversation_list.dart';
import 'widgets/rizz_motivation_card.dart';
import 'widgets/rizz_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Lista de telas do Menu Inferior
  List<Widget> get _pages => [
        const _HomeBody(), // 0 - Tela Inicial Atual
        const Center(child: Text("Histórico (Em Breve)", style: TextStyle(color: Colors.white))), // 1 - Histórico
        const CreditsPage(), // 2 - Tela de Créditos Oficial que criamos!
        const Center(child: Text("Perfil (Em Breve)", style: TextStyle(color: Colors.white))), // 3 - Perfil
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: RizzBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// O corpo antigo da sua HomePage foi isolado aqui para manter a organização limpa
class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            RizzHeader(),
            SizedBox(height: 25),
            RizzHero(),
            SizedBox(height: 25),
            RizzCreditCard(),
            SizedBox(height: 30),
            RizzActionCards(),
            SizedBox(height: 30),
            RizzConversationList(),
            SizedBox(height: 25),
            RizzMotivationCard(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}