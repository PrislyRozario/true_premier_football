import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/match_fixture_model.dart';
import '../services/api_services.dart';
import '../services/vpn_service.dart';

class HomeController extends GetxController {
  Rx<MatchFixture> matchFixture = MatchFixture().obs;

  RxBool isLoading = true.obs;
  RxBool isLoading2 = true.obs;
  RxBool isLoading3 = true.obs;
  RxBool isLoading4 = true.obs;
  RxBool isLoading5 = true.obs;

  RxBool isLoadingLoadmore = true.obs;
  RxBool isLoadingLoadmore2 = true.obs;

  RxInt newsLastPage = 0.obs;
  RxInt newsCurrentPage = 0.obs;

  RxInt highlightsLastPage = 0.obs;
  RxInt highlightsCurrentPage = 0.obs;

  List allNews = [].obs;
  List highlights = [].obs;

  loadMatches() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    var vpnResult = await CheckVpnConnection.isVpnActive();
    if (connectivityResult != ConnectivityResult.none && !vpnResult) {
      try {
        var response = await ApiService.loadMatches();
        if (response != MatchFixture()) {
          matchFixture.value = response;
        } else {
          showSnackBar(
            'Server error! Please try again.',
            20,
            () {
              loadMatches();
            },
          );
        }
      } catch (e) {
        showSnackBar(
          'Server error! Please try again.',
          20,
          () {
            loadMatches();
          },
        );
      } finally {
        isLoading.value = false;
      }
    } else {
      showSnackBar(
        'No internet connection please try again!',
        20,
        () {
          loadMatches();
        },
      );
    }
  }

  onTypeChange2(v) {
    isLoading2(true);
  }

  void showSnackBar(String message, [int duration = 600, callback]) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.grey[800],
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration),
      action: callback != null
          ? SnackBarAction(
              label: 'Refresh',
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
                callback();
              },
            )
          : null,
    );

    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
