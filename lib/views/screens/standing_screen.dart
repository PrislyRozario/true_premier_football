import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:true_premier_football/models/standing_details_model.dart';
import 'package:true_premier_football/views/screens/standing_details_screen.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../../controllers/standing_controller.dart';
import '../../models/standing_model.dart';

class StandingScreen extends StatefulWidget {
  const StandingScreen({Key? key}) : super(key: key);

  @override
  State<StandingScreen> createState() => _StandingScreenState();
}

class _StandingScreenState extends State<StandingScreen> {
  StandingController standingController = Get.put(StandingController());

  @override
  void initState() {
    super.initState();

    standingController.loadStandingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RefreshIndicator(
          onRefresh: () => standingController.loadStandingData(),
          child: Obx(() => !standingController.isLoading.value
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount:
                      standingController.standingData.value.league?.length ?? 0,
                  itemBuilder: (context, index) {
                    League? leagues =
                        standingController.standingData.value.league?[index];
                    return InkWell(
                        onTap: () {
                          Get.to(StandingDetailsScreen(leagues));
                        },
                        child: StandingScreenData(leagues));
                  },
                )
              : Container(
                  height: Get.height * 0.8,
                  child: Center(child: CircularProgressIndicator())))),
    );
  }
}

class StandingScreenData extends StatelessWidget {
  final League? leagues;
  StandingScreenData(this.leagues, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.backgro2,
            width: 1.5,
          ),
          //shape: BoxShape.circle,
        ),
        child: ListTile(
          leading: Container(
            width: AppSizes.newSize(4),
            height: AppSizes.newSize(4),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: AppColors.backgro2,
                width: 1.5,
              ),
              //shape: BoxShape.circle,
            ),
            child: Center(
                child: Text(
              leagues?.ids ?? "",
              style: TextStyle(color: Colors.white),
            )),
          ),
          title: Text(
            leagues?.name ?? "",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          trailing:
              const Icon(Icons.arrow_forward_ios_rounded, color: Colors.red),
        ),
      ),
    );
  }
}
