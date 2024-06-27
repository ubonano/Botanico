// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../setup/interfaces/i_via_cargo_api_repository.dart';

//999020707477
class ViaCargoApiRepository implements IViaCargoApiRepository {
  final String _environment;
  late final String _baseUrl;
  late final String _usuario;
  late final String _usuarioClave;
  late final String _claveAcceso;
  String? _token;

  ViaCargoApiRepository(this._environment);

  @override
  Future<void> initializeConfig(String environment) async {
    String configPath = 'lib/modules/shipment/content/setup/via_cargo_config_$environment.json';
    final configString = await rootBundle.loadString(configPath);
    final config = json.decode(configString);
    _baseUrl = config['baseUrl'];
    _usuario = config['usuario'];
    _usuarioClave = config['usuario_clave'];
    _claveAcceso = config['clave_acceso'];
  }

  @override
  Future<String?> fetchToken() async {
    await initializeConfig(_environment);

    final url = Uri.parse('$_baseUrl/sesion');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'usuario': _usuario,
        'usuario_clave': _usuarioClave,
        'clave_acceso': _claveAcceso,
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
  Future<ShipmentModel?> getTrackingData({
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
    return ShipmentModel.fromApiResponse(data);
  }
}
