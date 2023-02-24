import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kmps/view/page/dashboard/dashboard_screen.dart';
import 'package:kmps/view/page/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sessionlog;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sessionlog = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color myCustomColor = Color.fromARGB(255, 13, 65, 121);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: myCustomColor,
        
        primarySwatch: Colors.purple,
      ),
      home: const LoginScreen(),
    );
  }
}
