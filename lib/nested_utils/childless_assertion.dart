import 'package:nested/nested.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

mixin StatefulChildlessAssertion<T extends SingleChildStatefulWidget>
    on SingleChildState<T> {
  @nonVirtual
  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(() {
      if (child == null) {
        throw const ChildlessUsageNotAllowed();
      }
      return true;
    }());
    return buildWithNoneNullChild(context, child!);
  }

  Widget buildWithNoneNullChild(BuildContext context, Widget child) {
    return child;
  }
}

mixin ChildlessAssertion on SingleChildStatelessWidget {
  @nonVirtual
  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(() {
      if (child == null) {
        throw const ChildlessUsageNotAllowed();
      }
      return true;
    }());
    return buildWithNoneNullChild(context, child!);
  }

  Widget buildWithNoneNullChild(BuildContext context, Widget child) {
    return child;
  }
}

class ChildlessUsageNotAllowed implements Exception {
  const ChildlessUsageNotAllowed();

  @override
  String toString() {
    return 'Childless usage outside of $Nested not allowed.';
  }
}
