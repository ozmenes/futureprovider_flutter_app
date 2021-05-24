import 'package:flutter/material.dart';
import 'screens/future_provider.dart';
import 'widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FutureProvider Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: MyFutureBuilder(title: 'FutureProvider Home Page'),
    );
  }
}