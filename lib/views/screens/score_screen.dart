import 'package:flutter/material.dart';
import 'package:true_premier_football/views/widgets/complete_match_screen.dart';

import '../../consts/app_colors.dart';
import '../widgets/live_screen.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.backgro,
                  border: Border.all(color: Colors.white)),
              child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.backgro2,
                  ),
                  tabs: const [
                    Tab(
                      child: Text(
                        'Live',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Complete',
                        style: TextStyle(color: Colors.white),
                      ),
                      //text: ,
                    ),
                  ]),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Expanded(
              child: TabBarView(
            children: [
              LiveScreen(),
              CompleteMatchScreen(),
            ],
          ))
        ],
      ),
    );
  }
}
