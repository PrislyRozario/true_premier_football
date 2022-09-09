import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';

class VideoScreenWidegts extends StatelessWidget {
  const VideoScreenWidegts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                height: AppSizes.newSize(18),
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
                      "HD Q -1 ".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppSizes.size18,
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
                                    "https://placeit-assets1.s3-accelerate.amazonaws.com/custom-pages/cricket-logo-maker/All-Star-Cricket-Team-Logo-Maker-for-Cricket-Teams.png",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: AppSizes.newSize(7),
                                  height: AppSizes.newSize(7),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: AppColors.backgro,
                                      width: 1.5,
                                    ),
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
                                  child: Image.asset("assets/images/load.png"),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              const SizedBox(height: 5),
                              Flexible(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Text(
                                    "Bangladesh ",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
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
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                            color: AppColors.selected,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 5,
                                            vertical: 5,
                                          ),
                                          child: Text(
                                            'Watch Now',
                                            style: TextStyle(
                                              color: AppColors.text,
                                              fontWeight: FontWeight.w400,
                                              fontSize: AppSizes.size14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ])),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://placeit-assets1.s3-accelerate.amazonaws.com/custom-pages/cricket-logo-maker/All-Star-Cricket-Team-Logo-Maker-for-Cricket-Teams.png",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: AppSizes.newSize(7),
                                  height: AppSizes.newSize(7),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: AppColors.backgro,
                                      width: 1.5,
                                    ),
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
                                  child: Image.asset("assets/images/load.png"),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              const SizedBox(height: 5),
                              Flexible(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Text(
                                    "Pakistan ",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
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
  }
}
