import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/ui_util.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class AppTabBody extends StatelessWidget {
  final Widget child;
  final String title;

  const AppTabBody({Key? key, required this.child, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //height: double.maxFinite,
        //width: double.maxFinite,
        decoration: BoxDecoration(
            color: panelBackgroundColor, border: Border.all(color: Colors.black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                color: Color(0xFF0a9396),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
            Expanded(flex: 16, child: child),
          ],
        ));
  }
}

class AppTabHeader extends StatefulWidget {
  final void Function() onTap;
  final int tabIndex;
  int? tabRouterIndex;
  final String imageUrl;
  final String title;
  AppTabHeader(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.tabIndex,
      this.tabRouterIndex,
      required this.onTap})
      : super(key: key);

  @override
  _AppTabHeaderState createState() => _AppTabHeaderState();
}

class _AppTabHeaderState extends State<AppTabHeader> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.imageUrl,
              width: 30,
              height: 30,
            ),
            UIUtil.hXSmallSpace(),
            AppTextLabel(widget.title)
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
            border: (widget.tabRouterIndex == widget.tabIndex)
                ? Border.all(color: Colors.black, width: 3.0)
                : Border.all(color: borderColor, width: 1.0),
            gradient: LinearGradient(
                begin: const Alignment(0, 0.2),
                end: Alignment.bottomCenter,
                colors: [
                  widget.tabRouterIndex == widget.tabIndex ? activeColor : inActiveColor,
                  adjustBrightness()
                ])),
      ),
    );
  }
}
