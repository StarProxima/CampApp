import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageCacheCore {
  static Map<String, Image> _savedImages = {};
  static Map<String, ImageProvider> _savedImageProviders = {};
  static Image load(String url) {
    if (_savedImages[url] == null) {
      log("loading");
      var img = Image.network(url);
      _savedImages[url] = img;
      return img;
    } else {
      log("saved");
      return _savedImages[url]!;
    }
  }

  static ImageProvider loadProvider(String url) {
    if (_savedImageProviders[url] == null) {
      log("loading");
      var img = NetworkImage(url);
      _savedImageProviders[url] = img;
      return img;
    } else {
      log("saved");
      return _savedImageProviders[url]!;
    }
  }
}
