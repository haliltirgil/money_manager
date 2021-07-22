import 'package:flutter/material.dart';
import 'package:money_flow/widgets/exiting_listview.dart';
import 'package:money_flow/widgets/incoming_listview.dart';

import '../theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildButtons(),
            isSelected[0] == false ? ExitingForm() : IncomingForm(),
          ],
        ),
      ),
    );
  }

  Widget buildButtons() {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 20,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: AppColors.greyColor),
        child: ToggleButtons(
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          selectedColor: Colors.black,
          fillColor: AppColors.whiteColor,
          renderBorder: false,
          color: Colors.white,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 7),
              child: Text("Alınacaklar"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 7),
              child: Text("Verilecekler"),
            ),
          ],
          onPressed: (int index) {
            setState(() {
              if (index == 0) {
                isSelected[index] = true;
                isSelected[index + 1] = false;
              } else {
                isSelected[index] = true;
                isSelected[index - 1] = false;
              }
              print(index);
              print(isSelected);
            });
          },
          isSelected: isSelected,
        ),
      ),
    );
  }
}
