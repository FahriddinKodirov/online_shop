import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:online_shop/utils/my_utils.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          color: const Color(0xFFFFFFFF),
          height: height(context)*0.18,
          width: width(context),
           child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: height(context)*0.1,
                  width: width(context)*0.3,
                  decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(height(context)*0.02),
                  color: Colors.red,
                    image:const DecorationImage(image: AssetImage('assets/images/background.png'),fit: BoxFit.cover)
                  ),
                ),
              );
           },),
         );
  }
}