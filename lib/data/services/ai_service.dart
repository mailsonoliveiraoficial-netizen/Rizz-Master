import 'package:cloud_functions/cloud_functions.dart';

class AiService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  // Invoca a Cloud Function responsável por falar com a OpenAI
  Future<List<String>> generateTextResponses({
    required String text,
    required String tone,
  }) async {
    try {
      final HttpsCallable callable = _functions.httpsCallable('generateRizzResponses');
      
      final response = await callable.call(<String, dynamic>{
        'text': text,
        'tone': tone,
      });

      // O backend deve retornar uma lista de strings estruturada
      if (response.data != null && response.data['responses'] is List) {
        return List<String>.from(response.data['responses']);
      }
      
      throw Exception("Formato de resposta inválido do servidor.");
    } catch (e) {
      throw Exception("Falha ao gerar respostas da IA: $e");
    }
  }
}