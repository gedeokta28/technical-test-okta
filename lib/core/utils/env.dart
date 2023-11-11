import 'app_settings.dart';

class Env {
  static final Env _instance = Env._internal();
  static late String _baseUrl;

  factory Env() {
    return _instance;
  }

  Env._internal() {
    _baseUrl = baseUrlAPI;
  }

  // getter
  String get baseUrl => _baseUrl;
}
