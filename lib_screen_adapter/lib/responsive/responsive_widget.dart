import 'package:flutter/material.dart';

import 'responsive_screen.dart';

export 'responsive_screen.dart';

typedef ResponsiveWidgetBuilder = Widget Function(
  BuildContext context,
  ResponsiveScreen screen,
);

///响应式 layout widget
class ResponsiveLayoutBuilder extends StatelessWidget {
  final ResponsiveWidgetBuilder builder;
  final ResponsiveScreenDpiSettings screenSettings;

  const ResponsiveLayoutBuilder({
    Key? key,
    required this.builder,
    this.screenSettings = kResponsiveScreenSettingsDpi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(context, context.getResponsiveScreen(screenSettings));
  }
}
