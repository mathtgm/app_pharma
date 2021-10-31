import 'dart:convert';

import 'package:pharma_app/app/data/provider/login_provider.dart';

class LoginUserRepository {
  final LoginApiClient apiClient = LoginApiClient();

  Future<List<dynamic>> autenticarUsuario(String username, String senha) async {
    final json = await apiClient.autenticarUsuario(username, senha);

    final responseMap = jsonDecode(json);
    return responseMap;
  }
}
