import 'package:flutter/cupertino.dart';

class CirculationView extends StatefulWidget {
  const CirculationView({Key? key}) : super(key: key);

  @override
  _CirculationViewState createState() => _CirculationViewState();
}

class _CirculationViewState extends State<CirculationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Circulation view'),
    );
  }
}
