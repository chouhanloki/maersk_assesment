import 'package:assesment/core/utils/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedWidget extends StatefulWidget {
  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  TextEditingController? searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ))),
          ),
          bottomListView(context)
        ],
      ),
    );
  }

  Widget bottomListView(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  const Text(
                    "Title",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10),
                  ),
                  Image.asset(
                    ImagePath.flutterLogo,
                    height: 20,
                    width: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          child: ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.thumb_up_sharp,
                            color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                      )),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.favorite, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
