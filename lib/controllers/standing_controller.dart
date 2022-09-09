import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:true_premier_football/models/standing_details_model.dart';
import 'package:true_premier_football/models/standing_model.dart';
import 'package:true_premier_football/models/standing_year_model.dart';

import '../services/api_services.dart';
import '../services/vpn_service.dart';

class StandingController extends GetxController {
  Rx<Standing> standingData = Standing().obs;
  Rx<StandingYear> standingYearData = StandingYear().obs;
  Rx<StandingDetails> standingDetailsData = StandingDetails().obs;
  RxInt yearType = 0.obs;
  List<String> types = <String>[].obs;
  List<String> typesIds = <String>[].obs;
  RxBool isLoading = true.obs;
  RxBool isLoadingYear = true.obs;
  RxBool isLoadingDetails = true.obs;
  RxBool isLoadingT = true.obs;
  //  StandingController standingController = Get.put(StandingController());
  loadStandingData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    var vpnResult = await CheckVpnConnection.isVpnActive();
    if (connectivityResult != ConnectivityResult.none && !vpnResult) {
      try {
        var response = await ApiService.loadStandings();
        if (response != Standing()) {
          standingData.value = response;
        } else {
          showSnackBar(
            'Server error! Please try again.',
            20,
            () {
              loadStandingData();
            },
          );
        }
      } catch (e) {
        showSnackBar(
          'Server error! Please try again.',
          20,
          () {
            loadStandingData();
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
          loadStandingData();
        },
      );
    }
  }

  onTypeChange(v) {
    isLoadingYear(true);
    isLoadingDetails(true);
    print(v);
    var index = types.indexOf(v.toString());
    yearType.value = index;
    String? years = standingYearData.value.year![index].link.toString();
    loadStandingDetailsData(years);
    isLoadingYear(false);
  }

  loadStandingYearData(String? link) async {
    types.clear();
    typesIds.clear();

    types.add('Default');
    typesIds.add("");

    var connectivityResult = await (Connectivity().checkConnectivity());
    var vpnResult = await CheckVpnConnection.isVpnActive();
    if (connectivityResult != ConnectivityResult.none && !vpnResult) {
      try {
        var response = await ApiService.loadStandingYear(link);

        if (response != StandingYear()) {
          standingYearData.value = response;
          String y = standingYearData.value.year![0].link.toString();
          loadStandingDetailsData(y);
          for (var e in standingYearData.value.year!) {
            types.add(e.year!);
            //   print(e.year);
            typesIds.add(e.ids!);
          }

          isLoadingYear.value = false;
        } else {
          showSnackBar('Server error! Please try again.', 2, () {
            loadStandingYearData(link);
          });
        }
      } catch (e) {
        showSnackBar('Server error! Please try again.', 2, () {
          loadStandingYearData(link);
        });
      } finally {}
    } else {
      showSnackBar('No internet connection please try again!', 2, () {
        loadStandingYearData(link);
      });
    }
  }

  loadStandingDetailsData(String years) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    var vpnResult = await CheckVpnConnection.isVpnActive();
    if (connectivityResult != ConnectivityResult.none && !vpnResult) {
      try {
        var response = await ApiService.loadStandingDetails(years);
        if (response != StandingDetails()) {
          standingDetailsData.value = response;

          print(standingDetailsData.value.toJson());
        } else {
          showSnackBar(
            'Server error! Please try again.',
            20,
            () {
              loadStandingDetailsData(years);
            },
          );
        }
      } catch (e) {
        showSnackBar(
          'Server error! Please try again.',
          20,
          () {
            loadStandingDetailsData(years);
          },
        );
      } finally {
        isLoadingDetails.value = false;
      }
    } else {
      showSnackBar(
        'No internet connection please try again!',
        20,
        () {
          loadStandingDetailsData(years);
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
