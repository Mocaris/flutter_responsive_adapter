part of "proportion_adapter.dart";

/// ScreenAdapter Config Holder
class AdapterHolder {
  AdapterHolder._();

  static final AdapterHolder instance = AdapterHolder._();

  late double _targetSize;

  double get targetSize => _targetSize;

  late MediaQueryData _data;

  MediaQueryData get data => _data;

  late double _dpiRatio;

  double get dpiRatio => _dpiRatio;

  void _update({
    required double targetDpi,
    required MediaQueryData data,
  }) {
    _targetSize = targetDpi;
    _data = data;
    _dpiRatio = _data.size.shortestSide / _targetSize;
  }

  /// 适配 dp,保持缩放比例
  /// 先初始化 [ProportionAdapter.targetDpi]
  static double covertDp(num value) {
    return instance._dpiRatio * value;
  }

  /// 适配文字 sp,保持缩放比例
  /// 先初始化 [ProportionAdapter.targetDpi]
  /// [value] 文字大小
  /// 该方法目前保持和 [covertDp] 一致
  /// 字体大小 会在 TextStyle 中会受到 [MediaQueryData.textScaler] 的影响
  static double covertSp(num value) {
    return instance._dpiRatio * value;
  }

  /// 适配文字 spf, 适用于特殊场景
  /// 先初始化 [ProportionAdapter.targetDpi]
  /// [value] 文字大小
  /// 该方法将 文字大小缩放至 1.0 倍
  /// 仅限于 [TextStyle] 中使用, 其他场景请使用 [covertSp] 或 [covertDp]
  /// 例: Text(text, style: TextStyle(fontSize: ScreenAdapter.covertSpf(value)))
  /// 当 [MediaQueryData.textScaler] 为 TextScaler.noScaling 或者 textScaleFactor=1.0 则无需使用该方法,使用 [covertSp] 即可
  static double covertSpf(num value) {
    return instance._dpiRatio *
        value /
        instance._data.textScaler.textScaleFactor;
  }
}
