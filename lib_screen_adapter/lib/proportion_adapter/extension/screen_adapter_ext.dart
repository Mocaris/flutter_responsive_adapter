import 'package:lib_screen_adapter/proportion_adapter/proportion_adapter.dart';

extension ScreenAdapterExtension on num {
  /// 适配 dp
  /// 参考 [AdapterHolder.covertDp]
  double get dp => AdapterHolder.covertDp(this);

  /// 适配sp
  /// 参考 [AdapterHolder.covertSp]
  double get sp => AdapterHolder.covertSp(this);

  /// 适配spf
  /// 参考 [AdapterHolder.covertSpf]
  double get spf => AdapterHolder.covertSpf(this);
}
