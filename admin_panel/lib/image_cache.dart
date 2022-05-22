import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageCache {
  static Map<String, Image> _savedImages = {};
  Image load(String url) {
    if (_savedImages[url] == null) {
      var img = Image.network(url);
      _savedImages[url] = img;
      return img;
    } else {
      return _savedImages[url]!;
    }
  }
}
