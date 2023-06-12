import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:store/loading_handler/custom_loading.dart';
import 'package:store/loading_handler/custom_loading_config.dart';
import 'package:store/loadings/loading_handler.dart';
import 'package:store/loadings/loading_manager.dart';

class PosLoadingHandler extends LoadingHandler
    implements LoadingWidgetBuilderDelegate {
  const PosLoadingHandler({super.key, super.navigatorKey, super.child});

  @override
  SingleChildWidget createHandlerWidget(BuildContext context) {
    return LoadingHandlerWidget(
      navigatorKey: navigatorKey,
      delegate: this,
    );
  }

  @override
  Widget buildLoadingIndicator(BuildContext context, LoadingConfig config) {
    if (config is CustomLoadingConfig) {
      return Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomCupertinoActivityIndicator(color: Colors.white),
          const SizedBox(
            height: 12,
          ),
          Text(
            config.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ));
    } else {
      return const DefaultLoadingIndicator();
    }
  }
}
