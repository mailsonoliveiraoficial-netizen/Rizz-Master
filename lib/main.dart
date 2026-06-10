import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_constants.dart';
import 'core/themes/app_theme.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/credits_provider.dart'; // Importação do novo provider de créditos
import 'presentation/pages/splash/splash_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const WingmanAiApp());
}

class WingmanAiApp extends StatelessWidget {
  const WingmanAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Mantém a autenticação oficial do projeto
        ChangeNotifierProvider(
          create: (_) => AuthProvider(AuthRepositoryImpl()),
        ),
        // Injeta o controle dinâmico de créditos para todo o app
        ChangeNotifierProvider(
          create: (_) => CreditsProvider(),
        ),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const SplashPage(),
      ),
    );
  }
}