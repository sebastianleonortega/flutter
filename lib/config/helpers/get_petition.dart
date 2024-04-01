import 'package:dio/dio.dart';

class GetPetition {
  final _dio = Dio();

  Future getBebida() async {
    final response = await _dio
        .get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka');
    return response.data;
  }

  Future<Map<String, dynamic>> getBebidaById(String bebidaId) async {
    try {
      final response = await _dio.get('https://www.thecocktaildb.com/api/json/v1/1/lookup.php', queryParameters: {'i': bebidaId});

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (data['drinks'] != null && data['drinks'].isNotEmpty) {
          return data['drinks'][0];
        } else {
          throw Exception('No se encontraron detalles para la bebida con ID: $bebidaId');
        }
      } else {
        throw Exception('Error al cargar los detalles de la bebida. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al cargar los detalles de la bebida: $e');
    }
  }
}
