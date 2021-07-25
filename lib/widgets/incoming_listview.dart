import 'package:flutter/material.dart';
import 'package:money_flow/theme.dart';

class IncomingForm extends StatefulWidget {
  @override
  _IncomingFormState createState() => _IncomingFormState();
}

class _IncomingFormState extends State<IncomingForm> {
  @override
  Widget build(BuildContext context) {
    return 10 == 0
        ? Padding(
            padding: const EdgeInsets.only(top: 250.0), // responsive
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Alınacak ödeme bulunmamaktadır.",
                style: TextStyle(color: AppColors.fontColor),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 18,
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
                      })
                ],
              ),
            ),
          );
  }
}
