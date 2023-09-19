//@dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/paradise.dart';
import 'package:untitled/products.dart';
import 'package:untitled/search.dart';
import 'package:untitled/stagg.dart';
import 'package:untitled/status.dart';
import 'package:untitled/tabbar.dart';

import 'Catogories.dart';
import 'Loginpage.dart';
import 'addproduct.dart';
import 'drpdown.dart';
import 'dynamic.dart';
import 'myHome.dart';
import 'order.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Login(),
    );
  }
}
