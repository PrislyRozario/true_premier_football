import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:true_premier_football/models/match_fixture_model.dart';
import 'package:true_premier_football/views/screens/fixture_match_details_screen.dart';
import '../../consts/app_sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FixtureWidgets extends StatelessWidget {
  final RexFix? fixture;
  const FixtureWidgets(this.fixture, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: fixture?.matches?.length ?? 0,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            String? time;

            var arguments = {
              'title': fixture?.title ?? '',
              'matches': fixture?.matches ?? '',
              'match_id': fixture?.matches?[index].matchId ?? '',
              'tName1': fixture?.matches?[index].tName1 ?? '',
              's_tName1': fixture?.matches?[index].sTName1 ?? '',
              'image1': fixture?.matches?[index].image1 ?? '',
              'tName2': fixture?.matches?[index].tName2 ?? '',
              's_tName2': fixture?.matches?[index].sTName2 ?? '',
              'image2': fixture?.matches?[index].image2 ?? '',
              'mtime': fixture!.matches![index].result != ''
                  ? fixture!.matches![index].result
                  : fixture!.matches![index].mtime,
            };
            Get.to(FixtureMatchView(arguments));
          },
          child: Container(
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: Stack(
              children: [
                ClipRect(
                  child: Container(
                    height: AppSizes.newSize(16),
                    margin: const EdgeInsets.symmetric(
                        // horizontal: 5,
                        // vertical: 5,
                        ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                        Text(
                          fixture?.title ?? "".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppSizes.size13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Row(children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        fixture?.matches?[index].image1 ?? "",
                                    imageBuilder: (context, imageProvider) =>
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
                                    placeholder: (context, url) => Container(
                                      width: AppSizes.newSize(5),
                                      padding: const EdgeInsets.all(5),
                                      height: AppSizes.newSize(5),
                                      child:
                                          Image.asset("assets/images/load.png"),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  SizedBox(height: AppSizes.size12),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: Text(
                                        fixture?.matches?[index].tName1 ??
                                            "".toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: AppSizes.size13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 4,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      fixture!.matches![index].mtime
                                                  .toString() !=
                                              ""
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  // alignment: Alignment.bottomRight,
                                                  height: AppSizes.newSize(2.2),
                                                  child: Text(
                                                    DateFormat('hh:mm:a')
                                                        .format(
                                                      DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                        int.parse(fixture!
                                                                    .matches![
                                                                        index]
                                                                    .mtime ??
                                                                '') *
                                                            1000,
                                                      ),
                                                    ),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                const SizedBox(height: 2),
                                                SizedBox(
                                                  // alignment: Alignment.bottomRight,
                                                  height: AppSizes.newSize(2.2),
                                                  child: Text(
                                                    DateFormat('dd MMM, yyyy ')
                                                        .format(
                                                      DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                        int.parse(fixture!
                                                                    .matches![
                                                                        index]
                                                                    .mtime ??
                                                                '') *
                                                            1000,
                                                      ),
                                                    ),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Text(
                                              fixture!.matches![index].result ??
                                                  "",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.red),
                                              textAlign: TextAlign.start,
                                            ),
                                    ])),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        fixture?.matches?[index].image2 ?? "",
                                    imageBuilder: (context, imageProvider) =>
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
                                    placeholder: (context, url) => Container(
                                      width: AppSizes.newSize(5),
                                      padding: const EdgeInsets.all(5),
                                      height: AppSizes.newSize(5),
                                      child:
                                          Image.asset("assets/images/load.png"),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  SizedBox(height: AppSizes.size12),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: Text(
                                        fixture?.matches?[index].tName2 ??
                                            "".toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppSizes.size13,
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
        );
      },
    );
  }
}
