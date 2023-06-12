import 'package:store/loadings/loading_manager.dart';

class CustomLoadingConfig extends LoadingConfig {
  final String message;
  const CustomLoadingConfig({
    super.cancelable,
    required this.message,
  });

  @override
  List<Object?> get props => [...super.props, message];
}
