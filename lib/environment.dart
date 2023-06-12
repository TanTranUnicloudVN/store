//=================BASE===========================================

enum Env {
  local(code: "LOCAL"),
  dev(code: "DEV"),
  staging(code: "STAGING"),
  prod(code: "PROD"),
  ;

  final String code;

  const Env({
    required this.code,
  });
}

abstract class BaseConfig {
  String get clientUrl;

  String get gatewayUrl;

  String get publicKey;

  String get saveLocalDataPath;

  String get webSocketUrl;

  Env get type;
}

class LocalConfig implements BaseConfig {
  @override
  String get clientUrl => "https://rd-api.hcm.unicloud.ai/pos";

  @override
  String get publicKey => "236977ED0A5D231C513701DA2B76EE56";

  @override
  Env get type => Env.local;

  @override
  String get gatewayUrl => "https://rd-api.hcm.unicloud.ai/pos";
  // String get gatewayUrl => "http://10.20.1.148:1111";

  @override
  String get saveLocalDataPath => "/storage/emulated/0/Download";

  @override
  String get webSocketUrl => 'ws://10.20.1.67:1126/websocket';
}

class DevConfig extends LocalConfig {
  @override
  Env get type => Env.dev;
}

class StagingConfig extends LocalConfig {
  @override
  Env get type => Env.staging;
  @override
  String get clientUrl => "https://smpos.unicloud.com.vn";
  @override
  String get gatewayUrl => "https://smpos.unicloud.com.vn";
}

class ProductConfig extends LocalConfig {
  @override
  Env get type => Env.prod;
}

//=================CALLING=========================================

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String local = "LOCAL";
  static const String dev = "DEV";
  static const String staging = "STAGING";
  static const String product = "PROD";

  BaseConfig? config;

  void initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.local:
        return LocalConfig();
      case Environment.product:
        return ProductConfig();
      case Environment.staging:
        return StagingConfig();
      case Environment.dev:
        return DevConfig();
      default:
        return DevConfig();
    }
  }
}

//==========================================================
