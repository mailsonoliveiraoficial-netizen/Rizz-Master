import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Simulação temporária de carregamento inicial
    Future.delayed(const Duration(seconds: 2), () {
      // O próximo passo será o fluxo de autenticação (Etapa 4)
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bolt,
              size: 80,
              color: Color(0xff8257e5),
            ),
            SizedBox(height: 16),
            Text(
              AppConstants.appName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 24),
            CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xff8257e5)),
            ),
          ],
        ),
      ),
    );
  }
}