import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import 'widgets/rizz_header.dart';
import 'widgets/rizz_hero.dart';
import 'widgets/rizz_credit_card.dart';
import 'widgets/rizz_action_cards.dart';
import 'widgets/rizz_conversation_list.dart';
import 'widgets/rizz_motivation_card.dart';
import 'widgets/rizz_bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
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
      ),
      bottomNavigationBar: RizzBottomNav(),
    );
  }
}