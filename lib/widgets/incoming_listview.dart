import 'package:flutter/material.dart';
import 'package:money_flow/theme.dart';

class IncomingForm extends StatefulWidget {
  @override
  _IncomingFormState createState() => _IncomingFormState();
}

class _IncomingFormState extends State<IncomingForm> {
  @override
  Widget build(BuildContext context) {
    return 0 == 0
        ? Padding(
            padding: const EdgeInsets.only(top: 250.0), // responsive
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Verilecek ödeme bulunmamaktadır.",
                style: TextStyle(color: AppColors.fontColor),
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        color: AppColors.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              "Kira",
                              style: AppColors.fontStyle,
                            ),
                            subtitle: Text(
                              "1500 TL",
                              style: AppColors.fontStyle,
                            ),
                            trailing: Text(
                              " Ahmet Yılmaz",
                              style: AppColors.fontStyle,
                            ),
                            onTap: () {},
                            onLongPress: () {/* içeriği silecek */},
                          ),
                        ),
                      );
                    },
                    itemCount: 7,
                  ),
                ),
              ],
            ),
          );
  }
}

/* Card(
                        color: AppColors.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              "Kira",
                              style: AppColors.fontStyle,
                            ),
                            subtitle: Text(
                              "1500 TL",
                              style: AppColors.fontStyle,
                            ),
                            trailing: Text(
                              " Ahmet Yılmaz",
                              style: AppColors.fontStyle,
                            ),
                            onTap: () {},
                            onLongPress: () {/* içeriği silecek */},
                          ),
                        ),
                      ); */