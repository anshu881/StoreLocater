import 'package:flutter/material.dart';
import 'package:store_loacter_app/store_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'HomeScreen.dart';

void main() async {
  // Initialize Hive database
  await Hive.initFlutter();
  await StoreService.initializeStoreDatabase(); // Load sample stores into the database
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Locator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
