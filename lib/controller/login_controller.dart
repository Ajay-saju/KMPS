import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kmps/model/get_login_otp_model.dart';
import 'package:kmps/service/get_login_otp_service.dart';
import 'package:kmps/view/constants/loading_class.dart';

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
        print(response.data);

        log(response.data);
        getLoginOtpModel.value = GetLoginOtp.fromJson(response.data);
        print(getLoginOtpModel.value.otp);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
