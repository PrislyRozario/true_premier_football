import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:true_premier_football/controllers/match_preview_controller.dart';
import 'package:true_premier_football/models/match_preview.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';

class PreviewScreenWidgetsCard extends StatelessWidget {
  final Map arguments;

  const PreviewScreenWidgetsCard(this.arguments, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreviewController previewController = Get.find();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  //color: AppColors.background,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    child: Stack(
                      children: [
                        ClipRect(
                          child: Container(
                            height: AppSizes.newSize(14),
                            margin: const EdgeInsets.symmetric(
                                // horizontal: 5,
                                // vertical: 5,
                                ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Row(children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: arguments['image1'],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: AppSizes.newSize(5),
                                              height: AppSizes.newSize(5),
                                              decoration: BoxDecoration(
                                                // color: AppColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                // border: Border.all(
                                                //   //color: AppColors.backgro,
                                                //   width: 1.5,
                                                // ),
                                                //shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Container(
                                              width: AppSizes.newSize(5),
                                              padding: const EdgeInsets.all(5),
                                              height: AppSizes.newSize(5),
                                              child: Image.asset(
                                                  "assets/images/load.png"),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          SizedBox(height: AppSizes.size12),
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              child: Text(
                                                arguments['s_tName1']
                                                    .toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: AppSizes.size14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      " Vs".toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: AppSizes.size20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: arguments['image2'],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: AppSizes.newSize(5),
                                              height: AppSizes.newSize(5),
                                              decoration: BoxDecoration(
                                                //     color: AppColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                // border: Border.all(
                                                //   color: AppColors.backgro,
                                                //   width: 1.5,
                                                // ),
                                                //shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Container(
                                              width: AppSizes.newSize(5),
                                              padding: const EdgeInsets.all(5),
                                              height: AppSizes.newSize(5),
                                              child: Image.asset(
                                                  "assets/images/load.png"),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          SizedBox(height: AppSizes.size12),
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              child: Text(
                                                arguments['s_tName2']
                                                    .toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: AppSizes.size14,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    // alignment: Alignment.bottomRight,

                    child: previewController.matchPreview.value.gameInfo != ""
                        ? Column(
                            children: [
                              SizedBox(
                                // alignment: Alignment.bottomRight,
                                height: AppSizes.newSize(2.2),
                                child: Text(
                                  previewController
                                      .matchPreview.value.gameInfo!.vanue
                                      .toString(),
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const SizedBox(height: 2),
                              SizedBox(
                                // alignment: Alignment.bottomRight,
                                height: AppSizes.newSize(2.2),
                                child: Text(
                                  DateFormat('dd MMM, yyyy ').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(arguments['mtime']) * 1000,
                                    ),
                                  ),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
        )
      ],
    );
  }
}

class PreviewScreenWidgetsTopScore extends StatefulWidget {
  final topscorer;
  const PreviewScreenWidgetsTopScore(this.topscorer, {Key? key})
      : super(key: key);

  @override
  State<PreviewScreenWidgetsTopScore> createState() =>
      _PreviewScreenWidgetsTopScoreState();
}

class _PreviewScreenWidgetsTopScoreState
    extends State<PreviewScreenWidgetsTopScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   //color: AppColors.background,
          //   width: 0.5,
          // ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl:
                "https://w7.pngwing.com/pngs/672/999/png-transparent-t-shirt-hoodie-sleeve-sports-fan-jersey-mockup-jersey-tshirt-white-logo.png",
            imageBuilder: (context, imageProvider) => Container(
              width: AppSizes.newSize(5),
              height: AppSizes.newSize(5),
              decoration: BoxDecoration(
                // color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(100),
                // border: Border.all(
                //   //color: AppColors.backgro,
                //   width: 1.5,
                // ),
                //shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => Container(
              width: AppSizes.newSize(5),
              padding: const EdgeInsets.all(5),
              height: AppSizes.newSize(5),
              child: Image.asset("assets/images/load.png"),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          title: Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.topscorer['pName'],
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: AppSizes.size16),
              ),
              Text(
                widget.topscorer['pStatus'],
                style: TextStyle(fontSize: AppSizes.size16),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Jersey",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: AppSizes.size16),
              ),
              Text(
                widget.topscorer['pJarcyNo'],
                style: TextStyle(fontSize: AppSizes.size16),
              ),
            ],
          ),
        ));
  }
}
//  Text(widget.topscorer['pName']),

class PreviewScreenWidgetsMostAssist extends StatefulWidget {
  final mostassists;
  PreviewScreenWidgetsMostAssist(this.mostassists, {Key? key})
      : super(key: key);

  @override
  State<PreviewScreenWidgetsMostAssist> createState() =>
      _PreviewScreenWidgetsMostAssistState();
}

class _PreviewScreenWidgetsMostAssistState
    extends State<PreviewScreenWidgetsMostAssist> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   //color: AppColors.background,
          //   width: 0.5,
          // ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl:
                "https://w7.pngwing.com/pngs/672/999/png-transparent-t-shirt-hoodie-sleeve-sports-fan-jersey-mockup-jersey-tshirt-white-logo.png",
            imageBuilder: (context, imageProvider) => Container(
              width: AppSizes.newSize(5),
              height: AppSizes.newSize(5),
              decoration: BoxDecoration(
                // color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(100),
                // border: Border.all(
                //   //color: AppColors.backgro,
                //   width: 1.5,
                // ),
                //shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => Container(
              width: AppSizes.newSize(5),
              padding: const EdgeInsets.all(5),
              height: AppSizes.newSize(5),
              child: Image.asset("assets/images/load.png"),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          title: Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.mostassists['pName'],
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: AppSizes.size16),
              ),
              Text(
                widget.mostassists['pStatus'],
                style: TextStyle(fontSize: AppSizes.size16),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Jersey",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: AppSizes.size16),
              ),
              Text(
                widget.mostassists['pJarcyNo'],
                style: TextStyle(fontSize: AppSizes.size16),
              ),
            ],
          ),
        ));
  }
}

class HeadToHeadCard extends StatelessWidget {
  final HeadToHead? headTohead;
  const HeadToHeadCard(this.headTohead, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(
                //   //color: AppColors.background,
                //   width: 0.5,
                // ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          headTohead?.league ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: AppSizes.size14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        Text(
                          headTohead?.gameDate ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: AppSizes.size14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        // SizedBox(
                        // //               // alignment: Alignment.bottomRight,
                        //               height: AppSizes.newSize(2.2),
                        //               child: Text(
                        //                 DateFormat('dd MMM, yyyy ').format(
                        //                   DateTime.fromMillisecondsSinceEpoch(
                        //                    int.parse(    headTohead?.gameDate??"") * 1000,
                        //                   ),
                        //                 ),
                        //                 style: const TextStyle(
                        //                     fontWeight: FontWeight.normal,
                        //                     color: Colors.black),
                        //                 textAlign: TextAlign.start,
                        //               ),
                        //             ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 2,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Stack(
                      children: [
                        ClipRect(
                          child: Container(
                            height: AppSizes.newSize(14),
                            margin: const EdgeInsets.symmetric(
                                // horizontal: 5,
                                // vertical: 5,
                                ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(
                              //   color: Colors.grey.shade200,
                              //   width: 0.5,
                              // ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Row(children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: headTohead?.t1Img ?? "",
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: AppSizes.newSize(5),
                                              height: AppSizes.newSize(5),
                                              decoration: BoxDecoration(
                                                // color: AppColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                // border: Border.all(
                                                //   //color: AppColors.backgro,
                                                //   width: 1.5,
                                                // ),
                                                //shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Container(
                                              width: AppSizes.newSize(5),
                                              padding: const EdgeInsets.all(5),
                                              height: AppSizes.newSize(5),
                                              child: Image.asset(
                                                  "assets/images/load.png"),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          SizedBox(height: AppSizes.size12),
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              child: Text(
                                                headTohead?.team1 ??
                                                    "".toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: AppSizes.size14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Expanded(
                                    //     flex: 4,
                                    //     child: Column(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.spaceEvenly,
                                    //         children: [
                                    //           fixture!.matches![index].mtime
                                    //                       .toString() !=
                                    //                   ""
                                    //               ? Column(
                                    //                   children: [
                                    //                     SizedBox(
                                    //                       // alignment: Alignment.bottomRight,
                                    //                       height: AppSizes.newSize(2.2),
                                    //                       child: Text(
                                    //                         DateFormat('hh:mm:a')
                                    //                             .format(
                                    //                           DateTime
                                    //                               .fromMillisecondsSinceEpoch(
                                    //                             int.parse(fixture!
                                    //                                         .matches![
                                    //                                             index]
                                    //                                         .mtime ??
                                    //                                     '') *
                                    //                                 1000,
                                    //                           ),
                                    //                         ),
                                    //                         style: const TextStyle(
                                    //                             fontWeight:
                                    //                                 FontWeight.normal,
                                    //                             color: Colors.black),
                                    //                         textAlign: TextAlign.start,
                                    //                       ),
                                    //                     ),
                                    //                     const SizedBox(height: 2),
                                    //                     SizedBox(
                                    //                       // alignment: Alignment.bottomRight,
                                    //                       height: AppSizes.newSize(2.2),
                                    //                       child: Text(
                                    //                         DateFormat('dd MMM, yyyy ')
                                    //                             .format(
                                    //                           DateTime
                                    //                               .fromMillisecondsSinceEpoch(
                                    //                             int.parse(fixture!
                                    //                                         .matches![
                                    //                                             index]
                                    //                                         .mtime ??
                                    //                                     '') *
                                    //                                 1000,
                                    //                           ),
                                    //                         ),
                                    //                         style: const TextStyle(
                                    //                             fontWeight:
                                    //                                 FontWeight.normal,
                                    //                             color: Colors.black),
                                    //                         textAlign: TextAlign.start,
                                    //                       ),
                                    //                     ),
                                    //                   ],
                                    //                 )
                                    //               : Text(
                                    //                   fixture!.matches![index].result ??
                                    //                       "",
                                    //                   style: const TextStyle(
                                    //                       fontWeight: FontWeight.normal,
                                    //                       color: Colors.red),
                                    //                   textAlign: TextAlign.start,
                                    //                 ),
                                    //         ])),
                                    Text(
                                      headTohead?.score ?? "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: AppSizes.size20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: headTohead?.t2Img ?? "",
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: AppSizes.newSize(5),
                                              height: AppSizes.newSize(5),
                                              decoration: BoxDecoration(
                                                //     color: AppColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                // border: Border.all(
                                                //   color: AppColors.backgro,
                                                //   width: 1.5,
                                                // ),
                                                //shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Container(
                                              width: AppSizes.newSize(5),
                                              padding: const EdgeInsets.all(5),
                                              height: AppSizes.newSize(5),
                                              child: Image.asset(
                                                  "assets/images/load.png"),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          SizedBox(height: AppSizes.size12),
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              child: Text(
                                                headTohead?.team2 ??
                                                    "".toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: AppSizes.size14,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   // alignment: Alignment.bottomRight,

                  //   child: Column(
                  //           children: [
                  //             // SizedBox(
                  //             //   // alignment: Alignment.bottomRight,
                  //             //   height: AppSizes.newSize(2.2),
                  //             //   child: Text(
                  //             //     DateFormat('hh:mm:a').format(
                  //             //       DateTime.fromMillisecondsSinceEpoch(
                  //             //         int.parse(    headTohead?.gameDate??"") * 1000,
                  //             //       ),
                  //             //     ),
                  //             //     style: const TextStyle(
                  //             //         fontWeight: FontWeight.normal,
                  //             //         color: Colors.black),
                  //             //     textAlign: TextAlign.start,
                  //             //   ),
                  //             // ),
                  //             const SizedBox(height: 2),
                  //             SizedBox(
                  //               // alignment: Alignment.bottomRight,
                  //               height: AppSizes.newSize(2.2),
                  //               child: Text(
                  //                 DateFormat('dd MMM, yyyy ').format(
                  //                   DateTime.fromMillisecondsSinceEpoch(
                  //                    int.parse(    headTohead?.gameDate??"") * 1000,
                  //                   ),
                  //                 ),
                  //                 style: const TextStyle(
                  //                     fontWeight: FontWeight.normal,
                  //                     color: Colors.black),
                  //                 textAlign: TextAlign.start,
                  //               ),
                  //             ),
                  //           ],
                  //         ),

                  // ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
        )
      ],
    );
  }
}
