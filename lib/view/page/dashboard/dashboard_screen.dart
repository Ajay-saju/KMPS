import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:kmps/controller/login_controller.dart';
import 'package:kmps/view/constants/app_constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final userData = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(225, 12, 65, 121),
        title: const Text('Dashboard'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 12, 65, 121),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                    ),
                    Text(
                      userData.verifyOtpModel.value.data!.name.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    ),
                    // AppSize.kSizedBox10h,
                    const Text(
                      '(155831)',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    ),
                    // Text(
                    //   userData.verifyOtpModel.value.data!.name.toString(),
                    //   style: const TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white),
                    // ),
                  ],
                ),
              ),
            ),
            Text(
                'LIC.EXPIRE ON: ${userData.findExpireDate(userData.verifyOtpModel.value.data!.expiryDate.toString())} '),
            const ListTile(
              leading: Icon(Icons.dashboard_rounded),
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 65, 121),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.collections_rounded),
              title: Text(
                'Collection',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 65, 121),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home_filled),
              title: Text(
                'Dispatch',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 65, 121),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
