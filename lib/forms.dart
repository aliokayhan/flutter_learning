import 'package:flutter/material.dart';
import 'package:learning1/bar_view.dart';

class FormsLearning extends StatefulWidget {
  FormsLearning({Key? key}) : super(key: key);

  @override
  _FormsLearningState createState() => _FormsLearningState();
}

class _FormsLearningState extends State<FormsLearning> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          width: 300,
          height: 300,
          child: new GroupedFillColorBarChart.withRandomData()),
    );
  }
}
