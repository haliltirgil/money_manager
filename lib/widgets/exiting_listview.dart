import 'package:flutter/material.dart';
import 'package:money_flow/providers/exiting_provider.dart';
import 'package:money_flow/theme.dart';
import 'package:provider/provider.dart';

class ExitingForm extends StatefulWidget {
  @override
  _ExitingFormState createState() => _ExitingFormState();
}

class _ExitingFormState extends State<ExitingForm> {
  @override
  Widget build(BuildContext context) {
    final exitingProvider = Provider.of<ExitingProvider>(context);
    return exitingProvider.exitingList.length == 0
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
        : Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: exitingProvider.exitingList.length,
                      itemBuilder: (context, index) {
                        UniqueKey key =
                            exitingProvider.exitingList.keys.elementAt(index);
                        return Card(
                          color: AppColors.redColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                "${exitingProvider.exitingList[key].type}",
                                style: AppColors.fontStyle,
                              ),
                              subtitle: Text(
                                "${exitingProvider.exitingList[key].value}",
                                style: AppColors.fontStyle,
                              ),
                              trailing: Text(
                                "${exitingProvider.exitingList[key].person}",
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
