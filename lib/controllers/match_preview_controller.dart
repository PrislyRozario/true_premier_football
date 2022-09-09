import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/match_preview.dart';
import '../services/api_services.dart';
import '../services/vpn_service.dart';

class PreviewController extends GetxController {
  Rx<MatchPreview> matchPreview = MatchPreview().obs;

  RxBool isLoading = true.obs;

  loadMatchePreviewData(String gameId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    var vpnResult = await CheckVpnConnection.isVpnActive();
    if (connectivityResult != ConnectivityResult.none && !vpnResult) {
      try {
        var response = await ApiService.loadMatchePreview(gameId);
        if (response != MatchPreview()) {
          matchPreview.value = response;
        } else {
          showSnackBar(
            'Server error! Please try again.',
            20,
            () {
              loadMatchePreviewData(gameId);
            },
          );
        }
      } catch (e) {
        showSnackBar(
          'Server error! Please try again.',
          20,
          () {
            loadMatchePreviewData(gameId);
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
          loadMatchePreviewData(gameId);
        },
      );
    }
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
