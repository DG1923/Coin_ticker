import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/loadingDataScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import 'price_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Loadingdatascreen(),
    );
  }
}
