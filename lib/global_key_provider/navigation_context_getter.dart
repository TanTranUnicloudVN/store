import 'package:flutter/material.dart';
import 'global_key_provider.dart';

mixin GlobalKeyNavigationContextGetter {
  BuildContext getNavigatorContext(BuildContext context,
      {GlobalKey<NavigatorState>? navigatorKey}) {
    final resolvedContext = navigatorKey?.currentContext ??
        Navigator.maybeOf(context)?.context ??
        GlobalKeyProvider.of<NavigatorState>(context).currentContext;
    assert(resolvedContext != null);
    return resolvedContext!;
  }
}
