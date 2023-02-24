import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:kmps/main.dart';
import 'package:kmps/model/get_login_otp_model.dart';
import 'package:kmps/service/get_login_otp_service.dart';
import 'package:kmps/service/verify_otp_service.dart';
import 'package:kmps/view/constants/loading_class.dart';
import 'package:kmps/view/page/dashboard/dashboard_screen.dart';

import '../model/verify_otp_model.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Rx<GetLoginOtp> getLoginOtpModel = GetLoginOtp().obs;
  Future getLoginOtp({required String phone, required String password}) async {
    DialogHelper.showLoading();
    GetLoginService getLoginService = GetLoginService();
    Map<String, dynamic> data = {'phone': phone, 'password': password};
    String jsonData = json.encode(data);
    try {
      final response = await getLoginService.getLoginOtp(jsonData);
      if (response.statusCode == 200) {
        DialogHelper.hideLoading();

        getLoginOtpModel.value = GetLoginOtp.fromJson(response.data);
        if (getLoginOtpModel.value.otp != null) {
          verifyOtp(
              otp: getLoginOtpModel.value.otp.toString(),
              phone: phone,
              password: password);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Rx<VerifyOtpModel> verifyOtpModel = VerifyOtpModel().obs;
  Future verifyOtp(
      {required String otp,
      required String phone,
      required String password}) async {
    VerifyOtpService verifyOtpService = VerifyOtpService();

    final data = {
      'phone': phone,
      'password': password,
      'device_token': 'device_token',
      'otp': otp,
    };
    String jsonData = json.encode(data);

    try {
      var response = await verifyOtpService.verifyOtp(data: data);
      if (response.statusCode == 200) {
        verifyOtpModel.value = VerifyOtpModel.fromJson(response.data);
        print('============${verifyOtpModel.value.token.toString()}');
        sessionlog.setString('token', verifyOtpModel.value.token.toString());
        if (verifyOtpModel.value.token != null) {
          Get.to(const DashboardScreen());
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
 String findExpireDate(String date){

    String isoString = date;
  DateTime dateTime = DateTime.parse(isoString);
  String formattedDate = DateFormat('d/M/yyyy').format(dateTime);
  return formattedDate;

  }
}
