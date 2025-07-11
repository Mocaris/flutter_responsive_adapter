import 'package:flutter/widgets.dart';
import 'package:lib_screen_adapter/screen_adapter.dart';

extension ScreenContextExt on BuildContext {
  ResponsiveScreen getResponsiveScreen(
    ResponsiveScreenDpiSettings screenSettings,
  ) {
    final screenSize = MediaQuery.of(this).size;
    final screenType = screenSettings.getScreenType(screenSize.shortestSide);
    return ResponsiveScreen(screenSize: screenSize, screenType: screenType);
  }
}

extension ResponsiveScreenExt on ResponsiveScreen {
  bool get isLandscape => orientation == Orientation.landscape;

  bool get isDesktop => screenType == ResponsiveScreenType.desktop;

  bool get isTablet => screenType == ResponsiveScreenType.tablet;

  bool get isPhone => screenType == ResponsiveScreenType.phone;

  bool get isWatch => screenType == ResponsiveScreenType.watch;

  bool get isTabletOrDesktop => isTablet || isDesktop;

  T resolveValue<T>({
    required T defValue,
    T? defLandscape,
    T? phone,
    T? phoneLandscape,
    T? tablet,
    T? tabletLandscape,
    T? desktop,
    T? largeDesktop,
    T? watch,
  }) {
    T? orientationValue(T? portraitValue, T? landscapeValue) {
      switch (orientation) {
        case Orientation.landscape:
          return landscapeValue ?? portraitValue;
        case Orientation.portrait:
          return portraitValue;
      }
    }

    T? value;
    switch (screenType) {
      case ResponsiveScreenType.desktop:
        value = orientationValue(desktop, largeDesktop) ??
            orientationValue(tablet, tabletLandscape);
        break;
      case ResponsiveScreenType.tablet:
        value = orientationValue(tablet, tabletLandscape);
        break;
      case ResponsiveScreenType.phone:
        value = orientationValue(phone, phoneLandscape);
        break;
      case ResponsiveScreenType.watch:
        value = watch;
        break;
    }
    return value ?? orientationValue(defValue, defLandscape) ?? defValue;
  }
}
