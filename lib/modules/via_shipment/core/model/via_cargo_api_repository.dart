// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../module.dart';

class ViaCargoApiRepository implements IViaCargoApiRepository {
  final String _baseUrl = 'https://api.viatesting.com.ar';
  String? _token;

  @override
  Future<String?> fetchToken() async {
    final url = Uri.parse('$_baseUrl/sesion');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      // TODO: get the credentials from the config.json file o de la base de datos
      body: jsonEncode({
        'usuario': 'RetiroCharge',
        'usuario_clave': '55446',
        'clave_acceso': 'TEST-sdja83322',
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);

    if (data['status'] == true && data['error'] == false) {
      _token = data['key'];
      return _token;
    } else {
      throw Exception('Error en la respuesta: ${data['descripcion']}');
    }
  }

  @override
  Future<ViaShipmentModel?> getTrackingData({
    String? idEnvio,
    String? numeroEnvio,
    int? interfaz,
    String? tokenRecaptcha,
  }) async {
    if (_token == null) await fetchToken();

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

    if (response.statusCode != 200) {
      throw Exception('Error: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    return ViaShipmentModel.fromApiResponse(data);
  }
}
