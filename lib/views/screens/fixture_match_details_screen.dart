import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:true_premier_football/controllers/match_preview_controller.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import '../../consts/app_texts.dart';
import '../../models/match_preview.dart';
import '../widgets/preview_screen_widgets.dart';

class FixtureMatchView extends StatefulWidget {
  final Map arguments;
  const FixtureMatchView(this.arguments, {Key? key}) : super(key: key);

  @override
  State<FixtureMatchView> createState() => _FixtureMatchViewState();
}

class _FixtureMatchViewState extends State<FixtureMatchView> {
  //botton visibility
  bool _isVisibilityBOne = true;
  bool _isVisibilityBTwo = true;

  //Top Scorers
  bool _isVisibilityTone = false;
  bool _isVisibilityTsecond = false;
  int selector = 0;

//Most Assist
  bool _isVisibilityMone = false;
  bool _isVisibilityMsecond = false;
  int selectorM = 0;
  PreviewController previewController = Get.put(PreviewController());
  @override
  void initState() {
    super.initState();

    previewController.loadMatchePreviewData(widget.arguments['match_id']);
    _isVisibilityTone = true;
    _isVisibilityMone = true;
    // _isVisibilityBOne = true;
  }

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
          // image: DecorationImage(
          //     image: AssetImage("assets/images/background.jpg"),
          //     fit: BoxFit.fill)
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent),
              title: Text(
                "${widget.arguments['s_tName1']}${" vs "}${widget.arguments['s_tName2']}${" - Match Preview"}",
                style: TextStyle(
                  //  fontFamily: GoogleFonts.carterOne().fontFamily,
                  fontWeight: FontWeight.bold,
                  // fontSize: 24,
                ),
              ),
              centerTitle: true,
              // bottom: PreferredSize(
              //   preferredSize: const Size.fromHeight(40.0),
              //   child: Container(
              //     margin: const EdgeInsets.symmetric(horizontal: 4),
              //     decoration: BoxDecoration(
              //       color: AppColors.backgro2.withOpacity(0.1),
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //   ),
              // ),
            ),
            body: SingleChildScrollView(
              child: Obx(() => !previewController.isLoading.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PreviewScreenWidgetsCard(widget.arguments),
                        (previewController.matchPreview.value.topScorers
                                            ?.length ??
                                        0) <
                                    1 &&
                                (previewController.matchPreview.value
                                            .mostAssists?.length ??
                                        0) <
                                    1 &&
                                (previewController.matchPreview.value.headToHead
                                            ?.length ??
                                        0) <
                                    1
                            ? Container(
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
                            : Column(
                                children: [
                                  //Top Scorers Start

                                  (previewController.matchPreview.value
                                                  .topScorers?.length ??
                                              0) >
                                          0
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  "Top Scorers",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          AppSizes.size18),
                                                ),
                                              ),
                                              Center(
                                                child: Container(
                                                  height: 30,
                                                  width: 260,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .unselectedBotton,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    //shape: BoxShape.circle,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        flex: 5,
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              selector = 0;
                                                              _isVisibilityTone =
                                                                  true;
                                                              _isVisibilityTsecond =
                                                                  false;
                                                            });
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                              color: selector ==
                                                                      0
                                                                  ? AppColors
                                                                      .selectedBotton
                                                                  : AppColors
                                                                      .unselectedBotton,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.network(
                                                                  widget.arguments[
                                                                      'image1'],
                                                                  height: 20,
                                                                  width: 20,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  widget
                                                                      .arguments[
                                                                          's_tName1']
                                                                      .toUpperCase(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 5,
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              selector = 1;
                                                              _isVisibilityTsecond =
                                                                  true;
                                                              _isVisibilityTone =
                                                                  false;
                                                            });
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                              color: selector ==
                                                                      1
                                                                  ? AppColors
                                                                      .selectedBotton
                                                                  : AppColors
                                                                      .unselectedBotton,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.network(
                                                                  widget.arguments[
                                                                      'image2'],
                                                                  height: 20,
                                                                  width: 20,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  widget
                                                                      .arguments[
                                                                          's_tName2']
                                                                      .toUpperCase(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // border: Border.all(
                                                  //   //color: AppColors.background,
                                                  //   width: 0.5,
                                                  // ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const BouncingScrollPhysics(
                                                    parent:
                                                        NeverScrollableScrollPhysics(),
                                                  ),
                                                  itemCount: previewController
                                                          .matchPreview
                                                          .value
                                                          .topScorers[0]
                                                          .length ??
                                                      0,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var topscorer =
                                                        previewController
                                                                .matchPreview
                                                                .value
                                                                .topScorers[0]
                                                            [index];

                                                    return Visibility(
                                                        visible:
                                                            _isVisibilityTone,
                                                        child:
                                                            PreviewScreenWidgetsTopScore(
                                                                topscorer));
                                                  },
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // border: Border.all(
                                                  //   //color: AppColors.background,
                                                  //   width: 0.5,
                                                  // ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const BouncingScrollPhysics(
                                                    parent:
                                                        NeverScrollableScrollPhysics(),
                                                  ),
                                                  itemCount: previewController
                                                          .matchPreview
                                                          .value
                                                          .topScorers[1]
                                                          .length ??
                                                      0,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var topscorer =
                                                        previewController
                                                                .matchPreview
                                                                .value
                                                                .topScorers[1]
                                                            [index];

                                                    return Visibility(
                                                        visible:
                                                            _isVisibilityTsecond,
                                                        child:
                                                            PreviewScreenWidgetsTopScore(
                                                                topscorer));
                                                  },
                                                ),
                                              )
                                            ])
                                      : Center(
                                          child: Container(),
                                        ),

                                  const SizedBox(height: 10),

                                  //Top Scorers End

                                  //Most Assist Start
                                  (previewController.matchPreview.value
                                                  .mostAssists?.length ??
                                              0) >
                                          0
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                "Most Assist",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: AppSizes.size18),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                height: 30,
                                                width: 260,
                                                decoration: BoxDecoration(
                                                  color: AppColors
                                                      .unselectedBotton,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  //shape: BoxShape.circle,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            selectorM = 0;
                                                            _isVisibilityMone =
                                                                true;
                                                            _isVisibilityMsecond =
                                                                false;
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color: selectorM ==
                                                                    0
                                                                ? AppColors
                                                                    .selectedBotton
                                                                : AppColors
                                                                    .unselectedBotton,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.network(
                                                                widget.arguments[
                                                                    'image1'],
                                                                height: 20,
                                                                width: 20,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                widget
                                                                    .arguments[
                                                                        's_tName1']
                                                                    .toUpperCase(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            selectorM = 1;
                                                            _isVisibilityMsecond =
                                                                true;
                                                            _isVisibilityMone =
                                                                false;
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color: selectorM ==
                                                                    1
                                                                ? AppColors
                                                                    .selectedBotton
                                                                : AppColors
                                                                    .unselectedBotton,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.network(
                                                                widget.arguments[
                                                                    'image2'],
                                                                height: 20,
                                                                width: 20,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                widget
                                                                    .arguments[
                                                                        's_tName2']
                                                                    .toUpperCase(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                // border: Border.all(
                                                //   //color: AppColors.background,
                                                //   width: 0.5,
                                                // ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(
                                                  parent:
                                                      NeverScrollableScrollPhysics(),
                                                ),
                                                itemCount: previewController
                                                        .matchPreview
                                                        .value
                                                        .mostAssists[0]
                                                        .length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  var mostassists =
                                                      previewController
                                                              .matchPreview
                                                              .value
                                                              .mostAssists[0]
                                                          [index];

                                                  return Visibility(
                                                      visible:
                                                          _isVisibilityMone,
                                                      child:
                                                          PreviewScreenWidgetsMostAssist(
                                                              mostassists));
                                                },
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                // border: Border.all(
                                                //   //color: AppColors.background,
                                                //   width: 0.5,
                                                // ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(
                                                  parent:
                                                      NeverScrollableScrollPhysics(),
                                                ),
                                                itemCount: previewController
                                                        .matchPreview
                                                        .value
                                                        .mostAssists[1]
                                                        .length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  var mostassists =
                                                      previewController
                                                              .matchPreview
                                                              .value
                                                              .mostAssists[1]
                                                          [index];

                                                  return Visibility(
                                                      visible:
                                                          _isVisibilityMsecond,
                                                      child:
                                                          PreviewScreenWidgetsMostAssist(
                                                              mostassists));
                                                },
                                              ),
                                            )
                                          ],
                                        )
                                      : Center(
                                          child: Container(),
                                        ),

                                  SizedBox(height: 10),

                                  //Most Assist end

                                  //Head to Gead
                                  (previewController.matchPreview.value
                                                  .headToHead?.length ??
                                              0) >
                                          0
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                "Head To Head ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: AppSizes.size18),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              decoration: BoxDecoration(
                                                //  color: Colors.white,
                                                // border: Border.all(
                                                //   //color: AppColors.background,
                                                //   width: 0.5,
                                                // ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(
                                                  parent:
                                                      NeverScrollableScrollPhysics(),
                                                ),
                                                itemCount: previewController
                                                    .matchPreview
                                                    .value
                                                    .headToHead!
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  HeadToHead? headTohead =
                                                      previewController
                                                          .matchPreview
                                                          .value
                                                          .headToHead?[index];

                                                  return HeadToHeadCard(
                                                      headTohead);
                                                },
                                              ),
                                            )
                                          ],
                                        )
                                      : Center(
                                          child: Container(),
                                        ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              )
                      ],
                    )
                  : Container(
                      height: Get.height * 0.8,
                      child: Center(child: CircularProgressIndicator()))),
            )));
  }
}
