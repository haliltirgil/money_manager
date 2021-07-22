import 'package:flutter/material.dart';
import 'package:money_flow/theme.dart';

class ExitingForm extends StatefulWidget {
  @override
  _ExitingFormState createState() => _ExitingFormState();
}

class _ExitingFormState extends State<ExitingForm> {
  @override
  Widget build(BuildContext context) {
    return 1 == 0
        ? Center(
            child: Container(
            child: Text(
              "Verilecek ödeme bulunmamaktadır.",
              style: TextStyle(color: AppColors.fontColor),
            ),
          ))
        : ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Card(
                  color: AppColors.redColor,
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
                ),
              );
            },
            itemCount: 15,
          );
  }
}
