import 'package:flutter/material.dart';
import 'package:money_flow/theme.dart';
import 'package:money_flow/widgets/exiting_listview.dart';
import 'package:money_flow/widgets/incoming_listview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.greyColor,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("A/V Takibi"),
      ),
      body: Container(
        child: ExitingForm(),
        color: AppColors.blackColor,
      ),
    );
  }
}
