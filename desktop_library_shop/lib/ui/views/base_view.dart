import 'package:desktop_library_shop/core/viewmodels/base_bo.dart';
import 'package:desktop_library_shop/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseBoImpl> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  const BaseView({Key? key, required this.builder, this.onModelReady}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseBoImpl> extends State<BaseView<T>> {
  T model = loc<T>();

  @override
  void initState() {
    widget.onModelReady ?? (model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(
          builder: widget.builder,
        ));
  }
}
