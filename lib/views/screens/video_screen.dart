import 'package:flutter/material.dart';
import 'package:true_premier_football/views/widgets/video_screen_widgets.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const VideoScreenWidegts();
      },
    );
  }
}
