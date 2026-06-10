import 'package:flutter/material.dart';
import '../../../core/themes/app_theme.dart';
import 'widgets/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  // Dados mockados temporários apenas para validação de UI nesta Sprint 8.1
  List<Map<String, String>> get _mockedHistory => [
        {
          "text": "Ela disse que adorou o lugar mas está sem tempo essa semana... o que eu respondo?",
          "tone": "Confiante",
          "date": "Hoje, 14:32"
        },
        {
          "text": "Oi! Vi seu perfil e achei seu estilo muito maneiro. Você curte rock?",
          "tone": "Natural",
          "date": "Ontem, 21:15"
        },
        {
          "text": "Fiquei pensando no que a gente conversou sobre aquela viagem. Quando vamos?",
          "tone": "Sedutor",
          "date": "05 Jun 2026"
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Histórico de Rizz",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: _mockedHistory.isEmpty 
            ? _buildEmptyState() 
            : ListView.builder(
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                itemCount: _mockedHistory.length,
                itemBuilder: (context, index) {
                  final item = _mockedHistory[index];
                  return HistoryCard(
                    textSnippet: item["text"]!,
                    tone: item["tone"]!,
                    date: item["date"]!,
                    onTap: () {
                      // Comportamento de abertura de detalhes na próxima sprint
                    },
                  );
                },
              ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history_toggle_off, color: AppTheme.textGrey, size: 48),
            SizedBox(height: 16),
            Text(
              "Nenhuma análise ainda",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "As conversas que você calibrar com a IA vão aparecer listadas de forma segura aqui.",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppTheme.textGrey, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}