import 'package:flutter/material.dart';
import 'package:money_flow/widgets/exiting_listview.dart';

import '../theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: IconButton(icon: Icon(Icons.add), onPressed: () {})),
        centerTitle: true,
        title: Text(
          "A/V Takibi",
          style: AppColors.fontStyle,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(icon: Icon(Icons.attach_money), onPressed: () {}),
          ),
        ],
      ),
      body: Container(
        child: ExitingForm(),
        color: AppColors.blackColor,
      ),
    );
  }
}
