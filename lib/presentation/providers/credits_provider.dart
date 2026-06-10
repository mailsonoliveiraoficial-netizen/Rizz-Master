import 'package:flutter/material.dart';

class CreditTransaction {
  final String title;
  final String value;
  final String date;
  final bool isPositive;

  const CreditTransaction({
    required this.title,
    required this.value,
    required this.date,
    required this.isPositive,
  });
}

class CreditsProvider extends ChangeNotifier {
  int _currentCredits = 25;
  final String _currentPlan = "Premium (100 cr/mês)";
  final String _renewalDate = "15 Jun 2026";

  // Removido o 'final' para permitir manipulação limpa ou reset se necessário,
  // mantendo a lista interna privada.
  final List<CreditTransaction> _history = [
    const CreditTransaction(title: "Renovação Premium", value: "+100", date: "15 Mai", isPositive: true),
    const CreditTransaction(title: "Análise de Texto", value: "-1", date: "Hoje, 14:32", isPositive: false),
    const CreditTransaction(title: "Análise de Print", value: "-3", date: "Ontem, 21:15", isPositive: false),
  ];

  int get currentCredits => _currentCredits;
  String get currentPlan => _currentPlan;
  String get renewalDate => _renewalDate;
  List<CreditTransaction> get history => List.unmodifiable(_history);

  // 🚀 NOVO MÉTODO COMPARTILHADO: Injeta a cantada gerada direto no histórico visual
  bool registerRizzGeneration({required String personName, required bool isPrint}) {
    int cost = isPrint ? 3 : 1;
    String label = isPrint ? "Análise de Print" : "Análise de Texto";

    if (_currentCredits >= cost) {
      _currentCredits -= cost;
      
      // Insere no topo do histórico com o nome customizado fornecido pelo usuário
      _history.insert(
        0,
        CreditTransaction(
          title: "$label: $personName",
          value: "-$cost",
          date: "Agora mesmo",
          isPositive: false,
        ),
      );
      
      notifyListeners();
      return true;
    }
    return false;
  }

  // Regra de Negócio Padrão: Análise de Texto genérica
  bool consumeTextAnalysis() {
    if (_currentCredits >= 1) {
      _currentCredits -= 1;
      _addTransaction("Análise de Texto", "-1", false);
      notifyListeners();
      return true;
    }
    return false;
  }

  // Regra de Negócio Padrão: Análise de Print genérica
  bool consumePrintAnalysis() {
    if (_currentCredits >= 3) {
      _currentCredits -= 3;
      _addTransaction("Análise de Print", "-3", false);
      notifyListeners();
      return true;
    }
    return false;
  }

  // Compra de pacotes extras (Simulação da Sprint 6.2)
  void buyExtraPack(int credits, double price) {
    _currentCredits += credits;
    _addTransaction("Pacote +$credits cr", "+$credits", true);
    notifyListeners();
  }

  void _addTransaction(String title, String value, bool isPositive) {
    _history.insert(
      0,
      CreditTransaction(
        title: title,
        value: value,
        date: "Agora mesmo",
        isPositive: isPositive,
      ),
    );
  }
}