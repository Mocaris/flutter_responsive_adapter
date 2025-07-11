import 'package:flutter/widgets.dart';

export 'extension/responsive_ext.dart';

enum ResponsiveScreenType {
  /// 手表
  watch,

  /// 手机
  phone,

  /// 平板 Pad
  tablet,

  /// PC桌面
  desktop,
}

/// 屏幕 dpi 范围
/// 可设置 范围值
/// 不可都为空
class ScreenDpiRange {
  /// 最小 dpi
  final double? minDpi;

  /// 最大 dpi
  final double? maxDpi;

  const ScreenDpiRange({this.minDpi, this.maxDpi})
      : assert(minDpi != null || maxDpi != null,
            "minDpi or maxDpi can not be null");

  /// 判断 dpi 是否在范围中
  /// [dpi] >= [minDpi] && dpi < [maxDpi]
  bool isInRange(double dpi) {
    if (null != minDpi && null != maxDpi) {
      return dpi >= minDpi! && dpi < maxDpi!;
    }
    if (null != minDpi) {
      return dpi >= minDpi!;
    }
    if (null != maxDpi) {
      return dpi < maxDpi!;
    }
    throw ArgumentError("minDpi or maxDpi can not be null");
  }
}

/// 默认 响应式屏幕 dpi
const ResponsiveScreenDpiSettings kResponsiveScreenSettingsDpi =
    ResponsiveScreenDpiSettings(
  desktopDpi: ScreenDpiRange(minDpi: 1200),
  tabletDpi: ScreenDpiRange(minDpi: 600, maxDpi: 1200),
  phoneDpi: ScreenDpiRange(minDpi: 300, maxDpi: 600),
  watchDpi: ScreenDpiRange(maxDpi: 300),
);

/// 响应式屏幕 dpi 配置
class ResponsiveScreenDpiSettings {
  final ScreenDpiRange desktopDpi;
  final ScreenDpiRange tabletDpi;
  final ScreenDpiRange phoneDpi;
  final ScreenDpiRange watchDpi;

  const ResponsiveScreenDpiSettings({
    required this.desktopDpi,
    required this.tabletDpi,
    required this.phoneDpi,
    required this.watchDpi,
  });

  ResponsiveScreenType getScreenType(double dpi) {
    if (desktopDpi.isInRange(dpi)) {
      return ResponsiveScreenType.desktop;
    }
    if (tabletDpi.isInRange(dpi)) {
      return ResponsiveScreenType.tablet;
    }
    if (phoneDpi.isInRange(dpi)) {
      return ResponsiveScreenType.phone;
    }
    return ResponsiveScreenType.watch;
  }
}

/// 当前屏幕
class ResponsiveScreen {
  final Size screenSize;
  final ResponsiveScreenType screenType;

  Orientation get orientation {
    return screenSize.width > screenSize.height
        ? Orientation.landscape
        : Orientation.portrait;
  }

  ResponsiveScreen({
    required this.screenSize,
    required this.screenType,
  });
}
