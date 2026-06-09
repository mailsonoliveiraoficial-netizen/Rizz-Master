import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import 'widgets/credit_balance_card.dart';
import 'widgets/extra_packs_section.dart';
import 'widgets/credit_history_section.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Créditos",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            CreditBalanceCard(),
            SizedBox(height: 32),
            ExtraPacksSection(),
            SizedBox(height: 32),
            CreditHistorySection(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}