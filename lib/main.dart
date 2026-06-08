import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/constants/app_constants.dart';
import 'core/themes/app_theme.dart';
import 'presentation/pages/splash/splash_page.dart';
import 'firebase_options.dart'; // Importado com sucesso!

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa o Firebase com as opções reais geradas pela CLI
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const WingmanAiApp());
}

class WingmanAiApp extends StatelessWidget {
  const WingmanAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const Scaffold(
        body: SplashPage(),
      ),
    );
  }
}