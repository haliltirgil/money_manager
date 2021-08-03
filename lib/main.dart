import 'package:flutter/material.dart';
import 'package:money_flow/providers/exiting_provider.dart';
import 'package:money_flow/providers/incoming_provider.dart';
import 'package:money_flow/screens/home_screen.dart';
import 'package:money_flow/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IncomingProvider()),
        ChangeNotifierProvider(create: (_) => ExitingProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColors.greyColor,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
