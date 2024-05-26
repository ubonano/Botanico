import 'dart:convert';
import 'package:http/http.dart' as http;

import '../module.dart';

class ViaCargoRepository implements IViaCargoRepository {
  final String _baseUrl = 'https://api.viatesting.com.ar';
  String? _token;

  @override
  Future<String?> getToken() async {
    final url = Uri.parse('$_baseUrl/sesion');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'usuario': 'RetiroCharge',
        'usuario_clave': '55446',
        'clave_acceso': 'TEST-sdja83322',
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == true && data['error'] == false) {
        _token = data['key'];
        return _token;
      } else {
        print('Error en la respuesta: ${data['descripcion']}');
        return null;
      }
    } else {
      // Manejo de errores según el código de estado
      print('Error: ${response.statusCode}');
      return null;
    }
  }

  @override
  Future<ViaShipmentModel?> getTrackingData({
    String? idEnvio,
    String? numeroEnvio,
    int? interfaz,
    String? tokenRecaptcha,
  }) async {
    if (_token == null) {
      print('Error: Token no disponible. Llama a getToken primero.');
      return null;
    }

    final url = Uri.parse('$_baseUrl/alerce/tracking');
    final queryParams = {
      if (idEnvio != null) 'IdEnvio': idEnvio,
      if (numeroEnvio != null) 'NumeroEnvio': numeroEnvio,
      if (interfaz != null) 'Interfaz': interfaz.toString(),
      'tokenRecaptcha': tokenRecaptcha,
    };

    final response = await http.get(
      url.replace(queryParameters: queryParams),
      headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': _token!,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ViaShipmentModel.fromApiResponse(data);
    } else {
      // Manejo de errores según el código de estado
      print('Error: ${response.statusCode}');
      return null;
    }
  }
}
