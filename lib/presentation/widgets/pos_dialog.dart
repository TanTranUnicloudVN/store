import "package:flutter/material.dart";
import "package:store/l10n/generated/l10n.dart";
import "package:store/presentation/home/download_widget.dart";

class AppDialog {
  const AppDialog._();

  static showInstallApp(BuildContext context,
      {required String url, required String domain}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return DownloadWidget(url: url, domain: domain);
        });
  }

  static Future<bool?> showOneButtonDialog(
    BuildContext context, {
    bool barrierDismissible = false,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    String? title,
    String? content,
    String? button,
    bool enable = true,
    WidgetBuilder? titleWidget,
    WidgetBuilder? contentWidget,
    WidgetBuilder? buttonWidget,
    Function()? onPressed,
  }) {
    assert(title == null || titleWidget == null);
    assert(content == null || contentWidget == null);
    assert(button == null || buttonWidget == null);
    return showDialog<bool?>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      builder: (context) {
        final resolvedTitle = titleWidget?.call(context) ??
            (title != null
                ? Text(
                    title,
                    textAlign: TextAlign.center,
                  )
                : null);
        final resolvedContent = contentWidget?.call(context) ??
            (content != null
                ? Text(
                    content,
                    textAlign: TextAlign.center,
                  )
                : null);

        final dialog = AlertDialog(
          scrollable: true,
          title: resolvedTitle,
          content: resolvedContent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  onPressed?.call();
                },
                child: SizedBox(
                  width: 120,
                  height: 24,
                  child: Center(
                    child: Text(
                      S.of(context).accept,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
        return dialog;
      },
    );
  }
}
