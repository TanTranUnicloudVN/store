enum ErrorType {
  missingPermission,
  networkError,
}

abstract class SplashNoti {
  const SplashNoti();
}

class SplashNotiHavePermission extends SplashNoti {
  const SplashNotiHavePermission();
}

class SplashNotiSuccess extends SplashNoti {
  const SplashNotiSuccess();
}

class SplashNotiFailed extends SplashNoti {
  const SplashNotiFailed({this.errorType});
  final ErrorType? errorType;
}
