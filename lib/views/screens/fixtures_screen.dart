import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:true_premier_football/models/match_fixture_model.dart';

import '../../controllers/fixturecontroller.dart';
import '../widgets/fixture_widgets.dart';

class FixturesScreen extends StatefulWidget {
  const FixturesScreen({Key? key}) : super(key: key);

  @override
  State<FixturesScreen> createState() => _FixturesScreenState();
}

class _FixturesScreenState extends State<FixturesScreen> {
  HomeController homeController = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();

    homeController.loadMatches();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => homeController.loadMatches(),
      child: Obx(() => !homeController.isLoading.value
          ? (homeController.matchFixture.value.rexFix?.length ?? 0) > 0
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount:
                      homeController.matchFixture.value.rexFix?.length ?? 0,
                  itemBuilder: (context, index) {
                    RexFix? fixture =
                        homeController.matchFixture.value.rexFix?[index];
                    return FixtureWidgets(fixture);
                  },
                )
              : const Center(child: Text("Data is not available"))
          : const Center(child: CircularProgressIndicator())),
    );
  }
}
// Shimmer.fromColors(
//                 baseColor: Colors.grey.shade300,
//                 highlightColor: Colors.grey.shade100,
//                 enabled: _enabled,
//                 child: ListView.builder(
//                   itemBuilder: (_, __) => Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Container(
//                                 width: 30.0,
//                                 height: 25.0,
//                                 color: Colors.white,
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8.0),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Container(
//                                       width: 100,
//                                       height: 12.0,
//                                       color: Colors.white,
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 2.0),
//                                     ),
//                                     Container(
//                                       width: 50,
//                                       height: 10.0,
//                                       color: Colors.white,
//                                     ),
//                                     const Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 2.0),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width: 25.0,
//                                 height: 10.0,
//                                 color: Colors.white,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             height: 1,
//                             width: Get.width,
//                             color: Colors.grey[200],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   itemCount:
//                       homeController.matchFixture.value.rexFix?.length ?? 0,
//                 ),
//               ),