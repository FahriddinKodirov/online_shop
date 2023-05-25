import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/utils/my_colors.dart';
import 'package:online_shop/utils/my_icons.dart';
import 'package:online_shop/utils/my_utils.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification',style: TextStyle(color:MyColors.C_A385AA ),),
        elevation: 0,
      backgroundColor: const Color(0xFFFFFFFF),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: width(context) * 0.03),
            child: SvgPicture.asset(MyIcons.appbarComent),
          ),
      ],
      ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder:(context, index) {
          return ListTile(
            tileColor: Colors.grey[200],
            leading: CircleAvatar(
              radius: height(context)*0.04,
              backgroundImage: AssetImage('assets/images/photo.png',),),
            minVerticalPadding: height(context)*0.03,
            title: Text('Lisa',style: TextStyle(fontSize: height(context)*0.03,fontWeight: FontWeight.w700),),
            subtitle: const Text('asas afsasf asfa asf'),
            trailing: const Text('now'),
          );
        },),
    );
  }
}