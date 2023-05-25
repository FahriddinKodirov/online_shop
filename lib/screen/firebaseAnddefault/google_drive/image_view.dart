import 'package:flutter/material.dart';

class imageview extends StatefulWidget {
 imageview({super.key, 
    required this.url,}); 


  String url;

  @override
  State<imageview> createState() => _imageviewState(
        url: url,);
}

class _imageviewState extends State<imageview> {
  String url;
  _imageviewState({
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}