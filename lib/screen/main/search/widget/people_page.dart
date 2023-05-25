import 'package:flutter/material.dart';
import 'package:online_shop/utils/my_colors.dart';
import 'package:online_shop/utils/my_utils.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
         itemCount: 10,  
         itemBuilder:(context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context)*0.05,vertical: height(context)*0.012),
          child: Container(
            height: height(context)*0.1,
            width: width(context),
            decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(height(context)*0.02),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width(context)*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:  [
                    CircleAvatar(radius: height(context)*0.04, backgroundImage: const AssetImage('assets/images/photo.png'),),
                    SizedBox(width: width(context)*0.02,),
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Tom krus',style: TextStyle(fontSize: height(context)*0.024,fontWeight: FontWeight.bold),),
                         const Text('follewed by',style: TextStyle(),),
                       ],
                     ),
                  ],),
                  Container(
                    height: height(context)*0.05,
                    width: width(context)*0.22,
                    decoration: BoxDecoration(
                    color: MyColors.C_A385AA,
                      borderRadius: BorderRadius.circular(height(context)*0.01),
                    ),
                    child: const Center(child: Text('Add Friend',style: TextStyle(color: Colors.white),)),
                  )
                ],
              ),
            ),
          ),
        );
      },),
    );
  }
}