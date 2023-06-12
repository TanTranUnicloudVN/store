import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import '../nested_utils/childless_assertion.dart';
import 'global_key_provider.dart';

class GlobalKeyProviderWrapper<T extends State<StatefulWidget>>
    extends SingleChildStatelessWidget with ChildlessAssertion {
  const GlobalKeyProviderWrapper({
    super.key,
    this.children = const [],
  });

  final List<SingleChildWidget> children;

  @override
  Widget buildWithNoneNullChild(BuildContext context, Widget child) {
    return Nested(
      children: [
        GlobalKeyProvider<T>(),
        ...children,
      ],
      child: child,
    );
  }
}
