import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  ReportPage({super.key,required this.url,});

  var url;

  @override
  State<ReportPage> createState() => _ReportPageState(url: url);
}

class _ReportPageState extends State<ReportPage> {
  _ReportPageState({required this.url,});

  var url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // color: Colors.white,
          width: 300,
          height: 300,

          margin: const EdgeInsets.only(
            top: 30,
          ),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(
                url,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}