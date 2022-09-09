import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:true_premier_football/consts/app_sizes.dart';
import 'package:true_premier_football/controllers/standing_controller.dart';
import 'package:true_premier_football/models/standing_model.dart';
import 'package:true_premier_football/packages/dropdown_search/dropdown_search.dart';
import 'package:true_premier_football/views/widgets/standing_details_widgets.dart';

import '../../consts/app_colors.dart';
import '../../models/standing_details_model.dart';

class StandingDetailsScreen extends StatefulWidget {
  final League? leagues;
  StandingDetailsScreen(this.leagues, {Key? key}) : super(key: key);

  @override
  State<StandingDetailsScreen> createState() => _StandingDetailsScreenState();
}

class _StandingDetailsScreenState extends State<StandingDetailsScreen> {
  StandingController standingController = Get.find();

  @override
  void initState() {
    super.initState();

    standingController.loadStandingYearData(widget.leagues?.link);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    standingController.types.clear();
    standingController.typesIds.clear();
    standingController.isLoadingYear(true);
    standingController.isLoadingDetails(true);
  }

  int values = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.backgro, AppColors.backgro2],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            title: Text(
              widget.leagues?.name ?? "",
              style: TextStyle(
                //  fontFamily: GoogleFonts.carterOne().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.size18,
              ),
            ),
            centerTitle: true,
          ),
          body: Obx(() => !standingController.isLoadingYear.value
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 50,
                          child: Card(
                            color: AppColors.unselectedBotton.withOpacity(0.1),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: AppColors.unselectedBotton,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Select a session ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppSizes.size14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Obx(() => !standingController
                                            .isLoadingYear.value
                                        ? Container(
                                            height: 40,
                                            width: 140,
                                            alignment: Alignment.centerRight,
                                            child: DropdownSearch(
                                              maxHeight: AppSizes.newSize(16),
                                              dropdownButtonBuilder: (context) {
                                                return Icon(
                                                  Icons.expand_more,
                                                  color: AppColors.text,
                                                  size: AppSizes.size16,
                                                );
                                              },
                                              dropdownBuilder: (context, a, b) {
                                                return Text(
                                                  b.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: AppSizes.size16,
                                                  ),
                                                );
                                              },
                                              dropdownSearchBaseStyle:
                                                  const TextStyle(
                                                      color: Colors.red),
                                              popupBackgroundColor:
                                                  AppColors.backgro,
                                              searchBoxStyle: const TextStyle(
                                                  color: Colors.red),
                                              popupItemBuilder:
                                                  (context, v, s) {
                                                return Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text(
                                                    v.toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: AppSizes.size16,
                                                    ),
                                                  ),
                                                );
                                              },
                                              searchBoxDecoration:
                                                  InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              20.0)),
                                                  borderSide: BorderSide(
                                                    color: AppColors.backgro
                                                        .withOpacity(0.1),
                                                    width: 0,
                                                  ),
                                                ),
                                              ),
                                              dropdownSearchDecoration:
                                                  const InputDecoration(
                                                isDense: true,
                                                fillColor: Colors.transparent,
                                                filled: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                  horizontal: 0,
                                                  vertical: 0,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20.0),
                                                  ),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              hint: "Select a session",
                                              mode: Mode.MENU,
                                              items: standingController.types,
                                              onChanged: standingController
                                                  .onTypeChange,
                                              selectedItem:
                                                  standingController.types[
                                                      standingController
                                                          .yearType.value],
                                              popupSafeArea:
                                                  const PopupSafeArea(
                                                top: false,
                                              ),
                                              popupShape:
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          )
                                        : Transform.scale(
                                            scale: 0.9,
                                            child: Image.asset(
                                              'assets/images/load.png',
                                              height: 20,
                                              color: Colors.white,
                                            ))),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      Obx(() => !standingController.isLoadingDetails.value
                          ? (standingController.standingDetailsData.value.team
                                          ?.length ??
                                      0) >
                                  0
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(
                                    parent: NeverScrollableScrollPhysics(),
                                  ),
                                  itemCount: standingController
                                          .standingDetailsData
                                          .value
                                          .team
                                          ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    Team? team = standingController
                                        .standingDetailsData.value.team?[index];

                                    Point? point = standingController
                                        .standingDetailsData
                                        .value
                                        .point?[index];
                                    if (team!.heding
                                        .toString()
                                        .contains('Group')) {
                                      values = 0;
                                    } else {
                                      values++;
                                    }

                                    return StandingDetailsCard(
                                        team, point, values);
                                  },
                                )
                              : Container(
                                  height: Get.height * 0.5,
                                  child: Center(
                                      child: Text(
                                    "No data available right now!",
                                    style: TextStyle(
                                        fontSize: AppSizes.size16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                                )
                          : Container(
                              height: Get.height * .8,
                              child:
                                  Center(child: CircularProgressIndicator()))),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator())),
        ));
  }
}
