import 'package:assesment/core/utils/Strings.dart';
import 'package:assesment/features/presentation/widgets/feed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.postPageTitle),
      ),
      body: FeedWidget(),
    );
  }
}
