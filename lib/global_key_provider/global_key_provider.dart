import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class _GlobalKeyHolder<T extends State<StatefulWidget>> {
  final GlobalKey<T> key;

  _GlobalKeyHolder(this.key);
}

class GlobalKeyProvider<T extends State<StatefulWidget>>
    extends SingleChildStatelessWidget {
  const GlobalKeyProvider({
    Key? key,
    super.child,
  }) : super(key: key);

  static GlobalKey<T> of<T extends State<StatefulWidget>>(
      BuildContext context) {
    return context.read<_GlobalKeyHolder<T>>().key;
  }

  static GlobalKey<T>? maybeOf<T extends State<StatefulWidget>>(
      BuildContext context) {
    return context.read<_GlobalKeyHolder<T>?>()?.key;
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Provider(
      create: (context) {
        final key = GlobalKey<T>();
        return _GlobalKeyHolder(key);
      },
      child: child,
    );
  }
}
