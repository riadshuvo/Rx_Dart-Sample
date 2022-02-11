

import 'package:flutter/material.dart';
import 'package:rx_dart_sample/api_repo/api_manager.dart';
import 'package:rx_dart_sample/model/photo_model.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({Key? key}) : super(key: key);

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {

   List<PhotoModel> _photoView = [];
  final HttpResponse _response = HttpResponse();


  @override
  void initState() {
    getPhotos();
    super.initState();
  }

  getPhotos() async{
    _photoView = await _response.getPhotos(1).then((value) => value);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photos'),),
      body: Container(
        height: 500,
        child: ListView.builder(
            itemCount: _photoView.length,
            itemBuilder: (context, index){
              return Container(
                height: 100,
                width: 200,
                child: Image.network(_photoView[index].downloadUrl!),
              );
            }),
      ),
    );
  }
}
