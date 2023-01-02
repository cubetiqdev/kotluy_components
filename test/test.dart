// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:component_sdk/components/circle_bottom_navigation/circle_bottom_navi_sdk.dart';
import 'package:component_sdk/components/circle_bottom_navigation/model.dart';
import 'package:component_sdk/components/pie_chart/chart_values_options.dart';
import 'package:component_sdk/components/pie_chart/legend_options.dart';
import 'package:component_sdk/components/pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Test Component1"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: CircleBottomNavigation(
          bottomNavigationBar: CircleBottomBarModel(
              circleColors: [Colors.white, Colors.orange, Colors.redAccent],
              iconTheme: IconThemeData(color: Colors.black45),
              activeIconTheme: IconThemeData(color: Colors.orange),
              backgroundColor: Colors.white,
              titleStyle: TextStyle(color: Colors.black45, fontSize: 12),
              activeTitleStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              actionButtonDetails: CircleActionBottonModel(
                  color: Colors.redAccent,
                  icon: Icon(
                    Icons.expand_less,
                    color: Colors.white,
                  ),
                  elevation: 2),
              elevation: 2.0,
              items: [
                // Suggested count : 4
                CircleBottomBarItems(
                    icon: Icons.verified_user, title: "User", onPressed: () {}),
                CircleBottomBarItems(
                    icon: Icons.supervised_user_circle,
                    title: "Details",
                    onPressed: () {}),
                CircleBottomBarItems(
                    icon: Icons.notifications,
                    title: "Notifications",
                    onPressed: () {}),
                CircleBottomBarItems(
                    icon: Icons.details, title: "New Data", onPressed: () {}),
              ],
              circleItems: [
                //Suggested Count: 3
                SCItem(icon: Icon(Icons.add), onPressed: () {}),
                SCItem(icon: Icon(Icons.print), onPressed: () {}),
                SCItem(icon: Icon(Icons.map), onPressed: () {}),
              ],
              bnbHeight: 80 // Suggested Height 80
              ),
          child: Column(
            children: [
              Container(
                color: Colors.orangeAccent.withAlpha(55),
                child: Center(
                  child: Text("Isn't this Awesome!"),
                ),
              ),
              FloatingActionButton(
                onPressed: () => showButtonSheet(context),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showButtonSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        elevation: 0,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        constraints: BoxConstraints(
          maxWidth: (double.infinity) - 20,
        ),
        builder: (BuildContext context) {
          return Container(
            constraints: BoxConstraints(
              maxWidth: double.infinity,
              maxHeight: double.infinity / 2,
            ),
            margin: EdgeInsets.symmetric(horizontal: 500, vertical: 500),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PieChart(
                      dataMap: dataMap,
                      animationDuration: Duration(milliseconds: 800),
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: colorList,
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 32,
                      centerText: "HYBRID",
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: true,
                        legendShape: BoxShape.circle,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: false,
                        showChartValuesOutside: false,
                        decimalPlaces: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  List<Color> colorList = [Colors.black, Colors.blue, Colors.amber];

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
}
