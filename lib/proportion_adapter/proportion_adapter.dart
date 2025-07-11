import 'package:flutter/widgets.dart';

export 'extension/screen_adapter_ext.dart';

part 'adapter_holder.dart';

/// 等比缩放 适配器
/// 配置在APP 顶级 Widget 中
/// @Author mocaris
class ProportionAdapter extends StatelessWidget {
  ///  设计图的逻辑分辨率 单位 dpi
  ///  例: iPhone x/xs/11 375 dpi
  final double targetDpi;

  final MediaQueryData? data;

  final Widget? child;

  final TransitionBuilder builder;

  const ProportionAdapter({
    Key? key,
    required this.targetDpi,
    required this.builder,
    this.child,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(
      context.findAncestorWidgetOfExactType<ProportionAdapter>() == null,
      'ProportionAdapter can only be used once in the widget tree.',
    );
    final data = this.data ?? MediaQuery.of(context);
    AdapterHolder.instance._update(
      targetDpi: targetDpi,
      data: data,
    );
    return MediaQuery(
      data: data,
      child: builder(context, child),
    );
  }
}
