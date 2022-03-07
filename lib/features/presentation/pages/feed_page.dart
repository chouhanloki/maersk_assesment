import 'package:assesment/core/routes/routes_name.dart';
import 'package:assesment/core/utils/Strings.dart';
import 'package:assesment/features/presentation/widgets/feed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.feedPageTitle),
      ),
      body: FeedWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.postPage);
        },
      ),
    );
  }
}
