import 'package:flutter/material.dart';
import 'package:money_flow/theme.dart';

class IncomingForm extends StatefulWidget {
  @override
  _IncomingFormState createState() => _IncomingFormState();
}

class _IncomingFormState extends State<IncomingForm> {
  @override
  Widget build(BuildContext context) {
    return 1 == 0
        ? Center(
            child: Container(
            child: Text(
              "Alınacak ödeme bulunmamaktadır.",
              style: TextStyle(color: AppColors.fontColor),
            ),
          ))
        : ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Card(
                  color: AppColors.greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
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
                  ),
                ),
              );
            },
            itemCount: 15,
          );
  }
}
