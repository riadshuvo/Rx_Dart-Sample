import 'dart:convert';
import 'dart:developer';

import 'package:rx_dart_sample/model/photo_model.dart';
import 'package:http/http.dart' as http;

class HttpResponse {
  String baseUrl = "https://picsum.photos/v2";

  Future<List<PhotoModel>> getPhotos(int page) async {
    final response =
        await http.get(Uri.parse("$baseUrl/list?page=$page&limit=100"));

    if (response.statusCode == 200) {

      return photoModelFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
