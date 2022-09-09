// ignore_for_file: unrelated_type_equality_checks

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:true_premier_football/consts/app_colors.dart';
import 'package:true_premier_football/models/standing_details_model.dart';

import '../../consts/app_sizes.dart';

class StandingDetailsCard extends StatelessWidget {
  final Team? team;
  final Point? point;
  final int index;
  StandingDetailsCard(this.team, this.point, this.index, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == 0 ? EdgeInsets.only(top: 10) : EdgeInsets.all(0),
      decoration: index == 0
          ? BoxDecoration(
              color: AppColors.splashBackground,
              border: Border.all(
                color: Colors.black,
                //color: AppColors.background,
                //width: 10,
              ),
            )
          : BoxDecoration(
              color: AppColors.unselectedBotton,
              border: Border.all(color: Colors.white)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Row(
        children: [
          index == 0
              ? Expanded(
                  child: Text(
                  '#',
                  style: TextStyle(color: Colors.white),
                ))
              : Expanded(
                  child: Text('$index', style: TextStyle(color: Colors.white))),
          index == 0
              ? Expanded(
                  flex: 6,
                  child: Text(
                    team?.heding ?? "",
                    style: TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.bold),
                  ),
                )
              : Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      index != 0
                          ? CachedNetworkImage(
                              imageUrl: team?.logo ?? "",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: AppSizes.newSize(3.5),
                                height: AppSizes.newSize(3.5),
                                decoration: BoxDecoration(
                                  // color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(100),
                                  // border: Border.all(
                                  //   //color: AppColors.backgro,
                                  //   width: 1.5,
                                  // ),
                                  //shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => Container(
                                width: AppSizes.newSize(5),
                                padding: const EdgeInsets.all(5),
                                height: AppSizes.newSize(5),
                                child: Image.asset("assets/images/load.png"),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          : Container(),
                      Expanded(
                        child: Text(team?.heding ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
          Expanded(
              child: Text(point?.gP ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          Expanded(
              child: Text(point?.w ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          Expanded(
              child: Text(point?.d ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          Expanded(
              child: Text(point?.l ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          Expanded(
              child: Text(point?.gF ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          Expanded(
              child: Text(point?.gA ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          Expanded(
              child: Text(point?.gD ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          Expanded(
              child: Text(point?.p ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
