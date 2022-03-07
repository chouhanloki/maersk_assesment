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
          TextField(
            controller: searchController,
          ),
          bottomListView(context)
        ],
      ),
    );
  }

  Widget bottomListView(BuildContext context) {
    return ListView.builder(itemCount: 2,itemBuilder:(context, index){
      return Card(
        child:Column(
          children: const [
            Text("Title",style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 20 ),),
            Text("Description",style: TextStyle(color: Colors.black,fontWeight:FontWeight.normal,fontSize: 10 ),),

          ],
        ),
      );
    });
  }
}
