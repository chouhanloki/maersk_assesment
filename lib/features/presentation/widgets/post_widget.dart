import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget{
  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  TextEditingController? newTitleController,newDescriptionController,mediaFromGalleryController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newTitleController = TextEditingController();
    newDescriptionController = TextEditingController();
    mediaFromGalleryController = TextEditingController();
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
                controller: newTitleController,
                decoration: const InputDecoration(
                    hintText: 'New Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: newDescriptionController,
                decoration: const InputDecoration(
                    hintText: 'New Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller:mediaFromGalleryController ,
                decoration: const InputDecoration(
                    hintText: 'Media(Photo from gallery)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ))),
          ),

        ],
      ),
    );
  }
}