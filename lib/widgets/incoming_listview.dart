import 'package:flutter/material.dart';
import 'package:money_flow/providers/incoming_provider.dart';
import 'package:money_flow/theme.dart';
import 'package:provider/provider.dart';

class IncomingForm extends StatefulWidget {
  @override
  _IncomingFormState createState() => _IncomingFormState();
}

class _IncomingFormState extends State<IncomingForm> {
  @override
  Widget build(BuildContext context) {
    final incomingProvider = Provider.of<IncomingProvider>(context);
    return incomingProvider.incomingList.length == 0
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
                      itemCount: incomingProvider.incomingList.length,
                      itemBuilder: (context, index) {
                        UniqueKey key =
                            incomingProvider.incomingList.keys.elementAt(index);
                        return Card(
                          color: AppColors.greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                "${incomingProvider.incomingList[key].type}",
                                style: AppColors.fontStyle,
                              ),
                              subtitle: Text(
                                "${incomingProvider.incomingList[key].value}",
                                style: AppColors.fontStyle,
                              ),
                              trailing: Text(
                                "${incomingProvider.incomingList[key].person}",
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
