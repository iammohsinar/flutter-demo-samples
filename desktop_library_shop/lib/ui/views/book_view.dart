import 'package:desktop_library_shop/ui/widgets/app_panel.dart';
import 'package:desktop_library_shop/ui/widgets/app_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookView extends StatefulWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  _BookViewState createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: AppPanel(
                  child: Container(),
                  title: 'Book Details',
                  headerColor: const Color(0xFF001D74),
                  bodyColor: Colors.white,
                ))),
      ],
    );
  }
}
