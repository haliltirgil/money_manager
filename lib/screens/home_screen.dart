import 'package:flutter/material.dart';
import 'package:money_flow/models/exiting_model.dart';
import 'package:money_flow/providers/exiting_provider.dart';
import 'package:money_flow/providers/incoming_provider.dart';
import 'package:money_flow/widgets/exiting_listview.dart';
import 'package:money_flow/widgets/incoming_listview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> isSelected = [true, false];

  final TextEditingController personController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  void dispose() {
    personController.dispose();
    typeController.dispose();
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _addElement(context);
              }),
        ),
        centerTitle: true,
        title: Text(
          "A/V Takibi",
          style: AppColors.fontStyle,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                icon: SvgPicture.asset(
                  LogoConstants.appBarLogo,
                  width: 30.0,
                ),
                onPressed: () {
                  _snackBar();
                }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildButtons(),
            isSelected[0] == false ? ExitingForm() : IncomingForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
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

  _snackBar() {
    _calculateTotalMoney();

    if (_calculateTotalMoney() < 0) {
      final snackBar = SnackBar(
        content: Text(_calculateTotalMoney().toString() + " TL Zarardasın."),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: Text(_calculateTotalMoney().toString() + " TL Kardasın."),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  _addElement(BuildContext context) {
    final incomingProvider =
        Provider.of<IncomingProvider>(context, listen: false);

    final exitingProvider =
        Provider.of<ExitingProvider>(context, listen: false);

    showDialog(
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
          child: Column(
            children: [
              SimpleDialog(
                backgroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 60),
                      child: TextFormField(
                        controller: personController,
                        decoration: InputDecoration(
                          fillColor: AppColors.whiteColor,
                          labelText: 'Kişi: ',
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 60),
                      child: TextFormField(
                        controller: typeController,
                        decoration: InputDecoration(
                          fillColor: AppColors.whiteColor,
                          labelText: 'Tür: ',
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 60),
                      child: TextFormField(
                        controller: valueController,
                        decoration: InputDecoration(
                          fillColor: AppColors.whiteColor,
                          labelText: 'Miktar: ',
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.7,
                      height: MediaQuery.of(context).size.height / 20,
                      child: TextButton(
                        onPressed: () {
                          if (isSelected[0] == false) {
                            exitingProvider.addElement(personController.text,
                                typeController.text, valueController.text);
                            FocusScope.of(context).unfocus();
                          } else {
                            incomingProvider.addElement(personController.text,
                                typeController.text, valueController.text);
                          }
                        },
                        child: Text(
                          "Ekle",
                          style: AppColors.fontStyle,
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green[700])),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      context: context,
    );
  }

  int _calculateTotalMoney() {
    int totalIncomingMoney = 0;
    int totalExitingMoney = 0;
    final exitingProvider =
        Provider.of<ExitingProvider>(context, listen: false);

    final incomingProvider =
        Provider.of<IncomingProvider>(context, listen: false);

    for (int i = 0; i < exitingProvider.exitingList.length; i++) {
      totalExitingMoney += 1;
    }
    for (int i = 0; i < incomingProvider.incomingList.length; i++) {
      totalIncomingMoney += 1;
    }

    return totalIncomingMoney - totalExitingMoney;
  }
}
