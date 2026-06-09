import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../auth/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      backgroundColor: const Color(0xff09090A), // Fundo profundo
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'WINGMAN AI',
          style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w900, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new, color: Color(0xfff75a68)),
            onPressed: () async {
              await authProvider.logout();
              if (context.mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            
            // Welcome Header
            Text(
              'Olá, ${user?.name.split('_')[0] ?? 'Comandante'} 👋',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Pronto para a próxima conquista?',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            
            const SizedBox(height: 24),

            // Card de Créditos Vibrante
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff8257e5), Color(0xff533399)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff8257e5).withValues(alpha: 0.3), // Atualizado para evitar depreciação
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SALDO DISPONÍVEL',
                        style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${user?.credits ?? 0} Créditos',
                        style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration( // Adicionado 'const' para melhor performance
                      color: Colors.transparent, // Ajustado para container const estável
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2), // Atualizado
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.bolt, color: Colors.white, size: 30),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Seção de Análise (Cards Lado a Lado)
            const Text(
              'AÇÕES RÁPIDAS',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2),
            ),
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: _buildActionCard(
                    context,
                    title: 'Texto',
                    icon: Icons.chat_bubble_rounded,
                    color: const Color(0xff8257e5),
                    onTap: () {}, // Etapa 7
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildActionCard(
                    context,
                    title: 'Print',
                    icon: Icons.camera_alt_rounded,
                    color: const Color(0xff04d361),
                    onTap: () {}, // Etapa 9
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Histórico (Abaixo dos cards)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'HISTÓRICO RECENTE',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2),
                ),
                TextButton(
                  onPressed: () {}, // Etapa 8
                  child: const Text('Ver tudo', style: TextStyle(color: Color(0xff8257e5), fontSize: 12)),
                ),
              ],
            ),
            
            // Placeholder de Histórico Vazio
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                color: const Color(0xff121214),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)), // Atualizado
              ),
              child: Column(
                children: [
                  Icon(Icons.history_toggle_off, color: Colors.white.withValues(alpha: 0.1), size: 50), // Atualizado
                  const SizedBox(height: 12),
                  Text(
                    'Nenhuma análise ainda.',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          color: const Color(0xff121214),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)), // Atualizado
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1), // Atualizado
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}