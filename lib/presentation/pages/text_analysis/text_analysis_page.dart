import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../data/services/ai_service.dart'; // Importação do Service
import '../../providers/credits_provider.dart';
import 'widgets/tone_selector.dart';
import 'widgets/rizz_results_view.dart';

class TextAnalysisPage extends StatefulWidget {
  const TextAnalysisPage({super.key});

  @override
  State<TextAnalysisPage> createState() => _TextAnalysisPageState();
}

class _TextAnalysisPageState extends State<TextAnalysisPage> {
  final TextEditingController _textController = TextEditingController();
  final AiService _aiService = AiService(); // Instanciação direta e simples
  
  int _charCount = 0;
  String _selectedTone = "Natural";
  bool _isLoading = false;
  bool _showResults = false;
  List<String> _generatedResponses = []; // Guarda os retornos da IA

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _handleGenerateResponses() async {
    final creditsProvider = context.read<CreditsProvider>();
    
    // 🚀 SHIFT DE LÓGICA AQUI: Criamos um rótulo inteligente para o histórico usando o tom escolhido
    final String historyLabel = "Tom $_selectedTone";

    // Chama o novo método unificado que consome 1 crédito e injeta no histórico simultaneamente
    final bool hasConsumed = creditsProvider.registerRizzGeneration(
      personName: historyLabel,
      isPrint: false, // Define como falso pois estamos na tela de input de texto
    );

    if (!hasConsumed) {
      _showInsufficientCreditsDialog();
      return;
    }

    setState(() => _isLoading = true);
    
    try {
      // Executa a chamada real da Cloud Function para a OpenAI
      final results = await _aiService.generateTextResponses(
        text: _textController.text,
        tone: _selectedTone,
      );

      setState(() {
        _generatedResponses = results;
        _showResults = true;
      });
    } catch (e) {
      _showErrorSnackBar(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showInsufficientCreditsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardColor,
        title: const Text("Saldo Insuficiente", style: TextStyle(color: Colors.white)),
        content: const Text("Você precisa de pelo menos 1 crédito para gerar respostas.", style: TextStyle(color: AppTheme.textGrey)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Voltar", style: TextStyle(color: AppTheme.textGrey)),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Erro: $message"),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Análise de Texto", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _isLoading
              ? _buildLoadingState()
              : _showResults
                  ? RizzResultsView(
                      tone: _selectedTone,
                      responses: _generatedResponses,
                      onReset: () => setState(() {
                        _showResults = false;
                        _textController.clear();
                        _charCount = 0;
                        _generatedResponses = [];
                      }),
                    )
                  : _buildFormState(),
        ),
      ),
    );
  }

  Widget _buildFormState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text("O que ela(e) te mandou?", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text("Cole o trecho do chat ou explique o contexto atual da conversa.", style: TextStyle(color: AppTheme.textGrey, fontSize: 13)),
        const SizedBox(height: 24),
        _buildInputArea(),
        const SizedBox(height: 24),
        ToneSelector(onToneSelected: (tone) => _selectedTone = tone),
        const SizedBox(height: 40),
        _buildSubmitButton(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.cardColor, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _textController,
            maxLines: 8,
            maxLength: 3000,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
            onChanged: (text) => setState(() => _charCount = text.length),
            decoration: const InputDecoration(
              hintText: "Ex: Ela disse que adorou o lugar mas está sem tempo essa semana... o que eu respondo?",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "$_charCount / 3000",
            style: TextStyle(color: _charCount >= 3000 ? AppTheme.accentPink : AppTheme.textGrey, fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppTheme.accentPink, AppTheme.primaryPurple]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: _charCount == 0 ? null : _handleGenerateResponses,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        child: const Text("Gerar Respostas", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppTheme.accentPink)),
            SizedBox(height: 24),
            Text("Calibrando o seu Rizz...", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Nossa IA está analisando o melhor gatilho...", style: TextStyle(color: AppTheme.textGrey, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}