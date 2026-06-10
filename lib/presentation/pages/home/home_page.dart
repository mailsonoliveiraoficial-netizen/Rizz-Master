import 'package:flutter/material.dart';
import '../../../core/themes/app_theme.dart';
import '../history/history_page.dart';
import '../credits/credits_page.dart';
import 'widgets/rizz_bottom_nav.dart';
import 'widgets/rizz_credit_card.dart';
import 'widgets/rizz_action_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: _buildBody(),
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

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const _HomeBody();
      case 1:
        return const HistoryPage();
      case 2:
        return const CreditsPage();
      case 3:
        return const Center(child: Text("Perfil", style: TextStyle(color: Colors.white)));
      default:
        return const _HomeBody();
    }
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Header Premium com Logo Coroa e Notificação
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.polyline_sharp, color: AppTheme.primaryPurple, size: 30),
                    SizedBox(width: 10),
                    
                    Text(
                      "Rizz Master",

                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_none, color: Colors.white, size: 26),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 4),
            
            const SizedBox(height: 28),

            // Seção Textos de Marketing Expandida (Sem imagem de mockup)
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, height: 1.2, fontFamily: 'sans-serif'),
                children: [
                  TextSpan(text: "Transforme qualquer conversa em uma", style: TextStyle(color: Colors.white)),
                  TextSpan(
                    text: " Oportunidade Real.",
                    style: TextStyle(color: AppTheme.accentPink, fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildBulletPoint("Respostas que geram interesse"),
            _buildBulletPoint("Análises instantâneas com IA "),
            _buildBulletPoint("Mais confiança para você"),
            _buildBulletPoint("Mais encontros reais"),
            const SizedBox(height: 25),

            // Componente de Créditos
            const RizzCreditCard(),
            const SizedBox(height: 32),
            const SizedBox(height: 16),
            const RizzActionCards(),
            const SizedBox(height: 32),

            // Seção: Conversas Recentes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Conversas recentes",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text("Ver todas", style: TextStyle(color: AppTheme.primaryPurple, fontSize: 13, fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios, color: AppTheme.primaryPurple, size: 12),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildRecentConversationCard(),
            const SizedBox(height: 24),

            // Banner Inferior: Foco no Objetivo
            _buildTargetGoalBanner(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppTheme.accentPink, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentConversationCard() {
    final List<Map<String, dynamic>> users = [
      {"name": "Ana 💗", "status": "Ativa", "msg": "Última mensagem: Hoje, 14:32", "color": AppTheme.primaryPurple.withValues(alpha: 0.2), "textColor": AppTheme.primaryPurple},
      {"name": "Beatriz", "status": "Ativa", "msg": "Última mensagem: Ontem, 21:15", "color": AppTheme.primaryPurple.withValues(alpha: 0.2), "textColor": AppTheme.primaryPurple},
      {"name": "Juliana", "status": "Encontro marcado", "msg": "Última mensagem: 07/06/2025", "color": Colors.greenAccent.withValues(alpha: 0.15), "textColor": Colors.greenAccent},
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: users.map((u) {
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white12,
                      child: Text(u["name"][0], style: const TextStyle(color: Colors.white)),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle, border: Border.all(color: AppTheme.cardColor, width: 1.5)),
                      ),
                    )
                  ],
                ),
                title: Text(u["name"], style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(u["msg"], style: const TextStyle(color: AppTheme.textGrey, fontSize: 11)),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(color: u["color"], borderRadius: BorderRadius.circular(8)),
                      child: Text(u["status"], style: TextStyle(color: u["textColor"], fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_ios, color: AppTheme.textGrey, size: 14),
                  ],
                ),
              ),
              if (users.indexOf(u) != users.length - 1)
                const Divider(color: Colors.white10, height: 1, indent: 16, endIndent: 16),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTargetGoalBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppTheme.cardColor, AppTheme.primaryPurple.withValues(alpha: 0.3)]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.track_changes, color: AppTheme.accentPink, size: 28),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Foco no objetivo", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Cada conversa é um passo mais perto do seu próximo encontro.", style: TextStyle(color: AppTheme.textGrey, fontSize: 11, height: 1.3)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryPurple,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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