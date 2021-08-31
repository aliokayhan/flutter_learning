import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:learning1/simple_view.dart';

import 'bar_view.dart';

class RadarExample extends StatefulWidget {
  const RadarExample({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RadarExample> {
  bool darkMode = false;
  bool useSides = true;
  double numberOfFeatures = 7;

  @override
  Widget build(BuildContext context) {
    var graphColors = [
      Color(0xFFff825b).withOpacity(.90),
      Colors.black,
      Colors.red,
      Colors.blue,
    ];
    const ticks = [20, 40, 60, 80, 100];
    var features = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
    var data = [
      [45, 60, 85, 90, 55, 77, 35],
      // [10, 20, 30, 40, 50, 60, 70],
      // [15, 30, 45, 60, 75, 90, 100],
    ];

    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Radar Chart Example'),
      ),
      body: Container(
        color: darkMode ? Colors.black : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  darkMode
                      ? Text(
                          'Light mode',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          'Dark mode',
                          style: TextStyle(color: Colors.black),
                        ),
                  Switch(
                    value: this.darkMode,
                    onChanged: (value) {
                      setState(() {
                        darkMode = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  useSides
                      ? Text(
                          'Polygon border',
                          style: darkMode
                              ? TextStyle(color: Colors.white)
                              : TextStyle(color: Colors.black),
                        )
                      : Text(
                          'Circular border',
                          style: darkMode
                              ? TextStyle(color: Colors.white)
                              : TextStyle(color: Colors.black),
                        ),
                  Switch(
                    value: this.useSides,
                    onChanged: (value) {
                      setState(() {
                        useSides = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Number of features',
                    style: TextStyle(
                        color: darkMode ? Colors.white : Colors.black),
                  ),
                  Expanded(
                    child: Slider(
                      value: this.numberOfFeatures,
                      min: 3,
                      max: 8,
                      divisions: 8,
                      onChanged: (value) {
                        setState(() {
                          numberOfFeatures = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: !darkMode
                  ? Container(
                      width: 250,
                      child: RadarChart(
                        ticks: ticks,
                        features: features,
                        data: data,
                        reverseAxis: false,
                        graphColors: graphColors,
                        featuresTextStyle:
                            TextStyle(fontSize: 12, color: Colors.black),
                        sides: features.length,
                        outlineColor: Color(0xFFff825b).withOpacity(.99),
                        axisColor: Color(0xFFff825b).withOpacity(.80),
                        ticksTextStyle: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(.5)),
                      ),
                    )
                  : RadarChart.light(
                      ticks: ticks,
                      features: features,
                      data: data,
                      reverseAxis: false,
                      useSides: useSides,
                    ),
            ),
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: Container(
                  width: 300,
                  height: 300,
                  child: new SimpleLineChart.withSampleData()),
              // child: new GroupedFillColorBarChart.withRandomData()),
            )
          ],
        ),
      ),
    );
  }
}
